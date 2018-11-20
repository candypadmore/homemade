<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

/**
 * footer content class left.
 *
 * @extends WP_Widget
 */
class geopartner_left_footer_widget extends WP_Widget {

    var $widget_cssclass;
    var $widget_description;
    var $widget_idbase;
    var $widget_name;
    var $options;

    /**
     * constructor
     *
     * @access public
     * @return void
     */
    function geopartner_left_footer_widget() {

        /* Widget variable settings. */
        $this->widget_cssclass    = 'geopartner-left-footer-widget';
        $this->widget_description = __( 'Element für die Hauptfiliale', 'geopartner' );
        $this->widget_idbase      = 'geopartner-left-footer-widget';
        $this->widget_name        = __( 'Hauptfiliale', 'geopartner' );

        /* Widget settings. */
        $widget_ops = array( 'classname' => $this->widget_cssclass, 'description' => $this->widget_description );

        /* Create the widget. */
        $this->WP_Widget( 'geopartner-left-footer-widget', $this->widget_name, $widget_ops );
    }

    /**
     * widget function.
     *
     * @see WP_Widget
     * @access public
     * @param array $args
     * @param array $instance
     * @return void
     */
    function widget( $args, $instance ) {
        $subtitle = isset( $instance['subtitle'] ) ? apply_filters( 'widget_subtitle', $instance['subtitle'], $instance, $this->id_base ) : __( 'Kontakt', 'geopartner' );
        $title = isset( $instance['title'] ) ? apply_filters( 'widget_title', $instance['title'], $instance, $this->id_base ) : __( 'Hauptfiliale', 'geopartner' );
        $name = isset( $instance['name'] ) ? apply_filters( 'widget_name', $instance['name'], $instance, $this->id_base ) : __( 'GEO Partner AG', 'geopartner' );
        $street = isset( $instance['street'] ) ? apply_filters( 'widget_street', $instance['street'], $instance, $this->id_base ) : __( 'Baumackerstrasse 24', 'geopartner' );
        $plz = isset( $instance['plz'] ) ? apply_filters( 'widget_plz', $instance['plz'], $instance, $this->id_base ) : __( 'CH-8050 Zürich', 'geopartner' );
        $tel = isset( $instance['tel'] ) ? apply_filters( 'widget_tel', $instance['tel'], $instance, $this->id_base ) : __( '+41 61 683 20 24', 'geopartner' );
        $fax = isset( $instance['fax'] ) ? apply_filters( 'widget_fax', $instance['fax'], $instance, $this->id_base ) : __( '+41 44 311 28 07', 'geopartner' );
        $mail = isset( $instance['mail'] ) ? apply_filters( 'widget_mail', $instance['mail'], $instance, $this->id_base ) : __( 'info@geopartner.ch', 'geopartner' );
        ?>
            <div>
                <div class="thema"><?php echo $subtitle; ?></div>
                <div class="servicetitle"><?php echo $title; ?></div>
                <p><?php echo $name; ?><br><?php echo $street; ?><br><?php echo $plz; ?></p>
                <p>
                    <img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/phone.svg"> <?php echo $tel; ?><br>
                <?php if($fax!='') { ?> 
                    <img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/fax.svg"> <?php echo $fax; ?><br>
                <?php } ?>
                <?php if($mail!='') { ?>
                    <img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/email.svg"> <a href="mailto:<?php echo eae_encode_str($mail); ?>"><?php echo eae_encode_str($mail); ?></a>
                <?php } ?>
                </p>
            </div>
        <?php
    }

    /**
     * update function.
     *
     * @see WP_Widget->update
     * @access public
     * @param array $new_instance
     * @param array $old_instance
     * @return array
     */

    


    function update( $new_instance, $old_instance ) {
        $instance                   = $old_instance;
        $instance['subtitle']       = strip_tags( $new_instance['subtitle'] );
        $instance['title']          = strip_tags( $new_instance['title'] );
        $instance['name']           = strip_tags( $new_instance['name'] );
        $instance['street']         = strip_tags( $new_instance['street'] );
        $instance['plz']            = strip_tags( $new_instance['plz'] );
        $instance['tel']            = strip_tags( $new_instance['tel'] );
        $instance['fax']            = strip_tags( $new_instance['fax'] );
        $instance['mail']           = strip_tags( $new_instance['mail'] );
        return $instance;
    }

    /**
     * form function.
     *
     * @see WP_Widget->form
     * @access public
     * @param array $instance
     * @return void
     */
    function form( $instance ) {
        $subtitle = isset( $instance['subtitle']) ? $instance['subtitle'] : __('Kontakt', 'geopartner' );
        $title = isset( $instance['title'] ) ? $instance['title'] : __('Hauptfiliale', 'geopartner' );
        $name = isset($instance['name']) ? $instance['name'] : __('GEO Partner AG', 'geopartner');
        $street = isset($instance['street']) ? $instance['street'] : __('Baumackerstrasse 24', 'geopartner' );
        $plz = isset($instance['plz']) ? $instance['plz'] : __('CH-8050 Zürich', 'geopartner' );
        $tel = isset($instance['tel']) ? $instance['tel'] : __('+41 61 683 20 24', 'geopartner' );
        $fax = isset($instance['fax']) ? $instance['fax'] : __('+41 44 311 28 07', 'geopartner' );
        $mail = isset($instance['mail']) ? $instance['mail'] : __('info@geopartner.ch', 'geopartner' );
        ?>
        <p>
            <label for="<?php echo $this->get_field_id( 'subtitle' ); ?>"><?php _e( 'Untertitel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'subtitle' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'subtitle' ) ); ?>" type="name" value="<?php echo esc_attr( $subtitle ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Titel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" type="name" value="<?php echo esc_attr( $title ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'name' ); ?>"><?php _e( 'Filialnamen:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'name' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'name' ) ); ?>" type="name" value="<?php echo esc_attr( $name ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'street' ); ?>"><?php _e( 'Strasse:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'street' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'street' ) ); ?>" type="name" value="<?php echo esc_attr( $street ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'plz' ); ?>"><?php _e( 'Ort:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'plz' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'plz' ) ); ?>" type="name" value="<?php echo esc_attr( $plz ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'tel' ); ?>"><?php _e( 'Telefon:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'tel' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'tel' ) ); ?>" type="name" value="<?php echo esc_attr( $tel ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'fax' ); ?>"><?php _e( 'Fax:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'fax' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'fax' ) ); ?>" type="name" value="<?php echo esc_attr( $fax ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'mail' ); ?>"><?php _e( 'Mail:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'mail' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'mail' ) ); ?>" type="name" value="<?php echo esc_attr( $mail ); ?>" /><br />
        </p>
        <?php
    }
}