<?php

// add maptool AJAX
add_action( 'wp_ajax_deep_archive_search', 'deep_archive_search_callback' );
add_action( 'wp_ajax_nopriv_deep_archive_search', 'deep_archive_search_callback' );

function deep_archive_search_callback(){

	global $wpdb;

	$year = $_POST['year'];
	$month = $_POST['month'];

	$query = new WP_Query( 'category_name=news&year='.$year.'&monthnum='.$month.'&post_status=publish' );

	$queryen = new WP_Query( 'category_name=allgemein-en&year='.$year.'&monthnum='.$month.'&post_status=publish' );

	$detail = array();

	switch (get_locale()) :

		case "de_CH":
			$detail['archive_result'] = deep_getArchiveResultHTML($query,$year,$month);
			break;

		case "en_GB":
			$detail['archive_result'] = deep_getArchiveResultHTMLen($queryen,$year,$month);
			break;
		endswitch;


	echo json_encode($detail);

	die();
}

function deep_getArchiveResultHTML($query,$year,$month){
	ob_start();
	$lang_string = $GLOBALS['lang_string'];
	?>
	<div class="interface-results">
		<?php $i = 0; ?>
		<?php $markerCounter = 0; 
		
		if($query->have_posts()) : while($query->have_posts()) : $query->the_post(); 
		?>
			<div class="col-md-12 center">
				<h3 class="archive-result-title">
					<a class="archive-result" href="<?php the_permalink(); ?>" data-detail="<?php echo $i; ?>">
						<?php echo the_title(); ?>
					</a>
				</h3>
				<p class="archive-date"><?php the_date('j/m/Y'); ?></p>
				<?php echo the_excerpt(); ?>
				<a class="btn btn-orange archive-button" href="<?php the_permalink(); ?>">Zur Mitteilung &raquo;</a>
			</div>
		<?php endwhile; else:
			echo '<p>'.$lang_string['NEWS_NO_ENTRY'].'</p>';
		endif;
		?>
	</div>
	<?php

$output = ob_get_contents();
ob_end_clean();
return $output;

}

function deep_getArchiveResultHTMLen($queryen,$year,$month){
	ob_start();
	$lang_string = $GLOBALS['lang_string'];
	?>
	<div class="interface-results">

		<?php $i = 0; ?>
		<?php $markerCounter = 0;

		if($queryen->have_posts()) : while($queryen->have_posts()) : $queryen->the_post();
			?>
			<div class="col-md-12 center">
				<h3 class="archive-result-title">
					<a class="archive-result" href="<?php the_permalink(); ?>" data-detail="<?php echo $i; ?>">
						<?php echo the_title(); ?>
					</a>
				</h3>
				<p class="archive-date"><?php the_date('j/m/Y'); ?></p>
				<?php echo the_excerpt(); ?>
				<a class="btn btn-orange archive-button" href="<?php the_permalink(); ?>">To the entry &raquo;</a>
			</div>
		<?php endwhile; else:
			echo '<p>'.$lang_string['NEWS_NO_ENTRY'].'</p>';
		endif;
		?>

	</div>


	<?php

	$output = ob_get_contents();
	ob_end_clean();
	return $output;

}

?>