<?php

function deep_geopartner_team() {

    $labels = array(
        'name'                => _x( 'Mitarbeiter', 'Post Type General Name', 'deep_geopartner' ),
        'singular_name'       => _x( 'Mitarbeiter', 'Post Type Singular Name', 'deep_geopartner' ),
        'menu_name'           => __( 'Mitarbeiter', 'deep_geopartner' ),
        'parent_item_colon'   => __( 'Übergeordnete Mitarbeiter', 'deep_geopartner' ),
        'all_items'           => __( 'Alle anzeigen', 'deep_geopartner' ),
        'view_item'           => __( 'Mitarbeiter ansehen', 'deep_geopartner' ),
        'add_new_item'        => __( 'Mitarbeiter hinzufügen', 'deep_geopartner' ),
        'add_new'             => __( 'Neuer Mitarbeiter', 'deep_geopartner' ),
        'edit_item'           => __( 'Mitarbeiter bearbeiten', 'deep_geopartner' ),
        'update_item'         => __( 'Mitarbeiter aktualisieren', 'deep_geopartner' ),
        'search_items'        => __( 'Mitarbeiter durchsuchen', 'deep_geopartner' ),
        'not_found'           => __( 'Keinen Mitarbeiter gefunden', 'deep_geopartner' ),
        'not_found_in_trash'  => __( 'Keinen Mitarbeiter im Papierkorb gefunden', 'deep_geopartner' ),
    );
    $rewrite = array(
        'slug'                => 'team',
        'with_front'          => true,
        'pages'               => true,
        'feeds'               => false,
    );
    $args = array(
        'label'               => __( 'team', 'deep_geopartner' ),
        'description'         => __( 'Eingetragene Mitarbeiter', 'deep_geopartner' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'editor', 'thumbnail', 'page-attributes' ),
        'taxonomies'          => array( 'reference_typen' ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 20,
        'menu_icon'           => 'dashicons-groups',
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'rewrite'             => $rewrite,
        'capability_type'     => 'post',
    );
    register_post_type( 'team', $args );

}

// Hook into the 'init' action
add_action( 'init', 'deep_geopartner_team', 0 );

function set_team_admin_order($wp_query) {
    if(array_key_exists('post_type', $wp_query->query)) {
        // Get the post type from the query
        $post_type = $wp_query->query['post_type'];
        // if it's one of our custom ones
        if ( $post_type == 'team') {
          $wp_query->set('orderby', 'menu_order');
          $wp_query->set('order', 'ASC');
        }
    }
}
add_filter('pre_get_posts', 'set_team_admin_order');