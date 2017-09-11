//
//  Config.h
//  912
//
//  Created by Seacity on 2017/9/8.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#ifndef Config_h
#define Config_h


/// UI常量
#define STATUS_BAR_HEIGHT       20.0f
#define NAVIGATION_ITEM_HEIGHT  44.0f
#define NAVIGATION_BAR_HEIGHT   (STATUS_BAR_HEIGHT + NAVIGATION_ITEM_HEIGHT)
#define TAB_BAR_HEIGHT          49.0f
#define FULL_SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define FULL_SCREEN_HEIGHT  ([[UIScreen mainScreen] bounds].size.height)
#define CONTENT_HEIGHT  (FULL_SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT)
#define FULL_CONTENT_HEIGHT (FULL_SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT)
#define APP_SCREEN_WIDTH  ([[UIScreen mainScreen] applicationFrame].size.width)
#define APP_SCREEN_HEIGHT  ([[UIScreen mainScreen] applicationFrame].size.height)

#endif /* Config_h */
