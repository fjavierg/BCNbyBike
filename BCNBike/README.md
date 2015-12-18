BCN by Bike
========================
Author: J. Gómez
Date: 2015
Version : 1.0

Technologies: XLST, JS, PHP, HTML5
Summary: Barcelona by bike. Useful info: bike lanes, 'bicing' stations, tracks, anchor points, .. .
Target Product: 

What is it?
-----------

Simple HTML/JS page that renders Barcelona map centered in user location when available and several info layers:
 *    BCN Bike lanes layer
 *    ZONAS 30 layer 
 *    Ronda Verde layer
 *    Bike anchor points layer
 *    Bicing layer (Dynamic)

PHP script to periodically fetch real time info about 'bicing' stations status from OPENDATA web service (http://wservice.viabicing.cat/v1/getstations.php?v=1), transforms into KML files using XSL tranformation file and stores it for rendering part.

Server settings for cache settings, access to external url, .. included
