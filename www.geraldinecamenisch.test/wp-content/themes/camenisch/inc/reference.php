<?php

function deep_geopartner_reference() {

    $labels = array(
        'name'                => _x( 'Referenzen', 'Post Type General Name', 'deep_geopartner' ),
        'singular_name'       => _x( 'Referenz', 'Post Type Singular Name', 'deep_geopartner' ),
        'menu_name'           => __( 'Referenzen', 'deep_geopartner' ),
        'parent_item_colon'   => __( 'Übergeordnete Referenzen', 'deep_geopartner' ),
        'all_items'           => __( 'Alle anzeigen', 'deep_geopartner' ),
        'view_item'           => __( 'Referenz ansehen', 'deep_geopartner' ),
        'add_new_item'        => __( 'Referenz hinzufügen', 'deep_geopartner' ),
        'add_new'             => __( 'Neue Referenz', 'deep_geopartner' ),
        'edit_item'           => __( 'Referenz bearbeiten', 'deep_geopartner' ),
        'update_item'         => __( 'Referenz aktualisieren', 'deep_geopartner' ),
        'search_items'        => __( 'Referenzen durchsuchen', 'deep_geopartner' ),
        'not_found'           => __( 'Keine Referenzen gefunden', 'deep_geopartner' ),
        'not_found_in_trash'  => __( 'Keine Referenzen im Papierkorb gefunden', 'deep_geopartner' ),
    );
    $rewrite = array(
        'slug'                => 'reference',
        'with_front'          => true,
        'pages'               => true,
        'feeds'               => false,
    );
    $args = array(
        'label'               => __( 'reference', 'deep_geopartner' ),
        'description'         => __( 'Eingetragene Referenzen', 'deep_geopartner' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'editor', 'thumbnail', 'page-attributes' ),
        'taxonomies'          => array( 'reference_typen','reference_contacts' ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 20,
        'menu_icon'           => 'dashicons-format-aside',
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'rewrite'             => $rewrite,
        'capability_type'     => 'post',
    );
    register_post_type( 'reference', $args );

}

// Hook into the 'init' action
add_action( 'init', 'deep_geopartner_reference', 0 );

function deep_geopartner_reference_types()  {

    $labels = array(
        'name'                       => _x( 'Typen', 'Taxonomy General Name', 'deep_geopartner' ),
        'singular_name'              => _x( 'Typ', 'Taxonomy Singular Name', 'deep_geopartner' ),
        'menu_name'                  => __( 'Typen', 'deep_geopartner' ),
        'all_items'                  => __( 'Alle Typen', 'deep_geopartner' ),
        'parent_item'                => __( 'Übergeordnete Typen', 'deep_geopartner' ),
        'parent_item_colon'          => __( 'Übergeordnete Typen:', 'deep_geopartner' ),
        'new_item_name'              => __( 'Neuer Typ', 'deep_geopartner' ),
        'add_new_item'               => __( 'Typ hinzufügen', 'deep_geopartner' ),
        'edit_item'                  => __( 'Typ Bearbeiten', 'deep_geopartner' ),
        'update_item'                => __( 'Typ bearbeiten', 'deep_geopartner' ),
        'separate_items_with_commas' => __( 'Typ durch Komma getrennt', 'deep_geopartner' ),
        'search_items'               => __( 'Typ durchsuchen', 'deep_geopartner' ),
        'add_or_remove_items'        => __( 'Typ hinzufügen/entfernen', 'deep_geopartner' ),
        'choose_from_most_used'      => __( 'Meistgenutzte Typen', 'deep_geopartner' ),
    );
    $rewrite = array(
        'slug'                       => 'reference_types',
        'with_front'                 => true,
        'hierarchical'               => true,
    );
    $args = array(
        'labels'                     => $labels,
        'hierarchical'               => true,
        'public'                     => true,
        'show_ui'                    => true,
        'show_admin_column'          => true,
        'show_in_nav_menus'          => true,
        'show_tagcloud'              => true,
        'rewrite'                    => $rewrite,
    );
    register_taxonomy( 'reference_types', 'reference', $args );
}

// Hook into the 'init' action
add_action( 'init', 'deep_geopartner_reference_types', 0 );

/*

function deep_geopartner_reference_contacts()  {

    $labels = array(
        'name'                       => _x( 'Kontakte', 'Taxonomy General Name', 'deep_geopartner' ),
        'singular_name'              => _x( 'Kontakt', 'Taxonomy Singular Name', 'deep_geopartner' ),
        'menu_name'                  => __( 'Kontakte', 'deep_geopartner' ),
        'all_items'                  => __( 'Alle Kontakte', 'deep_geopartner' ),
        'parent_item'                => __( 'Übergeordnete Kontakte', 'deep_geopartner' ),
        'parent_item_colon'          => __( 'Übergeordnete Kontakte:', 'deep_geopartner' ),
        'new_item_name'              => __( 'Neuer Kontakt', 'deep_geopartner' ),
        'add_new_item'               => __( 'Kontakt hinzufügen', 'deep_geopartner' ),
        'edit_item'                  => __( 'Kontakt Bearbeiten', 'deep_geopartner' ),
        'update_item'                => __( 'Kontakt bearbeiten', 'deep_geopartner' ),
        'separate_items_with_commas' => __( 'Kontakte durch Komma getrennt', 'deep_geopartner' ),
        'search_items'               => __( 'Kontakte durchsuchen', 'deep_geopartner' ),
        'add_or_remove_items'        => __( 'Kontakt hinzufügen/entfernen', 'deep_geopartner' ),
        'choose_from_most_used'      => __( 'Meistgenutzte Kontakte', 'deep_geopartner' ),
    );
    $rewrite = array(
        'slug'                       => 'reference_contacts',
        'with_front'                 => true,
        'hierarchical'               => true,
    );
    $args = array(
        'labels'                     => $labels,
        'hierarchical'               => false,
        'public'                     => true,
        'show_ui'                    => true,
        'show_admin_column'          => true,
        'show_in_nav_menus'          => true,
        'show_tagcloud'              => true,
        'rewrite'                    => $rewrite,
    );
    register_taxonomy( 'reference_contacts', 'reference', $args );
}

// Hook into the 'init' action
add_action( 'init', 'deep_geopartner_reference_contacts', 0 );

*/

function set_reference_admin_order($wp_query) {
    if(array_key_exists('post_type', $wp_query->query)) {
        // Get the post type from the query
        $post_type = $wp_query->query['post_type'];
        // if it's one of our custom ones
        if ( $post_type == 'reference') {
          $wp_query->set('orderby', 'menu_order');
          $wp_query->set('order', 'ASC');
        }
    }
}



add_filter('pre_get_posts', 'set_reference_admin_order');



// add shortcode [reference]
function deep_geopartner_reference_display( $atts ){
    extract(shortcode_atts(array( 'type' => 'Typ', 'contact' => 'Kontakt' ), $atts) );
    ob_start();

    $typen = get_terms('reference_typen');
    //$typen[] = $art;
    $args = array(
        'post_type' => 'reference',
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'orderby' => 'menu_order',
        'order' => 'ASC'
    );

    foreach($typen as $art)
    {
        /*
        if(is_array($atts) && array_key_exists('contact', $atts)) {
            $args['tax_query'] = array(
                array(
                    'taxonomy' => 'reference_contact',
                    'field' => 'slug',
                    'terms' => $atts['type'],
                    'operator' => 'IN'
                )
            );

            $type = get_term_by('slug', $atts['type'], 'reference_contact');
        }
        */

        $args['tax_query'][] = array(
            'relation' => 'AND',
            array(
                'taxonomy' => 'reference_typen',
                'field' => 'slug',
                'terms' => $art->slug
            )
        );
        $references = new wp_Query($args);
        if($references->have_posts())
        {
            ?>
            <div class="ref-pad">
                <h3><?php echo $art->name; ?></h3>
            <?php
            while ( $references->have_posts() ) : $references->the_post(); 
                        if(has_post_thumbnail()) {
                            $image = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'medium' );
                            $element = array();
                            if(1 < $image[1]/$image[2]) {
                                $class = "col-sm-12";
                            } else {
                                $class = "col-sm-12";
                            }
                            if($image[1] < 550 ) {
                                if(1 > $image[1]/$image[2]) {
                                    $class = "col-sm-12 col-md-6 scaleHeight";
                                } else {
                                    $class = "col-sm-12 col-md-6";
                                }
                            }
                            ?>
                                <div class="<?php echo $class; ?> ref-images">
                                    <div class="ref-img-wrap">
                                        <div class="description">
                                            <p>
                                                <strong><?php echo get_the_title(); ?></strong><br>
                                                <span><?php echo get_the_content(); ?></span><br>  
                                            </p>
                                        </div>
                                        <?php echo get_the_post_thumbnail(); ?>
                                    </div>
                                </div>
                            <?php
                        }
                        else{
                            ?>
                                <div class="col-sm-12 col-md-12">
                                    <div class="content-box reference-quote">
                                        <h3><?php echo get_the_title(); ?></h3>
                                        <p class="col-xs-12 quote">
                                            <?php echo get_the_content(); ?>
                                        </p>
                                    </div>
                                </div>
                            <?php
                        }
            endwhile;
        ?>
            </div> 
        <?php
        }
    }
    return ob_get_clean();
}
add_shortcode( 'reference', 'deep_geopartner_reference_display' );







