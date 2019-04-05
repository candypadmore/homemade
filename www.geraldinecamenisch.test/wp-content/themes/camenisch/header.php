<!DOCTYPE html>
<html lang="de">
<head>
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,600,400italic,600italic' rel='stylesheet' type='text/css'>

<?php 
// Use post/page featured image as body background
add_action( 'the_post', 'mytheme_custom_post_background' );
 
function mytheme_custom_post_background( $post ) {
$background = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'full' );
if($background) {
?>
    <style>
        body{
            background: rgba(0, 0, 0, 0) url("<?php echo $background[0]; ?>") no-repeat fixed center center / cover ;
        }
    </style>
<?php   
    } 
}
?>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="">
    <title><?php wp_title('•',1,'right');?>
    <?php bloginfo('name'); ?></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--  CSS -->
    <link href="<?php echo get_template_directory_uri(); ?>/css/footable/footable.core.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo get_template_directory_uri(); ?>/css/main.css" rel="stylesheet">
    <link href="<?php echo get_template_directory_uri(); ?>/css/chosen/chosen.min.css" rel="stylesheet">
    <link href="<?php echo get_template_directory_uri(); ?>/js/shadowbox/shadowbox.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

    <!-- Google Fonts -->
    <link href='<?php echo get_template_directory_uri(); ?>/fonts/googlefonts.css' rel='stylesheet' type='text/css'>

    <?php wp_head(); ?>
<?php 
    $lang_string = $GLOBALS['lang_string'];
?>
        
    <?php 
    function notempty($var) {
        return ($var==="0"||$var);
    }
    ?>
    <?php
        if ( is_admin_bar_showing() ) {
            echo '<style>';
            echo 'header {top: 32px}';
            echo '</style>';
        }
    ?>
</head>

<body>
	<div class="container content">
		<div class="body-row">
			<div class="row white-logo">
				<a class="rounded-0 img-fluid float-none p-auto m-auto" href="<?php echo site_url(); ?>">
					<img src="<?php echo get_template_directory_uri().'/img/logo.png'; ?>" class="rounded-0 img-fluid float-none p-auto m-auto" >
				</a>
				<nav class="navbar navbar-light navbar-expand-lg pt-auto pb-auto mb-auto clearfix position-sticky w-100">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<?php
						$menu = array(
							'menu'              => 'primary'
							,'theme_location'   => 'primary'
							,'depth'            => 2
							,'container'        => false
							,'menu_class'       => 'nav navbar-nav navbar-right'
							,'fallback_cb'      => false
							,'walker'           => new wp_bootstrap_navwalker()
						);
						wp_nav_menu($menu);
						?>
					</div>
				</nav>
			</div>
		</div>

<div id="body-row">