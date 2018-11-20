<?php
require_once('lib/geopartner-load-theme.php');
require_once('inc/wp_footer_nav_walker.php');
require_once('lib/wp_bootstrap_navwalker.php');
require_once('lib/maptool_functions.php');
require_once('lib/archive_getter.php');


    $file = "";
    global $lang_string;
    switch(get_locale()){
        case "de_CH": 
            $file = "lang/de_CH.php";
            require_once($file);
            break;
        case "en_GB":
            $file = "lang/en_GB.php";
            require_once($file);
            break;
        default:
            $file = "lang/default.php";
            require_once($file);
            break;
} 


/* User Role Changes ---------------------------------------------------------*/



/* Roles & Capabilities */

// add_role('geo', 'GeoPartner Superuser', array(
//     'read' => true, // True allows that capability, False specifically removes it.
//     'delete_others_pages' => true,
//     'delete_others_posts' => true,
//     'delete_pages' => true,
//     'delete_posts' => true,
//     'delete_private_pages' => true,
//     'delete_private_posts' => true,
//     'delete_published_pages' => true,
//     'delete_published_posts' => true,
//     'edit_others_pages' => true,
//     'edit_others_posts' => true,
//     'edit_pages' => true,
//     'edit_posts' => true,
//     'edit_private_pages' => true,
//     'edit_private_posts' => true,
//     'edit_published_pages' => true,
//     'edit_published_posts' => true,
//     'manage_categories' => true,
//     'manage_links' => true,
//     'moderate_comments' => true,
//     'publish_pages' => true,
//     'publish_posts' => true,
//     'read' => true,
//     'read_private_pages' => true,
//     'read_private_posts' => true,    
//     'unfiltered_html' => true,
//     'import' => true,
//     'upload_files' => true //last in array needs no comma!
// )); 



/**
 * Register media.
*/  
    require_once( get_template_directory() .'/inc/deep_media.php');

//Styles & Scripts


function geopartner_scripts(){

    // Add scripts
    // watch scripts.js for concatenation list
    // wp_register_script(
    //     'scripts',
    //     get_template_directory_uri() . '/js/min/scripts.min.js',
    //     array(),
    //     '1.0',
    //     true
    // );

    wp_localize_script( 'scripts', 'scripts_data', array( 'ajaxurl' => admin_url( 'admin-ajax.php' ) ) );

    /*
    wp_register_script(
        'scripts',
        'http://maps.googleapis.com/maps/api/js?v=3&sensor=false&callback=initialize',
        array(),
        '1.0',
        true
    ); */

    wp_enqueue_script('scripts');

}
add_action( 'wp_enqueue_scripts', 'geopartner_scripts' );


/**
 * Add TinyMCE Styles
 * @return void
*/

add_filter( 'mce_buttons_2', 'my_mce_buttons_2' );

function my_mce_buttons_2( $buttons ) {
    array_unshift( $buttons, 'styleselect' );
    return $buttons;
}

add_filter( 'tiny_mce_before_init', 'my_mce_before_init' );

function my_mce_before_init( $settings ) {

    $style_formats = array(
        array(
            'title' => 'Block',
            'block' => 'blockqote',
            'wrapper' => true,
            'classes' => 'quote',
        ),
        array(  
            'title' => 'Zitat',  
            'block' => 'footer',  
            'classes' => 'quote',
            'wrapper' => true,
        ),
        array(
            'title' => 'Info Titel',
            'block' => 'div',
            'classes' => 'sitetitle',
            'wrapper' => true,
        ),
    );

    $settings['style_formats'] = json_encode( $style_formats );

    return $settings;

}

add_action( 'admin_init', 'add_my_editor_style' );

function add_my_editor_style() {
    add_editor_style();
}




// Add Custom Fields
require_once(get_template_directory() .'/inc/adcf.php');


// Add team custom post type
// require_once('inc/team.php');

// Add referenze custom post type
// require_once('inc/reference.php');

add_theme_support( 'post-thumbnails' ); 

register_nav_menus( array('primary' => __( 'Primary Menu', 'GeoPartner' ) ) );	
register_nav_menus( array('footer' => __( 'Footer Menu', 'GeoPartner' ) ) );	

if(function_exists('add_image_size')){
    add_image_size('small-carousel', 2000, 1200);
}
add_filter('image_size_names_choose', 'my_image_sizes');
function my_image_sizes($sizes)
{
    $addsizes = array(
        "new-size" => __("New Size")
        );
    $newsizes = array_merge($sizes, $addsizes);
    return $newsizes;
}

/**
 * Rename the standard posts menu to News
 * @return void
 */
function deep_rename_news_menu()
{
    global $menu;
    global $submenu;

    $menu[5][0] = __('News');
    $submenu['edit.php'][5][0] = __('Alle News');
    $submenu['edit.php'][10][0] = __('News hinzufügen');
}

