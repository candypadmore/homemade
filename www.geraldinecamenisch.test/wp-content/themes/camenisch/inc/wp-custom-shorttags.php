<?php
/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * Short description for file
 *
 * Long description for file (if any)...
 *
 * PHP version 5
 *
 * @link http://www.deep.ch
 *
 * @package    WordPress
 * @subpackage deep
 * @since      deep 1.0
 * @author     deep AG <team@deep.ch>
 */

class geo_shortcodes_Statics
{
    /**
     * [init description]
     * @return void [description]
     */
    public static function init()
    {
        global $geo_shortcodes;

        // remove default shortcodes
        $remove_wp_default_shortcodes = apply_filters('remove_wp_default_shortcodes', array(
            'wp_caption',
            'caption',
            'audio',
            'video',
            'playlist',
            'embed',
            'gallery',
            'acf',
            'wpseo_breadcrumb',
            'wpseo_sitemap',
        ));

        if (is_array($remove_wp_default_shortcodes)) {
            foreach ($remove_wp_default_shortcodes as $sc) {
                remove_shortcode($sc);
            }
        }

        $shortcodes = $geo_shortcodes->getShortcodes();

        foreach ($shortcodes as $tag => $sc) {
            // remove always before add
            remove_shortcode($tag);
            // add now the shortcode
            $method = array(__CLASS__, $sc['fn']);
            if (is_callable($method, true)) {
                add_shortcode($tag, $method);
            }
        }
    }

    /**
     * [employees description]
     * @param  string $atts
     * @return string
     */
    public static function employees($atts)
    {
        global $geo_shortcodes;

        $defaults = $geo_shortcodes->getAttributes('employees');

        extract(shortcode_atts($defaults, $atts));

        $html = '';

        $empty_src = get_template_directory_uri() . '/img/blank.gif';

        $query_args = array(
            'post_type' => 'profile_employe',
            'post_status' => 'publish',
            'posts_per_page' => -1 ,
            'post_parent' => 0,
            'order' => $sort,
            'orderby' => $sortby,
        );

        if (!empty($category)) {
            $query_args = $geo_shortcodes->getQueryTerms($query_args, $category, 'departments');
        }

        if (!empty($id)) {
            $query_args['post__in'] = explode(',', $id);
        }

        if (!empty($slug)) {

            $tmp_slugs = explode(',', $slug);

            foreach ($tmp_slugs as $tmp_slug) {
                if ($tmp_post = get_page_by_path($tmp_slug, OBJECT, $query_args['post_type'])) {
                    if (!isset($query_args['post__in'])) {
                        $query_args['post__in'] = array();
                    }
                    array_push($query_args['post__in'], $tmp_post->ID);
                }
            }
        }

        $query = new WP_Query($query_args);

        if ($query->have_posts()) {

            $query_posts = $query->get_posts();

            switch ($template) {
                case 'carousel':
                    $thumb_size = 'large';
                    break;

                default:
                    $thumb_size = 'portfolio-large';
                    break;
            }

            $slide_items = array();

            foreach ($query_posts as $post) {

                $post_fields = get_fields($post->ID);

                $slide_body = '';

                $slide_party_title = sprintf('<h2>%1$s</h2>', $post->post_title);
                $slide_party_more = '';

                if (!empty($post_fields['geo_employe_function'])) {
                    $slide_party_title.= sprintf('<h3>%1$s</h3>', $post_fields['geo_employe_function']);
                }

                if (!empty($post_fields['geo_employe_email'])) {
                    $slide_party_more.= sprintf('<p class="employee-email"><a href="mailto:%1$s">%1$s</a></p>', $post_fields['geo_employe_email']);
                }

                if (!empty($post_fields['geo_employe_phone_direkt'])) {
                    $slide_party_more.= sprintf('<p class="employee-phone">Fon: %1$s</p>', $post_fields['geo_employe_phone_direkt']);
                }

                if (!empty($post_fields['geo_employe_phone_mobile'])) {
                    $slide_party_more.= sprintf('<p class="employee-mobile">Mobile: %1$s</p>', $post_fields['geo_employe_phone_mobile']);
                }

                if (!empty($post_fields['geo_employe_nickname'])) {
                    $slide_party_more.= sprintf('<p class="employee-nickname"><em>Nickname: %1$s</em></p>', $post_fields['geo_employe_nickname']);
                }

                $slide_body.= sprintf('<div class="employee-title">%1$s</div>', $slide_party_title);
                $slide_body.= sprintf('<div class="employee-more">%1$s</div>', $slide_party_more);

                $geo_slider_item_image = '';

                if (has_post_thumbnail($post->ID)) {
                    $img_data = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), $thumb_size);
                    $geo_slider_item_image = (string) $img_data[0];
                }

                if (empty($geo_slider_item_image)) {
                    $geo_slider_item_image = $empty_src;
                }

                if (!empty($post->post_content)) {
                    $slide_body.= sprintf('<div class="employee-detail">%1$s</div>', wpautop($post->post_content));
                }

                switch ($template) {
                    case 'carousel':

                        $slide_body = sprintf('<div class="employee-party">%1$s</div>', $slide_body);

                        // $slide_content = sprintf('<div class="container">%1$s</div>', $slide_body);

                        $slide_items[] = sprintf('<div class="item" style="background-image:url(%1$s);">%2$s</div>', $geo_slider_item_image, $slide_body);

                        break;

                    default:

                        $slide_body.= sprintf('<div class="employee-image" style="background-image:url(%1$s);"></div>', $geo_slider_item_image);

                        $slide_content = sprintf('<div class="employee-party">%1$s</div>', $slide_body);

                        $slide_items[] = sprintf('<div class="col-custom-employee %2$s">%1$s</div>', $slide_content, $cls);

                        break;

                }

            }

