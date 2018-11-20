<?php
	
global $newsletters_is_management;
$newsletters_is_management = true;	
$management_password = $this -> get_option('management_password');
	
?>

<h3><?php _e('Profile', 'wp-mailinglist'); ?></h3>
<p><?php _e('Manage your subscriber profile data in the fields below.', 'wp-mailinglist'); ?></p>

<?php if (!empty($errors)) : ?>
	<div class="alert alert-danger">
		<p><i class="fa fa-exclamation-triangle"></i> <?php _e('Profile could not be saved, see errors below.', 'wp-mailinglist'); ?></p>
	</div>
<?php endif; ?>
	
<?php if (!empty($success) && $success == true) : ?>
	<div class="alert alert-success">
		<p><i class="fa fa-check"></i> <?php echo $successmessage; ?></p>
	</div>
<?php endif; ?>

<?php if (!empty($fields) && is_array($fields)) : ?>
	<form action="" method="post" onsubmit="wpmlmanagement_savefields(this);" id="subscribersavefieldsform" enctype="multipart/form-data">
    	<input type="hidden" name="subscriber_id" value="<?php echo $subscriber -> id; ?>" />
    
		<?php foreach ($fields as $field) : ?>
            <?php $this -> render_field($field -> id, true, 'manage', true, true, false, false, $errors); ?>
        <?php endforeach; ?>
        
        <?php $managementformatchange = $this -> get_option('managementformatchange'); ?>
        <?php if (!empty($managementformatchange) && $managementformatchange == "Y") : ?>
	        <div class="newsletters-fieldholder format">
		        <div class="form-group">
		        	<label for="format_html" class="control-label wpmlcustomfield"><?php _e('Email Format:', 'wp-mailinglist'); ?></label>
		        	<div class="radio">
		        		<label><input <?php echo ($subscriber -> format == "html") ? 'checked="checked"' : ''; ?> type="radio" name="format" value="html" id="format_html" /> <?php _e('HTML (recommended)', 'wp-mailinglist'); ?></label>
						<label><input <?php echo ($subscriber -> format == "text") ? 'checked="checked"' : ''; ?> type="radio" name="format" value="text" id="format_text" /> <?php _e('TEXT', 'wp-mailinglist'); ?></label>
		        	</div>
		        </div>
	        </div>
	    <?php endif; ?>
	    
	    <div class="clearfix"></div>
	    
	    <?php if (!empty($management_password)) : ?>
		    <div>
			    <div class="col-md-12">
			    	<p><?php _e('Optional. Enter or update password for future login to manage subscriptions.', 'wp-mailinglist'); ?></p>
			    	
			    	<?php if (!empty($errors['password'])) : ?>
			    		<div class="alert alert-danger">
				    		<p><i class="fa fa-exclamation-triangle"></i> <?php echo $errors['password']; ?></p>
			    		</div>
			    	<?php endif; ?>
			    </div>
		    </div>
		    <div>
			    <div class="newsletters-fieldholder">
				    <div class="form-group <?php echo (!empty($errors['password'])) ? 'has-error' : ''; ?>">
					    <label class="control-label"><?php _e('Password', 'wp-mailinglist'); ?></label>
					    <input type="password" class="form-control" name="password1" />
				    </div>
			    </div>
			    <div class="newsletters-fieldholder">
				    <div class="form-group <?php echo (!empty($errors['password'])) ? 'has-error' : ''; ?>">
					    <label class="control-label"><?php _e('Re-Enter Password', 'wp-mailinglist'); ?></label>
					    <input type="password" class="form-control" name="password2" />
				    </div>
			    </div>
		    </div>
		<?php endif; ?>
        
        <div id="<?php echo $widget_id; ?>-submit" class="newsletters-fieldholder newsletters_submit">
			<div class="form-group">
		        <div class="wpmlsubmitholder">
		            <button value="1" id="savefieldsbutton" class="newsletters_button btn btn-primary" type="submit" name="savefields">
		            	<?php _e('Save Profile', 'wp-mailinglist'); ?>
		            	<span id="savefieldsloading" style="display:none;"><i class="fa fa-refresh fa-spin fa-fw"></i></span>
		            </button>
		        </div>
			</div>
        </div>
    </form>
    
    <script type="text/javascript">jQuery(document).ready(function() { if (jQuery.isFunction(jQuery.fn.select2)) { jQuery('.newsletters select').select2(); } jQuery('input:not(:button,:submit),textarea,select').focus(function(element) { jQuery(this).removeClass('newsletters_fielderror').nextAll('div.newsletters-field-error').slideUp(); }); });</script>
<?php else : ?>
	<div class="alert alert-danger">
		<p><i class="fa fa-exclamation-triangle"></i> <?php _e('No custom fields are available at this time.', 'wp-mailinglist'); ?></p>
	</div>
<?php endif; ?>

<script type="text/javascript">
jQuery(document).ready(function() { 
	jQuery('.newsletters-management .newsletters-fieldholder, .entry-content .newsletters-fieldholder, .entry .newsletters-fieldholder').addClass('col-md-6'); 

	if (jQuery.isFunction(jQuery.fn.ajaxForm)) {
		jQuery('#subscribersavefieldsform').ajaxForm({
			url: newsletters_ajaxurl + "action=managementsavefields",
			type: "POST",
			cache: false,
			success: function(response) {							
				jQuery('#savefields').html(response);
				jQuery('#savefieldsbutton').prop('disabled', false);
			}
		});	
	}
});
</script>