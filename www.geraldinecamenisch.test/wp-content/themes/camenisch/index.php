<?php get_header();?>
     
<div class="container">
	<div class="row ">
		<div class="col-xs-12">
			<article class="row fullwidth">
            	<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
					<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
						<?php if(is_single(get_post())) { ?>
							<div class="sitetitle"><?php echo the_date(); ?></div>
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
    </div>
</div>
      

<?php get_footer(); ?>