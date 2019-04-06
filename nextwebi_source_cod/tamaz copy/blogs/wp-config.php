<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress_tz');

/** MySQL database username */
define('DB_USER',       'wordpress_tz');

/** MySQL database password */
define('DB_PASSWORD',       'India@2016');

/** MySQL hostname */
define('DB_HOST', 'localhost:3306');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',       '%u@h%OeRLY)p6pO73MB9VRW5rDLrPMZE22H5oKJSwqsx&x*RUpbGP0i10uAvQdK(');
define('SECURE_AUTH_KEY',       'p9%X6%yG3)9S1XCi1mgjww9rn*O)59IzTZd0AYobuWep1pphyCxvbZdw3U%j5gBw');
define('LOGGED_IN_KEY',       '&WmvK#tz27(fLWhwOp(akfOICwFWjAH5mhchY9lvFrgSg3kj0^P%9FiMLy0SX7O(');
define('NONCE_KEY',       'Rgge#Ij#bSwX&!k69S2u9zd%57opYix6)ErKz&&lUqZnbB89BPoPKy!O!*Gn6awk');
define('AUTH_SALT',       '995B1SAgS)hX0QiUsmFeL!l)vABkIYBA(g3qQI15mEq4Rw2sJPCg60QvE%oKwBnw');
define('SECURE_AUTH_SALT',       'OizSPK7wkk^%QgHDPDmJDRz(iOlW1VApJjYr8lMFMicxn896qy#Qu(q8gdBB!Z3w');
define('LOGGED_IN_SALT',       'H)o1WgmxwD^fKxUGDGAe%!kdacL@x2!*i5rQTNxYcI5MM*68zonms(3L!U*9LeMo');
define('NONCE_SALT',       'EXI958m##1nTPiEcFzEoO1P)lx1r#^FQ)%4tv(mMPFN4b^xldiEwuiud!9c*(l9E');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = '9RFm25e_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

define( 'WP_ALLOW_MULTISITE', true );

define ('FS_METHOD', 'direct');
?>