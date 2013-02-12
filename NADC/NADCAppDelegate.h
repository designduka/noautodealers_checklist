//
//  NADCAppDelegate.h
//  NADC
//
//  Created by Nick Ruta on 6/11/11.
//  Copyright 2011 Ruta Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NADCAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
