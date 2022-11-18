import 'package:flutter/material.dart';
import '../../Constants/constants.dart';

class Responsive {
  late String device;

  String deviceType() {
    device = "mobile";

    if (deviceShortestSide! > 800) {
      device = "desktop";
    } else if (deviceShortestSide! > 650) {
      device = "tablet";
    }

    return device;
  }

  BoxConstraints formAreaWidth() {
    return BoxConstraints(maxWidth: 600);
  }

  BoxConstraints contentAreaWidth() {
    late double mw;

    device = deviceType();

    if (deviceOrientation == Orientation.landscape) {
      if (device == "mobile") {
        mw = 900;
      } else if (device == "tablet") {
        mw = 1100;
      } else if (device == "desktop") {
        mw = 1200;
      }
    }

    if (deviceOrientation == Orientation.portrait) {
      if (device == "mobile") {
        mw = 550;
      } else if (device == "tablet") {
        mw = 700;
      } else if (device == "desktop") {
        mw = 800;
      }
    }

    // return maxWidth;
    return BoxConstraints(maxWidth: mw);
  }
}


/*
	Apple Products																			
|									        	|	Pixel Size							|	Viewport	|
|	iPhone								  	
|	iPhone XR									|	828 x 1792							|	414 x 896	|
|	iPhone XS									|	1125 x 2436							|	375 x 812	|
|	iPhone XS Max							|	1242 x 2688							|	414 x 896	|
|	iPhone X									|	1125 x 2436							|	375 x 812	|
|	iPhone 8 Plus							|	1080 x 1920							|	414 x 736	|
|	iPhone 8									|	750 x 1334							|	375 x 667	|
|	iPhone 7 Plus							|	1080 x 1920							|	414 x 736	|
|	iPhone 7									|	750 x 1334							|	375 x 667	|
|	iPhone 6 Plus/6S Plus			|	1080 x 1920							|	414 x 736	|
|	iPhone 6/6S								|	750 x 1334							|	375 x 667	|
|	iPhone 5									|	640 x 1136							|	320 x 568	|
|	iPod									
|	iPod Touch								|	640 x 1136							|	320 x 568	|
|	iPad									
|	iPad Pro									|	2048 x 2732							|	1024 x 1366	|
|	iPad 3rd & 4th Generation |	1536 x 2048							|	768 x 1024	|
|	iPad Air 1 & 2						|	1536 x 2048							|	768 x 1024	|
|	iPad Mini 2 & 3						|	1536 x 2048							|	768 x 1024	|
|	iPad Mini									|	768 x 1024							|	768 x 1024	|


|	Android Devices									
|       										|	Pixel Size							|	Viewport	|
|	Phones									
|	Nexus 6P									|	1440 x 2560							|	412 x 732	|
|	Nexus 5X									|	1080 x 1920							|	412 x 732	|
|	Google Pixel 4 XL					|	1440 x 869							|	412 x 869	|
|	Google Pixel 4						|	1080 x 2280							|	412 x 869	|
|	Google Pixel 3a XL				|	1080 x 2160							|	412 x 824	|
|	Google Pixel 3a						|	1080 x 2220							|	412 x 846	|
|	Google Pixel 3 XL					|	1440 x 2960							|	412 x 847	|
|	Google Pixel 3						|	1080 x 2160							|	412 x 824	|
|	Google Pixel 2 XL					|	1440 x 2560							|	412 x 732	|
|	Google Pixel XL						|	1440 x 2560							|	412 x 732	|
|	Google Pixel							|	1080 x 1920							|	412 x 732	|
|	Samsung Galaxy Note 10+		|	1440 x 3040							|	412 x 869	|
|	Samsung Galaxy Note 10		|	1080 x 2280							|	412 x 869	|
|	Samsung Galaxy Note 9			|	1440 x 2960							|	360 x 740	|
|	Samsung Galaxy Note 5			|	1440 x 2560							|	480 x 853	|
|	LG G5							    		|	1440 x 2560							|	480 x 853	|
|	One Plus 3								|	1080 x 1920							|	480 x 853	|
|	Samsung Galaxy S9+				|	1440 x 2960							|	360 x 740	|
|	Samsung Galaxy S9				  |	1440 x 2960							|	360 x 740	|
|	Samsung Galaxy S8+				|	1440 x 2960							|	360 x 740	|
|	Samsung Galaxy S8					|	1440 x 2960							|	360 x 740	|
|	Samsung Galaxy S7 Edge		|	1440 x 2560							|	360 x 640	|
|	Samsung Galaxy S7					|	1440 x 2560							|	360 x 640	|
|	Tablets									  |								|		      |
|	Nexus 9									  |	1536 x 2048							|	768 x 1024	|
|	Nexus 7 (2013)						|	1200 x 1920							|	600 x 960	|
|	Pixel C							  		|	1800 x 2560							|	900 x 1280	|
|	Samsung Galaxy Tab 10	  	|	800 x 1280							|	800 x 1280	|
|	Chromebook Pixel				  |	2560 x 1700							|	1280 x 850	|
*/