//include the main class file
require_once('tax-meta-class/tax-meta-class.php');

/* 

// configure taxonomy custom fields

$config = array(
   'id' => 'reference_meta_box',                    // meta box id, unique per meta box
   'title' => 'Reference Meta Box',                 // meta box title
   'pages' => array('reference_contacts'),           // taxonomy name, accept categories, post_tag and custom taxonomies
   'context' => 'normal',                           // where the meta box appear: normal (default), advanced, side; optional
   'fields' => array(),                             // list of meta fields (can be added by field arrays)
   'local_images' => true,                          // Use local or hosted images (meta box images for add/remove)
   'use_with_theme' => true                         //change path if used with theme set to true, false for a plugin or anything else for a custom path(default false).
);
 

// Initiate your taxonomy custom fields

 
$my_meta = new Tax_Meta_Class($config);
 
 

// Add fields 

 

//Image field
$my_meta->addImage('contact_image',array('name'=> 'Bild'));
//text field
$my_meta->addText('contact_info',array('name'=> 'Zusatzinfo'));
//text field
$my_meta->addText('contact_email',array('name'=> 'Email'));
//text field
$my_meta->addText('contact_tel',array('name'=> 'Tel.'));


// Don't Forget to Close up the meta box deceleration

//Finish Taxonomy Extra fields Deceleration
$my_meta->Finish();

*/


$config2 = array(
    'id' => 'team_meta_box',
    'title' => 'Team Meta Box',
    'pages' => array('reference_types'),
    'context' => 'side',
    'fields' => array(),
    'local_images' => true,
    'use_with_theme' => true

);