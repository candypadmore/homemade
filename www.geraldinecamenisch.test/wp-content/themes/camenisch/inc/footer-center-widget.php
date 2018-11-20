<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

/**
 * footer content class center.
 *
 * @extends WP_Widget
 */
class geopartner_center_footer_widget extends WP_Widget {

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
    function geopartner_center_footer_widget() {

        /* Widget variable settings. */
        $this->widget_cssclass    = 'geopartner-center-footer-widget';
        $this->widget_description = __( 'Element für zwei Filialen', 'geopartner' );
        $this->widget_idbase      = 'geopartner-center-footer-widget';
        $this->widget_name        = __( 'Filialen', 'geopartner' );

        /* Widget settings. */
        $widget_ops = array( 'classname' => $this->widget_cssclass, 'description' => $this->widget_description );

        /* Create the widget. */
        $this->WP_Widget( 'geopartner-center-footer-widget', $this->widget_name, $widget_ops );
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
        $title = isset( $instance['title'] ) ? apply_filters( 'widget_title', $instance['title'], $instance, $this->id_base ) : __( 'Filialen', 'geopartner' );
        $street1 = isset( $instance['street1'] ) ? apply_filters( 'widget_street1', $instance['street1'], $instance, $this->id_base ) : __( 'Clarastrasse 7', 'geopartner' );
        $plz1 = isset( $instance['plz1'] ) ? apply_filters( 'widget_plz1', $instance['plz1'], $instance, $this->id_base ) : __( 'CH-4058 Basel', 'geopartner' );
        $tel1 = isset( $instance['tel1'] ) ? apply_filters( 'widget_tel1', $instance['tel1'], $instance, $this->id_base ) : __( '+41 61 683 20 24', 'geopartner' );
        $street2 = isset( $instance['street2'] ) ? apply_filters( 'widget_street2', $instance['street2'], $instance, $this->id_base ) : __( 'Vechigenstrasse 6', 'geopartner' );
        $plz2 = isset( $instance['plz2'] ) ? apply_filters( 'widget_plz2', $instance['plz2'], $instance, $this->id_base ) : __( 'CH-3076 Worb', 'geopartner' );
        $tel2 = isset( $instance['tel2'] ) ? apply_filters( 'widget_tel2', $instance['tel2'], $instance, $this->id_base ) : __( '+41 31 550 34 70', 'geopartner' );
        ?>
            <div>
                <div class="thema"><?php echo $subtitle; ?></div>
                <div class="servicetitle"><?php echo $title; ?></div>
                <p><?php echo $street1; ?><br><?php echo $plz1; ?><br><img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/phone.svg"> <?php echo $tel1; ?></p>
                <p><?php echo $street2; ?><br><?php echo $plz2; ?><br><img class="contacticon" src="<?php echo get_template_directory_uri(); ?>/img/phone.svg"> <?php echo $tel2; ?></p>
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
        $instance['street1']           = strip_tags( $new_instance['street1'] );
        $instance['plz1']        = strip_tags( $new_instance['plz1'] );
        $instance['tel1']        = strip_tags( $new_instance['tel1'] );
        $instance['street2']           = strip_tags( $new_instance['street2'] );
        $instance['plz2']        = strip_tags( $new_instance['plz2'] );
        $instance['tel2']        = strip_tags( $new_instance['tel2'] );
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
        $title = isset( $instance['title'] ) ? $instance['title'] : __('Filialen', 'geopartner' );
        $street1 = isset($instance['street1']) ? $instance['street1'] : __('Clarastrasse 7', 'geopartner');
        $plz1 = isset($instance['plz1']) ? $instance['plz1'] : __('CH-4058 Basel', 'geopartner' );
        $tel1 = isset($instance['tel1']) ? $instance['tel1'] : __('+41 61 683 20 24', 'geopartner' );
        $street2 = isset($instance['street2']) ? $instance['street2'] : __('Vechigenstrasse 6', 'geopartner');
        $plz2 = isset($instance['plz2']) ? $instance['plz2'] : __('CH-3076 Worb', 'geopartner' );
        $tel2 = isset($instance['tel2']) ? $instance['tel2'] : __('+41 31 550 34 70', 'geopartner' );
        ?>
        <p>
            <label for="<?php echo $this->get_field_id( 'subtitle' ); ?>"><?php _e( 'Untertitel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'subtitle' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'subtitle' ) ); ?>" type="subtitle" value="<?php echo esc_attr( $subtitle ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Titel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" type="title" value="<?php echo esc_attr( $title ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'street1' ); ?>"><?php _e( 'Strasse:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'street1' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'street1' ) ); ?>" type="street1" value="<?php echo esc_attr( $street1 ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'plz1' ); ?>"><?php _e( 'Ort:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'plz1' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'plz1' ) ); ?>" type="plz1" value="<?php echo esc_attr( $plz1 ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'tel1' ); ?>"><?php _e( 'Telefon:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'tel1' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'tel1' ) ); ?>" type="tel1" value="<?php echo esc_attr( $tel1 ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'street2' ); ?>"><?php _e( 'Strasse 2:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'street2' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'street2' ) ); ?>" type="street2" value="<?php echo esc_attr( $street2 ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'plz2' ); ?>"><?php _e( 'Ort 2:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'plz2' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'plz2' ) ); ?>" type="plz2" value="<?php echo esc_attr( $plz2 ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'tel2' ); ?>"><?php _e( 'Telefon 2:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'tel2' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'tel2' ) ); ?>" type="tel2" value="<?php echo esc_attr( $tel2 ); ?>" /><br />
        </p>
        <?php
    }
}