<?php
/*
Template Name: Detailseite
*/
?>

<?php get_header();?>

<main class="container">
	
 <section class="row">
 <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	 <div class="<?php if(notempty(get_field('infobox_title')) || notempty(get_field('kontakte'))) { ?>col-12 col-lg-6 col-md-6 colleft<?php } else{ ?>col-12 col-lg-6 col-md-6 colleft<?php } ?>">
	    <article class="leftcolumnwide">
			<?php if(get_field('title')!='') { ?><div class="sitetitle"><?php echo get_field('title'); ?></div><?php } ?>
			<h2><?php echo get_field('site_title'); ?></h2>
			<span class="col-12 col-lg-6 col-md-6">
			<?php
			the_content();
			?> 
			</span>
	    </article>
	  </div>
 <div class="<?php if(notempty(get_field('side_img1')) || notempty(get_field('side_img1'))) { ?>col-12 col-lg-6 col-md-6 colright<?php } else{ ?>col-12 col-lg-6 col-md-6 colright<?php } ?>">
	    <article class="rightcolumsmall">
			<?php
			$side_img1 = get_field('side_img1');
			$side_img2 = get_field('side_img2');
			$side_img3 = get_field('side_img3');
			?>
			<?php if(notempty($side_img1) || notempty($side_img2) || notempty($side_img3)) { ?>
			<?php
			if(notempty($side_img1)) 
	    	{ ?>
	      		<div class="content-img"><img src="<?php echo $side_img1['url']; ?>" alt="content image"></div>
	      	<?php } 

	      	if(notempty($side_img2)) 
	      	{ ?>
	      		<div class="content-img"><img src="<?php echo $side_img2['url']; ?>" alt="content image"></div>
	      	<?php } 

	      	if(notempty(get_field('side_img3'))) 
	      	{ 
	      		$img3 = get_field('side_img3'); ?>
	      		<div class="content-img"><img src="<?php echo $side_img3['url']; ?>" alt="content image"></div>
      		<?php } 
			?>
			<?php } ?>



	    </article>
	  </div>

	<?php


	?>

  <?php endwhile; endif; ?>
 </section>
</main>

<?php get_footer(); ?>