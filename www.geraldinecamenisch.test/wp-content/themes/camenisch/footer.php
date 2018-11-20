<?php
?>

<?php 
    $lang_string = $GLOBALS['lang_string'];
?>
	</div>
</div>
<div class="container-fluid footer">
	<div class="container">
		<div class="row footer-row-1">
			<div class="col-12 col-md-6 servicenav">
				<?php if ( !function_exists( 'dynamic_sidebar' ) || !dynamic_sidebar('footer-left-widget') ) ?>
			</div>
		</div>
	</div>
</div>
<script>
	function bindEvent(el, eventName, eventHandler) {
	  if (el.addEventListener){
	    el.addEventListener(eventName, eventHandler, false); 
	  } else if (el.attachEvent){
	    el.attachEvent('on'+eventName, eventHandler);
	  }
	}
</script>
<script src="<?php echo get_template_directory_uri(); ?>/js/min/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<?php wp_footer() ?>
</body>
</html>