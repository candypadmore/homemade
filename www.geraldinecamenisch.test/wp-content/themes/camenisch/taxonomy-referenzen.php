<?php 
/* Template Name: Referenz Filter */
get_header();?>
     
<div class="container">
    <div class="row ">
        <div class="col-xs-12">
            <article class="row fullwidth">
                <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                    <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
                        <?php if(is_single(get_post())) { ?>
                            <h2><?php the_title(); ?></h2>
                            <?php the_content(); ?>
                        <?php } else { ?>
                            <?php if(get_field('title')!='') { ?>
                                <div class="sitetitle"><?php echo get_field('title'); ?></div>
                            <?php } ?>
                            <h2><?php echo get_field('site_title'); ?></h2>
                            <?php the_content(); ?>
                        <?php } ?>
                    <?php endwhile; endif; ?>       
                </div>
            </article>  
        </div>
        <?php  ?>
        <div class="col-md-12">
            <article class="row fullwidth">
                <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1 search-results-form">
                    <?php
                        //deep_getMapHTML();

                        
                        $pre_sel_dl = '';
                        $pre_sel_dl = $_GET['dl'];

                        if($pre_sel_dl!=''){
                            $args = array(
                                'post_type' => 'reference',
                                'meta_key' => 'period_start',
                                'orderby' => 'meta_value',
                                'order' => 'DESC',
                                'posts_per_page' => -1,
                            );
                        }
                        else{
                            $args = array(
                                'post_type' => 'reference',
                                'meta_key' => 'period_start',
                                'orderby' => 'meta_value',
                                'order' => 'DESC',
                                'posts_per_page' => -1
                            );
                        }

                        $select_cat = get_field('sel_cat');

                        $type_parent_args = array(
                            'parent' => 0
                        );
                        
                        $filterOptionTypen = get_terms('reference_types', $type_parent_args);

                        $type_query = "";
                        if($select_cat && $pre_sel_dl != '') {
                            $type_query = 
                            array('relation' => 'AND',
                                array(
                                    'taxonomy' => 'reference_types',
                                    'terms' => array($select_cat, $pre_sel_dl),
                                    'operator' => 'IN',
                                ),
                            );
                            $args['tax_query'][] = $type_query;
                        } else if($select_cat && $pre_sel_dl == ''){
                            $type_query = array(
                                'taxonomy' => 'reference_types',
                                'terms' => $select_cat,
                                'operator' => 'IN'
                            );

                            $args['tax_query'][] = $type_query;
                        } else {
                            $select_cat = array();
                            foreach($filterOptionTypen as $parent) {
                                $select_cat[] = $parent->term_id;
                            }
                        }

                        $query = new WP_Query($args);


                        $TypeChildren = array();

                        $filterOptionKontakte = get_terms('reference_contacts');
                        

                        $sel_parent_id = array();


                    ?>
                    <form role="form" class="col-xs-12">
                        <div class="col-md-5 col-lg-4">
                            <h3 class="filter-title"><?php echo $lang_string['REFERENCETYPE']; ?></h3>
                        </div>
                        <div class="col-md-7 col-lg-8">
                            <div class="referenz_typ">
                                <select name="reference_types" class="chosen_select maptoolFilter" multiple="true" size="1" data-placeholder="<?php echo $lang_string['SEARCH_REFERENCE']; ?>">
                                    <?php 
                                    $select_cat2 = get_field('sel_cat');
                                    foreach($filterOptionTypen as $type) {
                                            $sel_parent_id .= $type->term_id." ";
                                            if($select_cat2 && in_array($type->term_id, $select_cat2)){
                                                echo '<option value="' . $type->term_id . '" selected>' . $type->name . '</option>';
                                            }
                                            else{
                                                echo '<option value="' . $type->term_id . '">' . $type->name . '</option>';
                                            }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                    </form>
                    <form role="form" class="col-xs-12">
                        <div class="col-md-5 col-lg-4">
                            <h3 class="filter-title"><?php echo $lang_string['SERVICE']; ?></h3>
                        </div>
                        <div class="col-md-7 col-lg-8">
                            <div class="referenz_child">
                                <?php  
                                    $pre_sel_dl = $_GET['dl'];
                                    echo deep_getReferenceChildrenSelectHTML($select_cat, $pre_sel_dl); 
                                ?>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                    <?php echo deep_getMapResultHTML($query); ?>
                </div>
            </article>
        </div>
    </div>
</div>
 <div class="map-wrap" id="mapOverlay">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>
<?php get_footer();?>