function deep_change_post_object() {
    global $wp_post_types;
    $labels = &$wp_post_types['post']->labels;
    $labels->name = 'News';
    $labels->singular_name = 'News';
    $labels->add_new = 'News hinzufügen';
    $labels->add_new_item = 'Neue News';
    $labels->edit_item = 'News bearbeiten';
    $labels->new_item = 'News';
    $labels->view_item = 'View News';
    $labels->search_items = 'News durchsuchen';
    $labels->not_found = 'Keine News gefunden';
    $labels->not_found_in_trash = 'Keine News im Papierkorb';

    //add menu_order
    add_post_type_support( 'post', array('page-attributes') );
}
add_action('admin_menu', 'deep_rename_news_menu');
add_action( 'init', 'deep_change_post_object' );

function deep_geopartner_news($atts) {
    $args = array(
        'post_type' => 'post',
        'post_status' => 'publish',
        'orderby' => 'menu_order', 
        'order' => 'ASC', 
        'posts_per_page' => 10,
    );
    if(is_array($atts) && array_key_exists('cat', $atts)) {
        $args['category_name'] = $atts['cat'];
    }
    $news = new WP_Query($args);
    ob_start();
    $i= 0;
    while ($news->have_posts()) : $news->the_post(); ?>
        <div class="row content-row">
            <?php
                if (has_post_thumbnail()) {
                    if ($i%2==0) {
                        ?>
                        <div class="col-md-6">
                            <h3><?php the_title(); ?></h3>
                            <?php the_content(); ?>
                        </div>
                        <div class="col-md-6"><?php the_post_thumbnail(); ?></div>
                        <?php
                    } else {
                        ?>
                        <div class="col-md-6"><?php the_post_thumbnail(); ?></div>
                        <div class="col-md-6">';
                            <h3><?php the_title(); ?></h3>
                            <?php the_content(); ?>
                        </div>
                        <?php
                    }
                   ?>
                   <?php
                } else { ?>
                    <div class="col-md-12">
                        <h3><?php the_title(); ?></h3>
                        <?php the_content(); ?>
                    </div>
                    <?php
                }
            ?>

        </div>
        <hr>
    <?php $i++; endwhile;
    wp_reset_query();
    return ob_get_clean();
}


function ws_preselect_post_category() {
    $category = 1;
    if ( isset($category) && is_numeric($category) ) {
        $catId = intval($category);
        ?>
        <script type="text/javascript">
            jQuery(function() {
                var catId = <?php echo json_encode($catId); ?>;
                jQuery('#in-category-' + catId).click();
            });
        </script>
        <?php
    }
}
add_action('admin_footer-post-new.php', 'ws_preselect_post_category');


/* Download Modul ------------------------------------------------------------*/

/**
    *   add to the Url http and https if tehre isn't
    *   @var url : the url to rectify
    */  
    function recognizes_url ($url) {
        if(empty($url)) return null;
        if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
            $url = "http://" . $url;
        }
        return $url;    
    }
    
    /**
    *   render the Url without http and https
    *   @var url : the url to rectify
    */
    function remove_http($url) {
        $disallowed = array('http://', 'https://');
         return str_replace($disallowed , '', $url);
    }   
    
    /**
    *   render the formatted date
    *   @var date : the date to format
    */
    function format_date($date) {
         return mysql2date( "d.m.Y", $date );
    }   

    /**
    *   render the mime type of document
    *   @var mime_type : the mime type to rectify
    */
    function format_mime_type($mime_type) {
        $link = get_template_directory_uri()."/img/";
        $img  = explode("/",$mime_type);
        $img  = end($img);
        return $link.$img.".png";
    }   
    
    /**
    *   render the mime type of document
    *   @var mime_type : the mime type to rectify
    */
    function set_icon($filename) {
        $path_uri = get_template_directory_uri() . "/img/filetypes/";
        $path = get_template_directory() . "/img/filetypes/";
        $icon = pathinfo($filename, PATHINFO_EXTENSION) . ".png";
        return file_exists($path.$icon) ? $path_uri . $icon : $path_uri . "default.png";
    }   

    /**
    *   render the time in ein Format
    *   @var format : the format
    */
    function formatdate($format,$time = null) {
        return date($format,(empty($time) ? time() : $time));
    }   

    function deep_delete_reference_posts(){
        $type = 'reference';
        if($_POST['delete_ask']){
            $delete_ask = $_POST['delete_ask'];
        }
        $ref_args = array(
            'post_type' => $type,
            'post_status' => 'publish',
            'posts_per_page' => -1,
            'caller_get_posts' => 1
        );

        $my_ref_query = null;
        $my_ref_query = new WP_Query($ref_args);
        $count_ref = $my_ref_query->found_posts;
        if(!$_POST['delete_ask']){
            if($count_ref == 1){
                echo "<p>Es wurde ".$my_ref_query->found_posts." Referenz gefunden.</p>";
            } else if($count_ref > 1){
                echo "<p>Es wurden ".$my_ref_query->found_posts." Refernzen gefunden.</p>";
            } else{
                echo "<p>Es wurden keine Referenzen gefunden.</p>";
            }
        }
        if($my_ref_query->have_posts()){

            if($_POST['delete_ask']){
                if($delete_ask){
                ?> <p>
                
                <?php
                    while($my_ref_query->have_posts()){
                        $my_ref_query->the_post();
                        wp_delete_post( get_the_id(),true);
                        if($_POST['ref_count'] > 1){
                            echo $_POST['ref_count']." Referenzen wurden unwiederruflich gel&ouml;scht";
                        }
                        else if($_POST['ref_count'] == 1){
                            echo $_POST['ref_count']." Referenz wurde unwiederruflich gel&ouml;scht";
                        }
                    }

                ?> </p> <?php
                }

            } ?>

            <form method="POST">
                <input id="delete_ask" type="checkbox" name="delete_ask" value="Eintr&auml;ge unwiederruflich l&ouml;schen?"> <label for="delete_ask">Referenzen unwiederruflich l&ouml;schen?</label>
                <input type="hidden" name="ref_count" value="<?php echo $count_ref; ?>"><br><br>
                <input type="submit" value="Save" class="button button-primary button-large">
            </form>
            <?php
        }
    }

    add_action('admin_menu', 'add_custom_post_menu');

    function add_custom_post_menu(){
        add_submenu_page( 'edit.php?post_type=reference', 'CSV Import', 'CSV Import', 'import', '/admin.php?import=csv', '');
        add_submenu_page( 
            'edit.php?post_type=reference', 
            'Alle Referenzen Löschen', 
            'Alle Referenzen Löschen', 
            'import', 
            'delete_posts',
            'deep_delete_reference_posts'
        );
    }

