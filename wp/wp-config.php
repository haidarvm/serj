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
define('DB_NAME', 'mbs');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

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
define('AUTH_KEY',         '8?n? GGGQ0WsE2dQt+$rf,~-xrHXIGJqUFaAp>}jn-R*+/s0@TN9>[&c)l-?uOo4');
define('SECURE_AUTH_KEY',  'Os}2Qs#GEC;!]Em+cy-de;J+7.m_PYq>r >b&>I`VH@gTUe%mI-]&D@*<Q}A{|RY');
define('LOGGED_IN_KEY',    'xMmY%zqZj3_#Y*_JOPs95e,T|@|Z85*C|6#8j(sLT2ckk&alEH]yNRE`kRYD]. L');
define('NONCE_KEY',        'G:DPe_cX9[!Q:_Th5@>_do ^R7tq>26*|)<w+*<)$PVN/L1iZTJ-dhdy%X`hoe{N');
define('AUTH_SALT',        '(%{:.~nY=Hns8!d7*VDDX<$M=xgw4]zA[S.A8(t>GFB<xRG0<Rk4bY;El 5G5c8P');
define('SECURE_AUTH_SALT', 'L7uP0!AQK:ee=||NOA-x&8z^(t!-8-B0Kze$+bnI<{LQ>>&x ,^Z%|:CDpYR^s86');
define('LOGGED_IN_SALT',   'h}-S7w [OX])A?.1:|QMRaq,4Ro(eL:=:EJe-<OShcTmD@3UFt~BC|9|VdqV_?Ze');
define('NONCE_SALT',       ':!Yhs[cFk@ocO!|%+dPYT$Q?lRRnD6RD Uzl1pXxzNK^yYVLflEM5IZ/sC7UqY^9');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

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
