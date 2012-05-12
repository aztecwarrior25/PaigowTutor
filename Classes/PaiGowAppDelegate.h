//
//  PaiGowAppDelegate.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreenViewController.h"
@class PaiGowViewController;
@class TilePracticeViewController;
@class TilePickerViewController;
@class HelpAboutViewController;
@class IntroViewController;

@interface PaiGowAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	HomeScreenViewController *viewController;
	HomeScreenViewController *origViewController;
	PaiGowViewController *pgViewController;
	TilePracticeViewController *tpViewController;
	TilePickerViewController *tprViewController;
	HelpAboutViewController *helpViewController;
	IntroViewController *introViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HomeScreenViewController *viewController;
@property (nonatomic, retain) IBOutlet HomeScreenViewController *origViewController;
@property (nonatomic, retain) IBOutlet TilePracticeViewController *tpViewController;
@property (nonatomic, retain) IBOutlet PaiGowViewController *pgViewController;
@property (nonatomic, retain) IBOutlet TilePickerViewController *tprViewController;
@property (nonatomic, retain) IBOutlet HelpAboutViewController *helpViewController;
@property (nonatomic, retain) IBOutlet IntroViewController *introViewController;
@end

