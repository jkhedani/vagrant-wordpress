<?php
/*
This is a sample local-config.php file
In it, you *must* include the four main database defines

You may include other settings here that you only want enabled on your local development checkouts
*/

define( 'DB_NAME', 'db_name' );
define( 'DB_USER', 'db_user' );
define( 'DB_PASSWORD', 'db_pass' );
define( 'DB_HOST', 'localhost' ); // Probably 'localhost'

// Development Configuration
define('WP_DEBUG', true); // Enable debugging
define('WP_DEBUG_DISPLAY', false); // Hide debugging from client view
define('WP_DEBUG_LOG', true); // Create debug log file when errors occur
