<?php
get_header( 'Index' ); ?>

        <!-- body -->
        <div class="container-fluid content">
            <div class="body-row">
                <div class="row white-logo">
                    <img src="file:///Users/candypadmore/Documents/GitHub/homemade/www.geraldine-camenisch.test/wp-content/themes/geraldinecamenisch/logo_1.png" class="rounded-0 img-fluid float-none p-auto m-auto" alt="Gerladine Camenisch">
                    <nav class="navbar navbar-light navbar-expand-md pt-auto pb-auto mb-auto clearfix position-sticky w-100">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <?php wp_nav_menu( array(
                                    'menu' => 'mainnav',
                                    'menu_class' => 'navbar-nav',
                                    'container' => '',
                                    'theme_location' => 'primary',
                                    'fallback_cb' => 'wp_bootstrap4_navwalker::fallback',
                                    'walker' => new wp_bootstrap4_navwalker()
                            ) ); ?>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="body-row">
                <div class="container">
                    <div class="row white">
                        <?php if ( have_posts() ) : ?>
                            <div class="col-12 col-lg-6 col-md-6">
</div>
                        <?php endif; ?>
                        <?php if ( have_posts() ) : ?>
                            <div class="col-12 col-md-6 col-lg-6">
</div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <div class="body-row">
                <div class="container">
                    <div class="row white">
                        <?php if ( have_posts() ) : ?>
                            <div class="col-12 col-md-6 col-lg-6">
</div>
                        <?php endif; ?>
                        <?php if ( have_posts() ) : ?>
                            <div class="col-12 col-lg-6 col-md-6">
</div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- end body -->
        <!-- footer -->
        <div class="container-fluid footer">
            <div class="container">
                <div class="row footer-row-1">
                    <div class="col-12 col-md-6">
</div>
                    <div class="col-12 col-md-6">
</div>
                </div>
            </div>
        </div>        

<?php get_footer( 'Index' ); ?>