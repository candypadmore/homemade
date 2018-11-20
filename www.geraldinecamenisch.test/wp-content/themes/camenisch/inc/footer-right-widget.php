<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

/**
 * footer content class right.
 *
 * @extends WP_Widget
 */
class geopartner_right_footer_widget extends WP_Widget {

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
    function geopartner_right_footer_widget() {

        /* Widget variable settings. */
        $this->widget_cssclass    = 'geopartner-right-footer-widget';
        $this->widget_description = __( 'Zeigt die Öffnungszeiten', 'geopartner' );
        $this->widget_idbase      = 'geopartner-right-footer-widget';
        $this->widget_name        = __( 'Öffnungszeiten', 'geopartner' );

        /* Widget settings. */
        $widget_ops = array( 'classname' => $this->widget_cssclass, 'description' => $this->widget_description );

        /* Create the widget. */
        $this->WP_Widget( 'geopartner-right-footer-widget', $this->widget_name, $widget_ops );
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
        $subtitle = isset( $instance['subtitle'] ) ? apply_filters( 'widget_subtitle', $instance['subtitle'], $instance, $this->id_base ) : __( 'Info', 'geopartner' );
        $title = isset( $instance['title'] ) ? apply_filters( 'widget_title', $instance['title'], $instance, $this->id_base ) : __( 'Öffnungszeiten', 'geopartner' );
        $text = isset( $instance['text'] ) ? apply_filters( 'widget_text', $instance['text'], $instance, $this->id_base ) : __( 'Wir sind in unseren drei Filialen während den Büroöffnungszeiten gerne telefonisch und per Email für Sie da.', 'geopartner' );
        $morning = isset( $instance['morning'] ) ? apply_filters( 'widget_morning', $instance['morning'], $instance, $this->id_base ) : __( '8:00 - 12:00', 'geopartner' );
        $evening = isset( $instance['evening'] ) ? apply_filters( 'widget_evening', $instance['evening'], $instance, $this->id_base ) : __( '13:30 - 17:30', 'geopartner' );
        ?>
            <div>
                <div class="thema"><?php echo $subtitle; ?></div>
                <div class="servicetitle"><?php echo $title; ?></div>
                <p><?php echo $text; ?></p>
                <p>Montag - Freitag<br><?php echo $morning; ?><br><?php echo $evening; ?></p>
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
        $instance['text']           = strip_tags( $new_instance['text'] );
        $instance['morning']        = strip_tags( $new_instance['morning'] );
        $instance['evening']        = strip_tags( $new_instance['evening'] );
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
        $subtitle = isset( $instance['subtitle']) ? $instance['subtitle'] : __('Info', 'geopartner' );
        $title = isset( $instance['title'] ) ? $instance['title'] : __('Öffnungszeiten', 'geopartner' );
        $text = isset($instance['text']) ? $instance['text'] : __('Wir sind in unseren drei Filialen während den Büroöffnungszeiten gerne telefonisch und per Email für Sie da.', 'geopartner');
        $morning = isset($instance['morning']) ? $instance['morning'] : __('8:00 - 12:00', 'geopartner' );
        $evening = isset($instance['evening']) ? $instance['evening'] : __('13:30 - 17:30', 'geopartner' );
        ?>
        <p>
            <label for="<?php echo $this->get_field_id( 'subtitle' ); ?>"><?php _e( 'Untertitel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'subtitle' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'subtitle' ) ); ?>" type="text" value="<?php echo esc_attr( $subtitle ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Titel:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'title' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>" />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'text' ); ?>"><?php _e( 'Text:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'text' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'text' ) ); ?>" type="text" value="<?php echo esc_attr( $text ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'morning' ); ?>"><?php _e( 'Morgen-Zeiten:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'morning' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'morning' ) ); ?>" type="text" value="<?php echo esc_attr( $morning ); ?>" /><br />
        </p><p>
            <label for="<?php echo $this->get_field_id( 'evening' ); ?>"><?php _e( 'Abend-Zeiten:', 'geopartner' ); ?></label>
            <input class="widefat" id="<?php echo esc_attr( $this->get_field_id( 'evening' ) ); ?>" name="<?php echo esc_attr( $this->get_field_name( 'evening' ) ); ?>" type="text" value="<?php echo esc_attr( $evening ); ?>" /><br />
        </p>
        <?php
    }
}