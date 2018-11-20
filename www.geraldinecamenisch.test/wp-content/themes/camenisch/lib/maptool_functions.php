<?php
// add maptool AJAX
add_action( 'wp_ajax_deep_maptool_search', 'deep_maptool_search_callback' );
add_action( 'wp_ajax_nopriv_deep_maptool_search', 'deep_maptool_search_callback' );

function deep_search_by_title_filter($where, &$wp_query) {
    global $wpdb;
    if ( $search_term = $wp_query->get( 'search_prod_title' ) ) {
        $where .= ' AND ' . $wpdb->posts . '.post_title LIKE \'%' . esc_sql( $search_term ) . '%\'';
    }
    return $where;
}

function deep_maptool_search_callback() {
    global $wpdb; // this is how you get access to the database

    $args = array(
        'post_type' => 'reference',
        'meta_key' => 'period_start',
        'orderby' => 'meta_value',
        'order' => 'DESC',
        'posts_per_page' => -1,
    );

    // Type Filter
    $type_query = "";
    if(is_array($_POST['type'])) {
        $type_query = array(
            'taxonomy' => 'reference_types',
            'terms' => $_POST['type'],
            'operator' => 'IN'
        );
        $references = $_POST['type'];
    } else {
        $filterOptionTypen = get_terms('reference_types', array('taxonomy' => 'reference_types','parent'=>0)); 
        $references = array();
        foreach($filterOptionTypen as $parent) {
            $references[] = $parent->term_id;
        }
    }

    if(is_array($type_query)) {
        $args['tax_query'][] = $type_query;
    }
    
    $child_query = "";
    if(is_array($_POST['child'])) {
        $child_query = array(
            'taxonomy' => 'reference_types',
            'field' => 'term_id',
            'terms' => $_POST['child'],
            'operator' => 'IN'
        );
    }

    if(is_array($child_query)) {
        $args['tax_query'][] = $child_query;
    }


    $periodstart_query = "";
    if(is_array($_POST['period_start'])) {
        $periodstart_query = array(
            'taxonomy' => 'reference',
            'terms' => $_POST['period_start'],
            'operator' => 'IN'
        );
    }

    if(is_array($periodstart_query)) {
        $args['tax_query'][] = $periodstart_query;
    }

    $periodend_query = "";
    if(is_array($_POST['period_end'])) {
        $periodend_query = array(
            'taxonomy' => 'reference',
            'terms' => $_POST['period_end'],
            'operator' => 'IN'
        );
    }

    if(is_array($periodend_query)) {
        $args['tax_query'][] = $periodend_query;
    }

    //  Filter

    $query = new WP_Query($args);

    $detail = array();
    $detail['search_result'] = deep_getMapResultHTML($query);
    $detail['referenz_child'] = deep_getReferenceChildrenSelectHTML($references, $pre_select);
    echo json_encode($detail);

    die(); // this is required to terminate immediately and return a proper response
}

function deep_getReferenceChildrenSelectHTML($references, $pre_select = 0) {
    foreach($references as $parent_id){
        $TypeChildren[] = get_terms('reference_types', array('taxonomy' => 'reference_types','parent'=>$parent_id)); 
    }
    ob_start(); ?>
    <?php 
    $sel_children = $_POST['child'];
    $lang_string = $GLOBALS['lang_string'];
    ?>
    <select name="reference_child" class="chosen_select maptoolFilter" multiple="true" size="1" data-placeholder="<?php echo $lang_string['SEARCH_SERVICE']; ?>">
        <?php foreach($TypeChildren as $children) {
            foreach($children as $child){
                if($_POST['child'] &&  in_array($child->term_id, $sel_children) || $child->term_id == $pre_select){
                    echo '<option value="' . $child->term_id . '" selected>' . $child->name . '</option>';
                }
                else{
                    echo '<option value="' . $child->term_id . '">' . $child->name . '</option>';
                }
            }
        } ?>
    </select>
    <?php 
    $output = ob_get_contents();
    ob_end_clean();

    return $output;
}

