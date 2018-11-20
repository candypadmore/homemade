<?php get_header();?>

<main class="container">
	
 <section class="row">
 <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
	 <div class="<?php if(notempty(get_field('kontakte')) || notempty(get_field('datei_boxen')) && get_field('datei_boxen') != 0) { ?>col-lg-9 col-md-8 col-sm-12 col-xs-12 colleft<?php } else{ ?>col-lg-12 col-md-12 col-sm-12 col-xs-12 colleft<?php } ?>">
	    <article class="leftcolumnwide">
			<?php if(get_field('title')!='') { ?><div class="sitetitle"><?php echo get_field('title'); ?></div><?php } ?>
			<h2><?php the_title(); ?></h2>	
			<?php $side_img1 = get_field('side_img1');
			$side_img2 = get_field('side_img2');
			$side_img3 = get_field('side_img3');
			 if(empty($side_img1) && empty($side_img2) && empty($side_img3)){ ?>
			<span class="col-lg-12 col-md-12 col-md-12 col-xs-12">
			<?php } else { ?>
			<span class="col-lg-8 col-md-8 col-md-8 col-xs-12">
			<?php }
			the_content(); ?>

			<div class="left">
				<h3>Ausführungsperiode</h3>
				<?php
				$start = get_field('period_start');
				$end = get_field('period_end');
				 if($start != '' && $end != '' && $start != $end){ ?>
				<p><?php echo $start; ?> - <?php echo $end; ?></p>
				<?php } else { ?>
				<p><?php echo $start; ?></p>
				<?php } ?>
				<?php if(get_field('client') != ''){ ?>
				<h3>Auftraggeber</h3>
				<p><?php the_field('client'); ?></p>
				<?php } ?>
				<?php $ref_terms = wp_get_post_terms(get_the_ID(),'reference_types'); 
				$found = false;
					foreach($ref_terms as $ref_term){
						if(!$found){
							switch($ref_term->parent){
								case 10:
									echo "<div class='backbox'><a class='btn btn-orange left ref-back' href='".site_url()."/wald-und-holz/referenzen-wald-u-holz/'>&laquo; Zur&uuml;ck</a></div>";
									$found = true;
									break;
								case 11:
									echo "<div class='backbox'><a class='btn btn-orange left ref-back' href='".site_url()."/abfall-und-stoffhaushalt/referenzen-abfall-u-stoffhaushalt/'>&laquo; Zur&uuml;ck</a></div>";
									$found = true;
									break;
								case 29:
									echo "<div class='backbox'><a class='btn btn-orange left ref-back' href='".site_url()."/bau-und-umwelt/referenzen-bau-u-umwelt/'>&laquo; Zur&uuml;ck</a></div>";
									$found = true;
									break;
								case 30:
									echo "<div class='backbox'><a class='btn btn-orange left ref-back' href='".site_url()."/okologie-und-wasser/referenzen-okologie-u-wasser/'>&laquo; Zur&uuml;ck</a></div>";
									$found = true;
									break;
								default:
									break;
							}
						}
					}
					if(!$found){
						?> <div class='backbox'><a onclick="window.history.back();" class="btn btn-orange left ref-back">&laquo; Zur&uuml;ck</a></div> <?php
					}
				?>
			</div>

			</span>

			<?php if(notempty($side_img1) || notempty($side_img2) || notempty($side_img3)) { ?>
			<span class="col-lg-4 col-md-4 col-md-4 col-xs-12 refsidebar-imgwrap">
			<?php
			if(notempty($side_img1)) 
	    	{ 
	      		$img1 = get_field('side_img1'); ?>
	      		<div class="imgbox col-md-12 col-md-4"><a href="<?php echo $side_img1['url']; ?>" rel="shadowbox[Gallery]" title="<?php echo $side_img1["description"]; ?>"><img src="<?php echo $side_img1['sizes']['small-wide-size']; ?>" class="img-responsive"><?php if(notempty(get_field('side_img1_desc'))) { ?><p class="caption"><?php echo get_field('side_img1_desc'); ?></p><?php } ?></a></div>
	      	<?php } 

	      	if(notempty($side_img2)) 
	      	{  ?>
	      		<div class="imgbox col-md-12 col-md-4"><a href="<?php echo $side_img2['url']; ?>" rel="shadowbox[Gallery]" title="<?php echo $side_img2["description"]; ?>"><img src="<?php echo $side_img2['sizes']['small-wide-size']; ?>" class="img-responsive"><?php if(notempty(get_field('side_img2_desc'))) { ?><p class="caption"><?php echo get_field('side_img2_desc'); ?></p><?php } ?></a></div>
	      	<?php } 

	      	if(notempty($side_img3)) 
	      	{ ?>
	      		<div class="imgbox col-md-12 col-md-4"><a href="<?php echo $side_img3['url']; ?>" rel="shadowbox[Gallery]" title="<?php echo $side_img3["description"]; ?>"><img src="<?php echo $side_img3['sizes']['small-wide-size']; ?>" class="img-responsive"><?php if(notempty(get_field('side_img1_desc'))) { ?><p class="caption"><?php echo get_field('side_img3_desc'); ?></p><?php } ?></a></div>
      		<?php } 
			?>
			</span>
			<?php } ?>
	    </article>
	  </div>
	<?php if(notempty(get_field('infobox_title'))) { ?>
	 	<div class="col-lg-3 col-md-4 col-sm-4 hidden-xs colright">
	   		<article class="rightcolumnsmall col-xs-12">
	    		<div class="sitetitle"><?php echo get_field('infobox_subtitle'); ?></div>
	       		<h2><?php echo get_field('infobox_title'); ?></h2>
	       		<?php echo get_field('infobox_text'); ?>
	    	</article>
		</div>
	<?php } ?>
	<?php 
	  
		$args = array('orderby' => 'name', 'order' => 'ASC', 'fields' => 'all');
		$terms = wp_get_post_terms( get_the_id(), 'reference_contacts', $args );

		$i = 0;
		foreach($terms as $term)
		{
			$id = $term->term_id;
			$contactcustom = get_option( 'tax_meta_'.$id);
			$contact_name = $contactcustom["contact_name"]; 
		  	$contact_image = $contactcustom["contact_image"];
		  	$contact_info = $contactcustom["contact_info"];
		  	$contact_email = $contactcustom["contact_email"];
		  	$contact_tel = $contactcustom["contact_tel"];

		  	$url = wp_get_attachment_thumb_url( $contact_image['id'] );

		  	if(notempty($contact_image)) { ?>
			 	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 colright">
			   		<article class="rightcolumnsmall col-xs-12">
				      <div class="sitetitle">Kontakt</div>
				      <h2 class="cont_title">Ansprechspartner</h2>
				      <img class="auth-img colleft" src="<?php echo $url; ?>">
				       <h3 class="cont_name"><?php echo $term->name; ?></h3>
				       <p class="cont_desc"><?php echo $term->description; ?></p>
				       <p class="cont_title"><?php echo $contact_info; ?></p>
				       <p class="cont_mail"><a href="mailto:<?php echo $contact_email ?>"><?php echo $contact_email; ?></a></p>
				       <p class="cont_tel"><?php echo $contact_tel; ?></p>
			       </article>
				</div> <?php 
			}
		}

		
		if(notempty(get_field('kontakte'))){
			foreach(get_field('kontakte') as $kontakt){
				?>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 colright">
					<article class="rightcolumnsmall col-xs-12">
						<div class="sitetitle">Kontakt</div>
						<h2 class="cont_title"><?php echo $kontakt->post_title; ?></h2>
						<?php if(notempty(get_field('team_position', $kontakt->ID))) { ?>
				        <p class="activity">
							<em> <?php 
								the_field('team_position',$kontakt->ID); 
							?> </em>
						</p>
				        <?php } ?>
						<?php $team_img = get_field('team_image', $kontakt->ID);
						$team_img_sizes = $team_img["sizes"];
						if(notempty($team_img['url']!==0)){ ?>
							<img class="auth-img colleft" src="<?php echo $team_img_sizes['thumbnail']; ?>">
						<?php } ?>
						<div>
				        <p>
				        <?php if(notempty(get_field('team_diploma', $kontakt->ID))) { ?>
				        <?php 
								the_field('team_diploma',$kontakt->ID); 
						?>
				        <?php } ?>
				        <?php if(notempty(get_field('team_tel', $kontakt->ID))){ ?>
				        	<br>
				        	<img src="<?php echo get_template_directory_uri(); ?>/img/phone.svg" class="contacticon">
							<a href="tel:<?php the_field('team_tel', $kontakt->ID); ?>"><?php the_field('team_tel', $kontakt->ID); ?></a>
						<?php } ?>
						<?php if(notempty(get_field('team_mob', $kontakt->ID))){ ?>
							<br>
							<img src="<?php echo get_template_directory_uri(); ?>/img/fax.svg" class="contacticon">
							<a href="tel:<?php the_field('team_mob', $kontakt->ID); ?>"><?php the_field('team_mob', $kontakt->ID); ?></a>
						<?php } ?>
						<?php if(notempty(get_field('team_email', $kontakt->ID))){ ?>
							<br>
							<img src="<?php echo get_template_directory_uri(); ?>/img/email.svg" class="contacticon">
							<a href="mailto:<?php the_field('team_email', $kontakt->ID); ?>">eMail senden</a>
						<?php } ?>
						</p>
						</div>
				       <?php /* var_dump($kontakt); var_dump(get_field('team_image', $kontakt->ID)); */ ?>
					</article>
				</div>
				<?php
			}
		}
		$datei_boxen = get_field('datei_boxen');
		if(notempty($datei_boxen) && get_field('datei_boxen') != 0){
			foreach($datei_boxen as $datei_box){
				?>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 colright left">
					<article class="rightcolumnsmall col-xs-12">
					<h4><?php echo $datei_box['refbox_title']; ?></h4>
				<?php 
				if($datei_box['refbox_text']!= ''){ ?>
					<?php echo $datei_box['refbox_text']; ?>
				<?php }
					if(notempty($datei_box['refbox_file'])){
					$file = $datei_box['refbox_file']; ?> 
					<a class="btn btn-orange" target="_blank" href="<?php echo $file['url']; ?>"><?php echo $file['title']; ?></a>
				<?php } ?>
					</article>
				</div>
				<?php 
			}
		}

		/*
		$taxs = wp_get_post_terms( get_the_id(), 'reference_types');


		foreach($taxs as $tax){
			if($tax->parent == '0')
			{
				$tax_slug = $tax ->slug;

				$args2 = array(
					'post_type' => 'team',
					'tax_query' => array(
						array(
							'taxonomy'	=>	'reference_types',
							'field'		=>	'slug',
							'terms'	=>	$tax_slug,
							'chiless' => true,
						),
					),
				);
				$teams = new WP_Query($args2);
				
				foreach($teams as $team){
					$i++;
					echo "<article class='rightcolumn'>";
					
						var_dump($team);
					
					echo "</article>";
				}
				
			}
		}
		*/

	?>
  <?php endwhile; endif; ?>
 </section>
</main>
<?php get_footer(); ?>