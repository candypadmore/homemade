<?php
/*
Template Name: Dienstleistung Übersicht
*/
?>

<?php get_header();?>

<main class="container">
	<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>
    <section class="row">
    	<div class="col-lg-12 xs-12">
    		<article class="row fullwidth">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
             <?php if(get_field('title')!='') { ?><div class="sitetitle"><?php echo get_field('title'); ?></div><?php } ?>
             <h2><?php echo get_field('site_title'); ?></h2>
             <?php the_content(); ?>
             </div>
          </article>
      </div>
    </section>
  <?php endwhile; endif; ?>
  <div id="container" class="js-masonry row" data-masonry-options='{ "columnWidth": 0, "itemSelector": ".item-masonry" }'>
    <?php while( have_rows('collumns') ): the_row(); ?><?php if(get_sub_field('button_link') !='' && get_sub_field('button_link_active')==true){ ?><a class="overview-wrap" href="<?php the_sub_field('button_link'); ?>"><?php } ?>
    <div class="overview item-masonry <?php if(get_sub_field('box_wide')==true){echo 'w2';} ?>">
      <article class="row fullwidth">
        <?php if(get_sub_field('box_info_title')!='') { ?><div class="sitetitle"><?php echo get_sub_field('box_info_title'); ?></div><?php } ?>
        <?php if(get_sub_field('box_title')!='') { ?><h2><?php echo get_sub_field('box_title'); ?></h2><?php } ?>
        <?php echo get_sub_field('box_text'); ?>
        <?php if(get_sub_field('button_link') !='' && get_sub_field('button_link_active')==true){ ?><div class="col-md-6 col-ms-6 col-xs-6"><div class="btn ref-btn center btn-orange"><?php echo $lang_string['MORE_INFO']; ?></div></div><?php } ?>        
      </article>
    </div><?php if(get_sub_field('button_link') !='' && get_sub_field('button_link_active')==true){ ?></a><?php } ?>
    <?php endwhile; ?>
  </div>
</main>

<?php get_footer(); ?>