function deep_getMapResultHTML($query) {
	ob_start();
	?>
    <div class="interface-results">
        <?php $i = 0; ?>
        <?php $markerCounter = 0;

        if($query->have_posts()){

        ?>

        <?php 
        $lang_string = $GLOBALS['lang_string'];
        ?>
        <?php 

        /*
          function compare_fullname($a, $b)
          {
            // sort by last name
            $retval = strnatcmp($a['PERIOD'], $b['lastname']);
            // if last names are identical, sort by first name
            if(!$retval) $retval = strnatcmp($a['firstname'], $b['firstname']);
            return $retval;
          }

          // sort alphabetically by firstname and lastname
          usort($query, 'compare_fullname');
          */
        ?>

        <table id="reference_table" class="table-striped footable sortable search-result-container col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <thead>
            <tr>
                <th class="header" data-toggle="true" scope="col"><?php echo $lang_string['PROJECT']; ?></th>
                <!-- <th class="header" data-hide="phone" scope="col">Referenz-Kategorie</th> -->
                <th class="header" id="period-head" data-hide="phone" scope="col"><?php echo $lang_string['PERIOD']; ?></th>
                <?php /* <th class="header" data-hide="phone" scope="col">Kontakt</th> */ ?>
                
            </tr>
        </thead>
        <?php while($query->have_posts()) : $query->the_post(); 
                // $args = array('orderby' => 'meta_value_num','meta_key' => 'period_start', 'order' => 'ASC', 'fields' => 'all');
                // $members = get_field('kontakte');

                $contact_name = '';

                $n = 0;
                if(empty($members)){}
                else{
                    foreach($members as $member){
                        if($n== 0){
                            $contact_name .= $member->post_title;
                        }
                        else{
                                $contact_name .= ', '.$member->post_title;
                        }
                    }
                }

                $categorynames = get_the_terms(get_the_id(), 'reference_types');
                
                $period_start = get_field('period_start');
                $period_end = get_field('period_end');
            ?>
            <tr>
                <td>
                    <?php /* <a class="search-result" href="<?php the_permalink(); ?>" data-detail="<?php echo $i; ?>" <?php if(get_field('deep_map_position')) { echo 'data-marker="' . $markerCounter . '"'; } ?>> */ ?>
                        <p class="search-result-detail"><?php echo the_title(); ?></p>
                    <?php /* </a> */ ?>
                </td>
                <!-- 
                <td>
                    <?php
                        $n = 0;$
                        $catnamestr = ' ';
                        foreach($categorynames as $categoryname){
                            if($n == 0){
                                $catnamestr = $categoryname -> name;
                            }        
                            else{
                                $catnamestr .= ', '.$categoryname -> name;
                            }  
                            $n++;
                        } 
                        echo $catnamestr;
                    ?>
                </td> 
                -->
                <?php
                    $customsort_key = 0;
                    if($period_end != "" && $period_end != $period_start){ $customsort_key = $period_start.$period_end; } 
                    else if($period_end == ""){ $customsort_key = $period_start."9999"; } 
                    else{ $customsort_key = $period_start.$period_end; } ?>
                <td sorttable_customkey="<?php echo $customsort_key; ?>">
                    <?php
                        if($period_end != "" && $period_end != $period_start) {
                            echo $period_start.'&nbsp;-&nbsp;'.$period_end;
                        }
                        else if($period_end == ""){
                            echo "seit ".$period_start;
                        }
                        else{
                            echo $period_start;
                        }
                    ?>    
                </td>
                <td>
                        <?php echo $contact_name; ?>
                </td>
                <?php /*
                <td>
                    <a class="info" href="<?php the_permalink(); ?>">Info</a>
                </td>
                */ ?>
            </tr>
            <?php
                $i++;
                if($i % 4 == 0) {
                    echo '<div class="clearfix visible-xs-block visible-sm-block visible-md-block visible-lg-block"></div>';
                } else if($i % 2 == 0) {
                    echo '<div class="clearfix visible-xs-block visible-sm-block visible-md-block"></div>';
                }
            ?>
        <?php endwhile; ?>
        </table>
        <?php } ?>
    </div>
	<?php
	$output = ob_get_contents();
	ob_end_clean();
	return $output;
}
