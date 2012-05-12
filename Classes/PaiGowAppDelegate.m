//
//  PaiGowAppDelegate.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import "PaiGowAppDelegate.h"
#import "PaiGowViewController.h"
#import "Deck.h"

@implementation PaiGowAppDelegate

@synthesize window;
@synthesize viewController, origViewController, pgViewController, tpViewController, tprViewController, helpViewController, introViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after app launch    
    [window addSubview:viewController.view];
	origViewController = viewController;
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
	viewController.view.backgroundColor = background;
	[background release];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
