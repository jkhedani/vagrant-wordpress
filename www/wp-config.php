<?php
// ===================================================
// Load database info and local development parameters
// ===================================================
if ( file_exists( dirname( __FILE__ ) . '/local-config.php' ) ) {
	define( 'WP_LOCAL_DEV', true );
	include( dirname( __FILE__ ) . '/local-config.php' );
} else {
	define( 'WP_LOCAL_DEV', false );
	define( 'DB_NAME', '%%DB_NAME%%' );
	define( 'DB_USER', '%%DB_USER%%' );
	define( 'DB_PASSWORD', '%%DB_PASSWORD%%' );
	define( 'DB_HOST', '%%DB_HOST%%' ); // Probably 'localhost'
}

// ========================
// Custom Content Directory
// ========================
define( 'WP_CONTENT_DIR', dirname( __FILE__ ) . '/content' );
define( 'WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/content' );

// ================================================
// You almost certainly do not want to change these
// ================================================
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

// ==============================================================
// Salts, for security
// Grab these from: https://api.wordpress.org/secret-key/1.1/salt
// ==============================================================
define('AUTH_KEY',         'yj0SV}T4Ly6xA<<Yf~40h*wABjrT}j ,3LSgX+[WVPx(^g(N:-}Sn68izffI|Qi5');
define('SECURE_AUTH_KEY',  '%kDV;RzNb-Vm+Qc)Ha`R|V$Nh+VPuWK:|5W8|6fkT|Q-fe8->}SKT;4KFl?bW=x+');
define('LOGGED_IN_KEY',    '3TP#7j~9lvW!^+8f$>+9P:O?R=Fow;0^I7V)%YhhGzjzij-l&vuG,c-ynI1)u(sU');
define('NONCE_KEY',        '1He,[.]N![Q{aXSFYCj~]rH+5lR*u>K>R6[<#Yy}D8bgy/#OqArwtCVef??]SiU;');
define('AUTH_SALT',        'k)19bgv)beQ:d)>dRiOA!8ezs3*d1#tGrG{m/1vQprg/!I7*i9ISU+l|5MN=G_69');
define('SECURE_AUTH_SALT', 'G*a<:VcG=)s Bn$.BUf}-dEk-F]!TBF|O/kyK@.)}dbH]#$6 -Vn5Gi3c|Z5>oza');
define('LOGGED_IN_SALT',   'f1Y*eXHN/0Y8=[P^PL,(m}+5rq.Z} PJ,2WKjXPHl?gUe3:h%b`d?A6[(0w]g2c)');
define('NONCE_SALT',       'q[4}3tGyBLj|k(<(<X~?7_4$2Ta.jxGv@iAbSL%,r2!y;| B|vk*|nw50jda.T|G');

// ==============================================================
// Table prefix
// Change this if you have multiple installs in the same database
// ==============================================================
$table_prefix  = 'wp_';

// ================================
// Language
// Leave blank for American English
// ================================
define( 'WPLANG', '' );

// ===========
// Hide errors
// ===========
ini_set( 'display_errors', 0 );
define( 'WP_DEBUG_DISPLAY', false );

// =================================================================
// Debug mode
// Debugging? Enable these. Can also enable them in local-config.php
// =================================================================
// define( 'SAVEQUERIES', true );
// define( 'WP_DEBUG', true );

// ======================================
// Load a Memcached config if we have one
// ======================================
if ( file_exists( dirname( __FILE__ ) . '/memcached.php' ) )
	$memcached_servers = include( dirname( __FILE__ ) . '/memcached.php' );

// ===========================================================================================
// This can be used to programatically set the stage when deploying (e.g. production, staging)
// ===========================================================================================
define( 'WP_STAGE', '%%WP_STAGE%%' );
define( 'STAGING_DOMAIN', '%%WP_STAGING_DOMAIN%%' ); // Does magic in WP Stack to handle staging domain rewriting

// ===================
// Bootstrap WordPress
// ===================
if ( !defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/wp/' );
require_once( ABSPATH . 'wp-settings.php' );
