<?php
define('DB_HOST', $DB_HOST);
define('DB_NAME', $MYDB);
define('DB_PASSWORD', $DB_PASS);
define('DB_USER', $DB_USER);
define('DB_CHARSET','utf8');
define('DB_COLLATE','');
define('WP_DEBUG',false);
$table_prefix='wp_4mr0';

if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] ==='https'){
	$_SERVER['HTTPS'] ='on';
}

define('WP_HOME', $domain);
define('WP_SITEURL', $domain);



define('AUTH_KEY',         'SVB1mP5(z8(vS%>Zr!Y=,$O-{+QHZ9v9q8Qy+%~,DC5$&;-|[p0:xobzmi{$B.SN');
define('SECURE_AUTH_KEY',  'f|!Wp|.e3l>T-6hoZoB7<D}Bs%|~Yw8L+Mj/27b)ofchn50)!I%z;D}&&#pN1>eO');
define('LOGGED_IN_KEY',    'LaD*K%8(*~|T|(1J[L*,PN$T$H_2z+0`YE4N-#%G7;AFiED)D|QoB<eM?(Q9pD=I');
define('NONCE_KEY',        '-vfj%i20zA-Cct9T[EubFa~$fVon--9OGq(wT<6#a/Ub!w:.Dw,7q{Yir++g{?Qi');
define('AUTH_SALT',        '|*ka|q}&F0W|6Mr1;||E&I[.k/->uPfL !+} A,WAm6s-a9e)S7H3&_{nEOUo`$#');
define('SECURE_AUTH_SALT', 'Sq}8Pjj&F]=X=*i}&z)Mx]5M?i5[Xmm/g.Df:xH9s<k`znW?44:2r(`%m}CATZR3');
define('LOGGED_IN_SALT',   'N}cA=rAvXrIP34BP*6Evw0v7{-&->5]i%+83V|wgG3i}GW}mZJnpXRVQ}IcG+Jb6');
define('NONCE_SALT',       '<SD[]6}~%OFqkvPn&<[w){s=}On<|vesg>hgb|WKA]/6 *|CA1u.#r9-v(ovIIZT');

if( !defined('ABSPATH') )
	define('ABSPATH', __DIR__ . '/');
require_once ABSPATH . 'wp-settings.php';

?>
