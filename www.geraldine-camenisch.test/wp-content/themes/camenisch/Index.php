<?php
get_header( 'Index' ); ?>

        <!-- body -->
        <div class="container-fluid content">
            <div class="body-row">
                <div class="row white-logo">
                    <img src="http://www.geraldine-camenisch.test/wp-content/uploads/2018/09/logo_1.png" class="rounded-0 img-fluid float-none p-auto m-auto" alt="Gerladine Camenisch">
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
                        <div class="col-12 col-lg-6 col-md-6" wp-if-have-posts>
                            <img src="http://www.geraldine-camenisch.test/wp-content/uploads/2018/09/8.jpg" class="img-fluid" alt="" wp-loop-skip>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6" wp-if-have-posts>
                            <h1 wp-loop-skip>Next Event</h1>
                            <p wp-loop-skip> Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
                            Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="body-row">
                <div class="container">
                    <div class="row white">
                        <div class="col-12 col-md-6 col-lg-6" wp-if-have-posts>
                            <h1 wp-loop-skip>Next Event</h1>
                            <p wp-loop-skip> Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien leben die Blindtexte. Abgeschieden wohnen sie in Buchstabhausen an der Küste des Semantik, eines großen Sprachozeans.
                            Ein kleines Bächlein namens Duden fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die weite Grammatik. Der große Oxmox riet ihr davon ab, da ...</p>
                        </div>
                        <div class="col-12 col-lg-6 col-md-6" wp-if-have-posts>
                            <img src="http://www.geraldine-camenisch.test/wp-content/uploads/2018/09/5.jpg" class="img-fluid" alt="" wp-loop-skip>
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
                        Géraldine Camenisch <br/>
                        Stettbacherrain 11 <br/>
                        CH-8051 Zürich<br/>
                        mail@geraldinecamenisch.com<br/>
                        079 317 00 97
                    </div>
                    <div class="col-12 col-md-6">
                    </div>
                </div>
            </div>
        </div>        

<?php get_footer( 'Index' ); ?>