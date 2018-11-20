<!-- Subscribe Form -->

<?php do_action('newsletters_subscribe_before_form', $instance); ?>

<?php $currentusersubscribed = $this -> get_option('currentusersubscribed'); ?>
<?php if (!empty($currentusersubscribed)) : ?>
	<?php if (is_user_logged_in()) : ?>
		<?php $current_user = wp_get_current_user(); ?>
		<?php global $wpdb; ?>
		<?php if ($wpdb -> get_row("SELECT * FROM " . $wpdb -> prefix . $Subscriber -> table . " WHERE `email` = '" . $current_user -> user_email . "' AND `user_id` = '" . $current_user -> ID . "'")) : ?>
			<div class="ui-state-highlight ui-corner-all">
				<p><i class="fa fa-check"></i> <?php echo sprintf(__('You are already subscribed with email address %s. Go to the %s page to manage your subscription.', 'wp-mailinglist'), '<strong>' . $current_user -> user_email . '</strong>', '<a href="' . $this -> get_managementpost(true) . '">' . __('manage subscriptions', 'wp-mailinglist') . '</a>'); ?></p>
			</div>
		<?php endif; ?>
	<?php endif; ?>
<?php endif; ?>

<form action="<?php echo $action; ?>" method="post" id="<?php echo $widget_id; ?>-form" class="newsletters-subscribe-form">

	<?php $hidden_values = array('ajax', 'scroll', 'captcha', 'list'); ?>
	<?php foreach ($instance as $ikey => $ival) : ?>
		<?php if (!empty($ikey) && in_array($ikey, $hidden_values)) : ?>
			<input type="hidden" name="instance[<?php echo $ikey; ?>]" value="<?php echo esc_attr(stripslashes(__($ival))); ?>" />
		<?php endif; ?>
	<?php endforeach; ?>
	
	<?php do_action('newsletters_subscribe_inside_form_top', $instance); ?>

	<div id="<?php echo $widget_id; ?>-fields" class="newsletters-form-fields">
		<?php 
		
		$list_id = (empty($_REQUEST['list_id'])) ? __($instance['list']) : __(esc_html($_REQUEST['list_id'])); 
		
		?>
		<?php if ($fields = $FieldsList -> fields_by_list($list_id)) : ?>
			<?php foreach ($fields as $field) : ?>
				<?php $this -> render_field($field -> id, true, $widget_id, true, true, $instance, false, $errors); ?>
			<?php endforeach; ?>
		<?php endif; ?>
		
		<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery('#<?php echo $widget_id; ?>-form .newsletters-list-checkbox').on('click', function() { newsletters_refreshfields('<?php echo $widget_id; ?>'); });
			jQuery('#<?php echo $widget_id; ?>-form .newsletters-list-select').on('change', function() { newsletters_refreshfields('<?php echo $widget_id; ?>'); });
		});
		</script>
	</div>
	
	<?php if ($captcha_type = $this -> use_captcha(__($instance['captcha']))) : ?>		
		<?php if ($captcha_type == "rsc") : ?>
			<div class="form-group<?php echo (!empty($errors['captcha_code'])) ? ' has-error' : ''; ?> newsletters-fieldholder newsletters-captcha">
		    	<?php 
		    	
		    	$captcha = new ReallySimpleCaptcha();
		    	$captcha -> bg = $Html -> hex2rgb($this -> get_option('captcha_bg')); 
		    	$captcha -> fg = $Html -> hex2rgb($this -> get_option('captcha_fg'));
		    	$captcha_size = $this -> get_option('captcha_size');
		    	$captcha -> img_size = array($captcha_size['w'], $captcha_size['h']);
		    	$captcha -> char_length = $this -> get_option('captcha_chars');
		    	$captcha -> font_size = $this -> get_option('captcha_font');
		    	$captcha_word = $captcha -> generate_random_word();
		    	$captcha_prefix = mt_rand();
		    	$captcha_filename = $captcha -> generate_image($captcha_prefix, $captcha_word);
		        $captcha_file = plugins_url() . '/really-simple-captcha/tmp/' . $captcha_filename; 
		    	
		    	?>
		    	<div class="newsletters-captcha-wrapper">
			    	<?php if (!empty($form_styling['fieldlabels'])) : ?>
		            	<label class="control-label" for="<?php echo $this -> pre; ?>captcha_code"><?php _e('Please fill in the code below:', 'wp-mailinglist'); ?></label>
		            <?php endif; ?>
		            <img class="newsletters-captcha-image" src="<?php echo $captcha_file; ?>" alt="captcha" />
		            <input size="<?php echo esc_attr(stripslashes($captcha -> char_length)); ?>" <?php echo $Html -> tabindex('newsletters-' . $form -> id); ?> class="form-control <?php echo $this -> pre; ?>captchacode <?php echo $this -> pre; ?>text <?php echo (!empty($errors['captcha_code'])) ? 'newsletters_fielderror' : ''; ?>" type="text" name="captcha_code" id="<?php echo $this -> pre; ?>captcha_code" value="" />
		            <input type="hidden" name="captcha_prefix" value="<?php echo $captcha_prefix; ?>" />
		    	</div>
			</div>
		<?php elseif ($captcha_type == "recaptcha") : ?>
			<div id="newsletters-<?php echo $form -> id; ?>-recaptcha-challenge" class="newsletters-recaptcha-challenge"></div>
		<?php endif; ?>
		
		<?php if (!empty($errors['captcha_code']) && !empty($form_styling['fielderrors'])) : ?>
			<div id="newsletters-<?php echo $number; ?>-captcha-error" class="newsletters-field-error alert alert-danger">
				<p><i class="fa fa-exclamation-triangle"></i> <?php echo stripslashes($errors['captcha_code']); ?></p>
			</div>
		<?php endif; ?>
    <?php endif; ?>
    
    <div class="newslettername-wrapper">
    	<input type="text" name="newslettername" value="" id="<?php echo $widget_id; ?>newslettername" class="newslettername" />
    </div>
	
	<div id="<?php echo $widget_id; ?>-submit" class="newsletters_submit">
		<span id="newsletters_buttonwrap">
			<button value="1" type="submit" class="button" name="subscribe" id="<?php echo $widget_id; ?>-button">
				<?php echo esc_attr(stripslashes(__($instance['button']))); ?>
				
				<span id="<?php echo $widget_id; ?>-loading" class="newsletters-loading-wrapper" style="display:none;">
					<i class="fa fa-refresh fa-spin fa-fw"></i>
				</span>
			</button>
		</span>
	</div>
	
	<div class="clear"></div>
