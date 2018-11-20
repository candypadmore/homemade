<?php
/*
Template Name: Kontakt
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
  <?php if(get_field('contactdata_1')){ ?>
    <section class="row">
      <div class="col-md-12 contact-1">
        <article class="row fullwidth">
          <div class="col-md-6">
              <?php if(get_field('contacttitle_1')) { ?>
                  <h3 class="contact-title"><?php echo get_field('contacttitle_1');?></h3><br>
              <?php } ?>
              <span class="contact-adress"><?php echo get_field('contactdata_1');?></span>
              <span class="contact-adress"><?php if(get_field('contacttel_1')!='') { ?><img src="<?php echo get_template_directory_uri(); ?>/img/phone.svg" class="contacticonbig"> <?php echo get_field('contacttel_1'); } if(get_field('contactfax_1')!='') { ?><br><img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/fax.svg"> <?php echo get_field('contactfax_1'); } if(get_field('contactmail_1')!='') { ?><br><img src="<?php echo get_template_directory_uri(); ?>/img/email.svg" class="contacticonbig"> <a href="mailto:<?php echo eae_encode_str(get_field('contactmail_1')); ?>"><?php echo eae_encode_str(get_field('contactmail_1')); ?></a><?php } ?></span>
              <br><br>
              <p class="contact-text"><?php echo get_field('contacttext_1');?></p>
          </div>
          <?php 

          $location = get_field('map_1');

          if( !empty($location) ) {
          ?>
          <div class="col-md-6">
              <div class="acf-map">
                  <div class="marker" data-lat="<?php echo $location['lat']; ?>" data-lng="<?php echo $location['lng']; ?>">
                    <h4 class="maps-title">Hauptsitz</h4>
                    <p class="maps-text"><?php echo $location['address']; ?></p>
                  </div>
              </div>
          </div>
          <?php } ?>
        </article>
      </div>
    </section>
   <?php } ?>
   <?php if(get_field('contactdata_2')){ ?>
    <section class="row"> 
      <div class="col-md-12 contact-2"> 
        <article class="row fullwidth">
          <div class="col-md-6">
              <?php if(get_field('contacttitle_2')) { ?>
                  <h3 class="contact-title"><?php echo get_field('contacttitle_2');?></h3><br>
              <?php } ?>
              <span class="contact-adress"><?php echo get_field('contactdata_2');?></span>
              <span class="contact-adress"><?php if(get_field('contacttel_2')!='') { ?><img src="<?php echo get_template_directory_uri(); ?>/img/phone.svg" class="contacticonbig"> <?php echo get_field('contacttel_2'); } if(get_field('contactfax_2')!='') { ?><br><img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/fax.svg"> <?php echo get_field('contactfax_2'); } if(get_field('contactmail_2')!='') { ?><br><img src="<?php echo get_template_directory_uri(); ?>/img/email.svg" class="contacticonbig"> <a href="mailto:<?php echo eae_encode_str(get_field('contactmail_2')); ?>"><?php echo eae_encode_str(get_field('contactmail_2')) ?></a><?php } ?></span>
              <br><br>
              <p class="contact-text"><?php echo get_field('contacttext_2');?></p>
          </div>
          <?php 
          $location2 = get_field('map_2');

          if( !empty($location2) ) {
          ?>
          <div class="col-md-6">
              <div class="acf-map">
                  <div class="marker" data-lat="<?php echo $location2['lat']; ?>" data-lng="<?php echo $location2['lng']; ?>">
                    <h4 class="maps-title">Filiale</h4>
                    <p class="maps-text"><?php echo $location2['address']; ?></p>
                  </div>
              </div>
          </div>
          <?php } ?>
          </article>
      </div>
    </section>
   <?php } ?>
   <?php if(get_field('contactdata_3')){ ?>
    <section class="row"> 
      <div class="col-md-12 contact-3">
        <article class="row fullwidth"> 
          <div class="col-md-6">
              <?php if(get_field('contacttitle_3')) { ?>
                  <h3 class="contact-title"><?php echo get_field('contacttitle_3');?></h3><br>
              <?php } ?>
              <span class="contact-adress"><?php echo get_field('contactdata_3');?></span>
              <span class="contact-adress"><?php if(get_field('contacttel_3')!='') { ?><img src="<?php echo get_template_directory_uri(); ?>/img/phone.svg" class="contacticonbig"> <?php echo get_field('contacttel_3'); } if(get_field('contactfax_3')!='') { ?><br><img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/fax.svg"> <?php echo get_field('contactfax_3'); } if(get_field('contactmail_3')!='') { ?><br><img src="<?php echo get_template_directory_uri(); ?>/img/email.svg" class="contacticonbig"> <a href="mailto:<?php echo eae_encode_str(get_field('contactmail_3')); ?>"><?php echo eae_encode_str(get_field('contactmail_3')); ?></a><?php } ?></span>
              <br><br>
              <p class="contact-text"><?php echo get_field('contacttext_3');?></p>
          </div>
          <?php 
          $location3 = get_field('map_3');

          if( !empty($location3) ) {
          ?>
          <div class="col-md-6">
              <div class="acf-map">
                  <div class="marker" data-lat="<?php echo $location3['lat']; ?>" data-lng="<?php echo $location3['lng']; ?>">
                    <h4 class="maps-title">Filiale</h4>
                    <p class="maps-text"><?php echo $location3['address']; ?></p>
                  </div>
              </div>
          </div>
          <?php } ?>
        </article>
      </div>
    </section>
   <?php } ?>
</main>

<?php get_footer(); ?>