            switch ($template) {
                case 'carousel':

                    $tmpl = '<div class="slider slider-employees deep-carousel owl-carousel" data-carousel-items="1" data-transition-style="backSlide">
                                <!-- slider-items -->%1$s<!-- /slider-items -->
                                <div class="slider-overlay"></div>
                        </div>';

                    $html = sprintf($tmpl, implode('', $slide_items));

                    break;

                default:

                    if ($row == 'yes') {
                        $tmpl = '<div class="row employees">%1$s</div>';
                        $html = sprintf($tmpl, implode('', $slide_items));
                    } else {
                        $html = implode('', $slide_items);
                    }

                    break;
            }

        }

        if (empty($html)) {
            $html = __('No employee found with given slug.', 'deep');
        }

        if (!empty($title)) {
            $html = sprintf('<h3 class="employee-header">%s</h3>', $title) . $html;
        }

        $html = apply_filters('shortcode_employees_filter', $html);

        return $html;
    }

    /**
     * [widget description]
     * @param  string $atts [description]
     * @return string       [description]
     */
    public static function widget($atts)
    {
        global $geo_shortcodes;

        $defaults = $geo_shortcodes->getAttributes('widget');

        extract(shortcode_atts($defaults, $atts));

        $html = '';

        if (isset($area) && is_active_sidebar($area)) {

            $wrapper = !empty($wrap_cls);

            ob_start();

                if ($wrapper) {
                    echo sprintf('<div class="%s">', $wrap_cls);
                }

                dynamic_sidebar($area);

                if ($wrapper) {
                    echo '</div>';
                }

                $html = ob_get_contents();

            ob_end_clean();
        }

        $html = do_shortcode($html);

        $html = apply_filters('shortcode_widget_filter', $html);

        return $html;
    }

    /**
     * [grid_row description]
     * @param  string $atts    [description]
     * @param  string $content [description]
     * @return string          [description]
     */
    public static function grid_row($atts, $content = '')
    {
        global $geo_shortcodes;

        $defaults = $geo_shortcodes->getAttributes('grid_row');

        extract(shortcode_atts($defaults, $atts));

        $autoformat = ($autoformat == 'true') ? true : false;

        $content = do_shortcode(trim($content));

        if ($autoformat) {
            $content = wpautop($content);
        }

        $row_classes = array('row');

        if (!empty($cls)) {
            $row_classes[] = $cls;
        }

        $html = sprintf('<div class="%s">', implode(' ', $row_classes)) . $content . '</div>';

        return $html;
    }

    /**
     * [grid_col description]
     * @param  string $atts    [description]
     * @param  string $content [description]
     * @return string          [description]
     */
    public static function grid_col($atts, $content = '')
    {
        global $geo_shortcodes;

        $defaults = $geo_shortcodes->getAttributes('grid_col');

        extract(shortcode_atts($defaults, $atts));

        $autoformat = ($autoformat == 'true') ? true : false;

        $content = do_shortcode(trim($content));

        if ($autoformat) {
            $content = wpautop($content);
        }

        $html = sprintf('<div class="%s">', $cls) . $content . '</div>';

        return $html;
    }
}
