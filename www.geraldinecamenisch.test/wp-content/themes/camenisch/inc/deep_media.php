<?php

	/**

	* Adds a category taxonomy for media attachments

	* @return void

	*/

	function deep_taxonomy_media_categories() {

		$labels = array(

        'name'                       => _x( 'Kategorien', 'Taxonomy General Name', 'deep_geopartner' ),

        'singular_name'              => _x( 'Kategorie', 'Taxonomy Singular Name', 'deep_geopartner' ),

        'menu_name'                  => __( 'Kategorien', 'deep_geopartner' ),

        'all_items'                  => __( 'Alle Kategories', 'deep_geopartner' ),

        'parent_item'                => __( 'Übergeordnetes Kategorie', 'deep_geopartner' ),

        'parent_item_colon'          => __( 'Übergeordnetes Kategorie:', 'deep_geopartner' ),

        'new_item_name'              => __( 'Neue Kategorie', 'deep_geopartner' ),

        'add_new_item'               => __( 'Kategorie hinzufügen', 'deep_geopartner' ),

        'edit_item'                  => __( 'Kategorie bearbeiten', 'deep_geopartner' ),

        'update_item'                => __( 'Kategorie aktualisieren', 'deep_geopartner' ),

        'separate_items_with_commas' => __( 'Kategorien durch Komma getrennt', 'deep_geopartner' ),

        'search_items'               => __( 'Kategorien durchsuchen', 'deep_geopartner' ),

        'add_or_remove_items'        => __( 'Kategorien hinzufügen oder entfernen', 'deep_geopartner' ),

        'choose_from_most_used'      => __( 'Meistgenutzte Kategorien', 'deep_geopartner' ),

		);

		

		$args = array(

			'labels'                     => $labels,

			'hierarchical'               => true,

			'public'                     => true,

			'show_ui'                    => true,

			'show_admin_column'          => true,

			'show_in_nav_menus'          => false,

			'show_tagcloud'              => false,

		);

		register_taxonomy( 'attachment_category', 'attachment', $args );

	}

	add_action( 'init', 'deep_taxonomy_media_categories', 0 );

	

	/**

	 * Adds a category filter for media attachments

	 */

	function deep_add_media_category_filter() {

		$screen = get_current_screen();

		if ($screen->id == 'upload') {

			$dropdown_options = array(

				'show_option_all' => __('Alle Kategorien anzeigen', 'deep_geopartner'),

				'hide_empty'   => false,

				'hierarchical' => true,

				'orderby'  => 'name',

				'taxonomy' => 'attachment_category'

			);

			wp_dropdown_categories( $dropdown_options );

		}

	}

	add_action( 'restrict_manage_posts', 'deep_add_media_category_filter' );

	



	/**

	* get all media attachments with category taxonomy.

	* @return currusel view

	*/

	function deep_get_media_category_filter($category) {
		$query_images_args = array(
			'post_type' => 'attachment'
			, 'post_mime_type' =>'image'
			, 'post_status' => 'inherit'
			,'posts_per_page' => -1
			,'tax_query' => array(
				array(
					'taxonomy' => 'attachment_category'
                    ,'field' => 'slug'
                    ,'terms' => array($category)
				)
			)
		);

		
		$query_images = new WP_Query( $query_images_args );
		$query_images = $query_images->posts;
		if(empty($query_images)) return null;
		
		shuffle($query_images);
		$carousel = null;
		// $content = $indicators = null;
		foreach($query_images as $index => $image) {		
			$carousel['content'] .= sprintf("<div class='item  %s'><img src='%s' alt=''/></div>",(($index == 0) ? " active" : null),wp_get_attachment_url( $image->ID ));
			$carousel['indicators'] .= "<li data-target=\"#carousel\" data-slide-to=\"$index\"".($index == 0 ? " class=\"active\"" : null)."></li>";
		}
		return $carousel;
	}

	

	/**

	* get random media attachments .

	* @return currusel view

	*/

	function deep_get_random_media($category,$count) {

		$query_images_args = array(

			  'post_type' => 'attachment'

			, 'post_mime_type' =>'image'

			, 'post_status' => 'inherit'

			, 'posts_per_page' => -1

			,'tax_query' => array(

				array(

					'taxonomy' => 'attachment_category'

                    ,'field' => 'slug'

                    ,'terms' => array($category)

				)

			)

		);

		

		$query_images = new WP_Query( $query_images_args );

	

		 $images = null;

		 $keys = array();

		 if(empty($query_images->posts)) return null;

		while(count($images)< $count){

			$key = array_rand($query_images->posts, 1);

			if(!in_array($key,$keys)){

				$images[] = wp_get_attachment_url($query_images->posts[$key]->ID);	

				$keys[] = $key;

			} 

		}

		

		foreach($images as $image)  printf("<a rel=\"shadowbox\" href=\"%s\"><img src=\"%s\" width=\"200\" height=\"145\"></a>",$image,$image);

	}

	

	

	

		/**

	* get random media attachments .

	* @return currusel view

	*/

	function the_right_slide_images($number) {
		if(empty($number)) $number = 3;
		$post = get_the_ID();
		if(empty($post)) $post = rand_post();
		
		$i = 0;
		$html = null;
		while($i< $number){
			$image = wp_get_attachment_url( get_post_meta($post,'image_'.($i+1), true), 'full' );
			if(!empty($image))
			$html .= sprintf("<a rel=\"shadowbox[album]\" href=\"%s\"><img src=\"%s\" width=\"200\"></a>",$image,$image);
			$i++;
		}
		print $html;
	}

	function rand_post() {
		$args = array( 'post_type' => 'page', 'numberposts' => 1, 'orderby' => 'rand');
		do{
			$post =  get_posts( $args );
			$post =  $post[0];
			$template = get_post_meta( $post->ID, '_wp_page_template', true );		
		}
		while($template != 'default');
		return $post->ID;
	}	

	/**

	* Add thumbnail support

	*/

	add_theme_support( 'post-thumbnails' );

	

	/**

	* get all downloads with category taxonomy.

	* @return currusel view

	* usage [download_by_category category="Tiere"]	

	*/

	function get_downloads_by_category($categories = null) {



		if(!empty($categories)){

			extract(shortcode_atts(array('category'  => 'category'	,'limit' => 'limit'), $categories));

			$categories = explode(",",rtrim($category, ','));

		}

		$downloads = get_downloads($categories);		

		return render_downloads($downloads);

		

	}

	add_shortcode('download_by_category', 'get_downloads_by_category' );

	

	/**

	*	Get a list of downloads by category.

	*	@var category the category of downloads

	*	@var limit the max unit to return default 20

	*/

	function get_downloads($categories = null) {

		$taxonomy = 'attachment_category';

		global $wpdb;

		if(empty($categories)) $categories[] = "download" ;



		foreach($categories AS $index => $category){

			$this_category = get_term_by('name', $category, 'attachment_category');

			if(!empty($this_category)){

				$categories[$index] = $this_category;

				$query = sprintf("SELECT t.*,tt.*"

									." FROM wp_terms AS t"

									." INNER JOIN wp_term_taxonomy AS tt ON t.term_id = tt.term_id "

									." WHERE parent = %d ",$this_category->term_id);

				$children_array =  $wpdb->get_results($query);

				if(empty($children_array)) continue;

				unset($categories[$index]);

				foreach($children_array AS $index => $category) $categories[] = $category;

			}

		}

	

		foreach($categories AS $index => $category){

			$args = array(							

						'post_type' => 'attachment'

						, 'post_status' => 'inherit'

						,'posts_per_page' => -1

						,'tax_query' => array(

								array(

									'taxonomy' => 'attachment_category'

									,'field' => 'slug'

									,'terms' => array($category->slug)

								)

						)

					);

			$arg_downloads = new WP_Query( $args );



			$downloads[$category->name] = $arg_downloads->posts;

		}

		return $downloads;

	}



	/**

	*	make the result of downloads in a table to be displayed

	*	@var download: downloads to display

	*	@var id: if the is only one downloads.

	*/

	function render_downloads($downloads) {

		if(empty($downloads)) return null;

		$header_html = "<div class=\"downloads\">";

					

		$footer_html = "</div>";

		// $category_html = "<h2 class=\"download_title\">%s</h2>"
		$category_html = "<ul class=\"downloadlist\">";
		$html = null;

		foreach($downloads AS $category => $list){

			if(empty($list))	continue;

			else{

				// $html .= sprintf($category_html,$category);
				$html .= $category_html;
				foreach($list AS $d){		

					$html .= "<a href='".$d->guid."' target=\"_blank\" class=\"downloadlist\"/><li>"

						."&nbsp;<img src='".set_icon($d->guid)."'/>&nbsp;"

						.$d->post_title."-".$d->post_excerpt."-".$d->post_content." "
						. "</li></a>";

				}

				$html .= "</ul>";

			}

		}

		if(empty($html)) $html = sprintf("<p>Keine Ergebnisse gefunden</p>");

		return $header_html.$html.$footer_html;

	}