</form>

<?php do_action('newsletters_subscribe_after_form', $instance); ?>

<script type="text/javascript">
jQuery(document).ready(function() {
	<?php 
	
	$ajax = __($instance['ajax']); 
	$scroll = __($instance['scroll']);
	
	?>
	<?php if (!empty($ajax) && $ajax == "Y") : ?>
		jQuery('#<?php echo $widget_id; ?>-form').submit(function() {
			jQuery('#<?php echo $widget_id; ?>-loading').show();
			jQuery('#<?php echo $widget_id; ?>-button').button('disable');
			jQuery('#<?php echo $widget_id; ?>-form .newsletters-fieldholder :input').attr('readonly', true);
			jQuery('div.newsletters-field-error', this).slideUp();
			jQuery(this).find('.newsletters_fielderror').removeClass('newsletters_fielderror');
		
			jQuery.ajax({
				url: newsletters_ajaxurl + 'action=wpmlsubscribe&widget=<?php echo $widget; ?>&widget_id=<?php echo $widget_id; ?>&number=<?php echo $number; ?>',
				data: jQuery('#<?php echo $widget_id; ?>-form').serialize(),
				type: "POST",
				cache: false,
				success: function(response) {
					jQuery('#<?php echo $widget_id; ?>-wrapper').html(response);
					<?php if (!empty($scroll)) : ?>
						wpml_scroll(jQuery('#<?php echo $widget_id; ?>'));
					<?php endif; ?>
				}
			});
			
			return false;
		});
	<?php endif; ?>
	
	if (jQuery.isFunction(jQuery.fn.select2)) {
		jQuery('.newsletters select').select2();
	}
		
	if (jQuery.isFunction(jQuery.fn.button)) {	
		jQuery('.widget_newsletters .button').button();
	}
	
	jQuery('input:not(:button,:submit),textarea,select').focus(function(element) {
		jQuery(this).removeClass('newsletters_fielderror').nextAll('div.newsletters-field-error').slideUp();	
	});
});
</script>