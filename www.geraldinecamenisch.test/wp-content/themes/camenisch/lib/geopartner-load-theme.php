<?php

function add_theme_caps(){
  global $pagenow;

  if ( 'themes.php' == $pagenow && isset( $_GET['activated'] ) ){ // Test if theme is activate
    // Theme is activate
    // gets the author role
    $role = get_role( 'editor' );

    // This only works, because it accesses the class instance.
    // would allow the author to edit others' posts for current theme only
    $role->add_cap( 'manage_downloads' ); 
  }
  else {
    $role = get_role( 'editor' );
    // Theme is deactivate
    // Remove the capacity when them is deactivate
    $role->remove_cap( 'manage_downloads' ); 
  }
}