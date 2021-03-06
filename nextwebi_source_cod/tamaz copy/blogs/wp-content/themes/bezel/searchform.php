<?php
/**
 * The template for displaying search forms.
 *
 * @package Bezel
 */
?>

<form role="search" method="get" class="search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
	<label>
		<span class="screen-reader-text"><?php echo esc_html_x( 'Search for:', 'label', 'bezel' ); ?></span>
		<input type="search" class="search-field" placeholder="<?php echo esc_attr_x( 'Search &hellip;', 'placeholder', 'bezel' ); ?>" value="<?php echo get_search_query(); ?>" name="s" title="<?php echo esc_attr_x( 'Search for:', 'label', 'bezel' ); ?>" />
	</label>
	<button type="submit" class="search-submit"><span class="screen-reader-text"><?php echo esc_html_x( 'Search', 'submit button', 'bezel' ); ?></span></button>
</form>
