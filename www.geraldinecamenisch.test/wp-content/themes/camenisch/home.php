<?php
/*
Template Name: Home
*/
?>

<?php get_header();?>
     
<main class="container">
	<div class="row ">
			
            <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 introbox" style="height:auto;">
			    <article class="first_large">
			      <div class="sitetitle"><?php echo get_field('title'); ?></div>
			      <h2><?php echo get_field('site_title'); ?></h2>
				     <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
					   <?php the_content(); ?>
					   <?php if(get_field('intro_link_name')!=''){ ?><p>
					   	<a class="btn spez btn-orange" href="<?php echo get_field('intro_link'); ?>"><?php echo get_field('intro_link_name'); ?></a>
					   </p>
					   <?php } ?>
					<?php endwhile; endif; ?>    
			    </article>			
			</div>

			<?php 
			$args = array(
			    'numberposts' => 2,
			    'category' => 1,
			    'suppress_filters' => true,
			    'meta_query' => array('relation' => 'AND',
					    array(
					    	'key' => 'start-date',
					    	'value' => date('Ymd'),
					    	'compare' => '<=',
					    ),
					    array(
					    	'key' => 'end-date',
					    	'value' => date('Ymd'),
					    	'compare' => '>=',
					    ),
				    ),
			    );

			$recent_posts = get_posts($args);
				if(!empty($recent_posts)) : ?>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 infobox">
               	<div class="newssection">
					<div class="sitetitle"><?php echo $lang_string['STAY_UPDATED']?></div>
					<?php foreach($recent_posts as $recent){ 
						if(notempty($recent))
							{ ?>
								    <a class="newsbox" href="<?php echo $recent->guid; ?>">
                                    <article class="news">
										<h2><?php echo $recent->post_title; ?></h2>
								      	<?php if($recent->post_excerpt == ''){ ?>
								       <p class="anriss"><?php echo wp_trim_words($recent->post_content, 28, ' [...]'); ?></p>
								       <?php } else{ ?>
								       <p class="anriss"><?php echo $recent->post_excerpt; ?></p>
								       <?php } ?>
								    </article>
                                    </a>                                    
							<?php  ?>

						<?php }	
					} ?>
                
                <?php $language = get_locale();
						// switch statement - übersichtliche Lösung für verschiedene Sprachen/Werte
						// für geopartner sind Sprachanpassungen hier zu finden: // lang/de_CH.php - lang/en_GB.php
						switch($language) :

							case 'de_CH':
								echo '<a class="btn btn-orange" href="/de/news" role="button">Alle Einträge anzeigen</a>';
								break;

							case 'en_GB':
								echo '<a class="btn btn-orange" href="/en/news_e" role="button">All Entries</a>';
								break;

							endswitch;
					?>
                
                </div>
                </div>
				<?php else :  ?>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 infobox">
				    <article class="there">
				       <div class="sitetitle"><?php echo get_field('contact_infotitle'); ?></div>
				       <h2><?php echo get_field('contact_title'); ?></h2>
				       <?php echo get_field('contact_text'); ?>
				       <p class="adressblock"><span><img src="<?php echo get_template_directory_uri(); ?>/img/phone.svg" class="contacticonbig"> <?php echo get_field('contact_tel'); ?></span><br><span><img src="<?php echo get_template_directory_uri(); ?>/img/email.svg" class="contacticonbig"> <a href="mailto:<?php echo eae_encode_str(get_field('contact_mail')); ?>"><?php echo eae_encode_str(get_field('contact_mail')); ?></a></span></p>
				    </article>
				 </div>
					
			<?php endif; ?>
			 <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
		    	<article class="second zitat">
		       		<?php echo get_field('quote_editor'); ?>
		    	</article>
		 	</div>

</div>
		<?php 
			$logo1 = get_field('logo_1');
			$logo2 = get_field('logo_2');
			$logo3 = get_field('logo_3');
			$logo4 = get_field('logo_4');

		?>
        
        
			<div class="row">
			    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			    	<article class="first">
				       	<h2 class="product"><span class="icon"><img height="36" width="35" src="<?php echo $logo1['url']; ?>"></span><?php echo get_field('title_1'); ?></h2>
				       	<?php echo get_field('text_1'); ?>
				       	<a class="btn btn-grey" href="<?php echo get_field('link_1'); ?>" role="button"><?php echo get_field('link_title1'); ?></a>
			    	</article>
			  	</div>
			    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			     	<article class="second">
			        <h2 class="product"><span class="icon"><img src="<?php echo $logo2['url']; ?>"></span><?php echo get_field('title_2'); ?></h2>
			        <?php echo get_field('text_2'); ?>
			        <a class="btn btn-grey" href="<?php echo get_field('link_2'); ?>" role="button"><?php echo get_field('link_title2'); ?></a>
			     </article>
			   </div>
			  	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			    	<article class="there"> 
			    		<h2 class="product"><span class="icon"><img src="<?php echo $logo3['url']; ?>"></span><?php echo get_field('title_3'); ?></h2>
			        	<?php echo get_field('text_3'); ?>
			       		<a class="btn btn-grey" href="<?php echo get_field('link_3'); ?>" role="button"><?php echo get_field('link_title3'); ?></a>
			    	</article>
			  	</div>
			  	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				    <article class="four">
					    <h2 class="product"><span class="icon"><img src="<?php echo $logo4['url']; ?>"></span><?php echo get_field('title_4'); ?></h2>
					    <?php echo get_field('text_4'); ?>
					    <a class="btn btn-grey" href="<?php echo get_field('link_4'); ?>" role="button"><?php echo get_field('link_title4'); ?></a>
				    </article>
			  	</div>
			</div>
</main>


<?php get_footer(); ?>