/* WIDGETS ------------------------------------------------------------*/

$args_leftside = array(
        'name' => 'Footer Left',
        'id'   => 'footer-left-widget',
        'description'   => 'Left Footer widget position.',
        'class'         => 'col-md-3 col-sm-6 col-xs-6',
        'before_widget' => '<div id="%1$s" class="%2$s">',
        'after_widget'  => '</div>',
        'before_title'  => '<h2>',
        'after_title'   => '</h2>'
    );

$args_centerside = array(
        'name' => 'Footer Center',
        'id'   => 'footer-center-widget',
        'description'   => 'Centre Footer widget position.',
        'class'         => 'col-md-3 hidden-sm hidden-xs',
        'before_widget' => '<div id="%1$s" class="%2$s">',
        'after_widget'  => '</div>',
        'before_title'  => '<h2>',
        'after_title'   => '</h2>'
    );

$args_rightside = array(
        'name' => 'Footer Right',
        'id'   => 'footer-right-widget',
        'description'   => 'Right Footer widget position.',
        'class'         => 'col-md-3 hidden-sm hidden-xs',
        'before_widget' => '<div id="%1$s" class="%2$s">',
        'after_widget'  => '</div>',
        'before_title'  => '<h2>',
        'after_title'   => '</h2>'
    );


if (function_exists('register_sidebar')) {
    register_sidebar($args_leftside);

    register_sidebar($args_centerside);

    register_sidebar($args_rightside);

    register_sidebar(array(
        'name' => 'Header Language Switcher',
        'id'   => 'header_language_switcher',
        'description'   => 'Sidebar for Language switcher.',
        'before_widget' => '<div id="%1$s">',
        'after_widget'  => '</div>',
        'before_title'  => '<h2>',
        'after_title'   => '</h2>'
    ));    


}


add_filter( 'excerpt_length', 'new_excerpt_length' );
function new_excerpt_length( $more ) {
    if(is_front_page()){
        if(has_post_thumbnail()){
            return 30;
        } else {
            return 30;
        }
    } else {
        return 100;
    }
}

// Register Custom Widgets
include_once( 'inc/footer-left-widget.php' );
include_once( 'inc/footer-center-widget.php' );
include_once( 'inc/footer-right-widget.php' );

register_widget( 'geopartner_left_footer_widget' );
register_widget( 'geopartner_center_footer_widget' );
register_widget( 'geopartner_right_footer_widget' );


//require_once( get_template_directory() .'/inc/footer-left-widget.php');
//require_once( get_template_directory() .'/inc/footer-center-widget.php');
//require_once( get_template_directory() .'/inc/footer-right-widget.php');

// Unregister all default widgets
 function remove_default_widgets() {
     unregister_widget('WP_Widget_Pages');
     unregister_widget('WP_Widget_Calendar');
     unregister_widget('WP_Widget_Archives');
     unregister_widget('WP_Widget_Links');
     unregister_widget('WP_Widget_Meta');
     unregister_widget('WP_Widget_Search');
     unregister_widget('WP_Widget_Text');
     unregister_widget('WP_Widget_Categories');
     unregister_widget('WP_Widget_Recent_Posts');
     unregister_widget('WP_Widget_Recent_Comments');
     unregister_widget('WP_Widget_RSS');
     unregister_widget('WP_Widget_Tag_Cloud');
     unregister_widget('WP_Nav_Menu_Widget');
 }
 add_action('widgets_init', 'remove_default_widgets', 11);


?>