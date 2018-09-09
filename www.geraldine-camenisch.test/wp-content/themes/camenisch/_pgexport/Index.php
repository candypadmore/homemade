<?php
get_header( 'Index' ); ?>

<!-- body -->         
<div class="container-fluid content"> 
    <div class="body-row"> 
        <div class="row white-logo"> 
            <img src="file:///Users/candypadmore/Documents/GitHub/homemade/www.geraldine-camenisch.test/wp-content/themes/geraldinecamenisch/logo_1.png" class="rounded-0 img-fluid float-none p-auto m-auto" alt="Gerladine Camenisch"> 
            <?php wp_nav_menu( array(
                    'menu' => 'hauptnavi',
                    'menu_class' => 'navbar navbar-light navbar-expand-md pt-auto pb-auto mb-auto clearfix position-sticky w-100',
                    'container' => '',
                    'fallback_cb' => 'wp_bootstrap4_navwalker::fallback',
                    'walker' => new wp_bootstrap4_navwalker()
            ) ); ?> 
        </div>
    </div>
    <div class="body-row"> 
        <div class="container"> 
            <div class="row white"> 
                <div class="col-12 col-lg-6 col-md-6"> 
                    <img src="file:///Users/candypadmore/Documents/GitHub/homemade/www.geraldine-camenisch.test/wp-content/themes/geraldinecamenisch/beispiel.jpg" class="img-fluid" alt=""> 
                </div>                         
                <div class="col-12 col-md-6 col-lg-6"> 
                    <h1><?php _e( 'Next Event', 'theme_camenisch' ); ?></h1> 
                    <p> <?php _e( 'Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.', 'theme_camenisch' ); ?> <?php _e( 'Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...', 'theme_camenisch' ); ?></p> 
                </div>                         
            </div>                     
        </div>                 
    </div>             
    <div class="body-row"> 
        <div class="container"> 
            <div class="row white"> 
                <div class="col-12 col-md-6 col-lg-6"> 
                    <h1><?php _e( 'Next Event', 'theme_camenisch' ); ?></h1> 
                    <p> <?php _e( 'Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.', 'theme_camenisch' ); ?> <?php _e( 'Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...', 'theme_camenisch' ); ?></p> 
                </div>                         
                <div class="col-12 col-lg-6 col-md-6"> 
                    <img src="file:///Users/candypadmore/Documents/GitHub/homemade/www.geraldine-camenisch.test/wp-content/themes/geraldinecamenisch/beispiel.jpg" class="img-fluid" alt=""> 
                </div>                         
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
                <p><?php _e( 'Geraldine Camenisch', 'theme_camenisch' ); ?></p> 
                <p><?php _e( 'Strasse', 'theme_camenisch' ); ?></p> 
                <p> <?php _e( 'PLZ', 'theme_camenisch' ); ?></p> 
                <br> 
                <p> <?php _e( 'Telefon', 'theme_camenisch' ); ?></p> 
                <p><?php _e( 'mail', 'theme_camenisch' ); ?></p> 
                <p><?php _e( 'Kontaktformular', 'theme_camenisch' ); ?></p> 
            </div>
            <div class="col-12 col-md-6">
                <p><?php _e( 'social medias', 'theme_camenisch' ); ?></p> 
            </div>                     
        </div>                 
    </div>             
</div>        

<?php get_footer( 'Index' ); ?>