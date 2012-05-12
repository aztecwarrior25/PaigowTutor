//
//  HelpAboutViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/28/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelpAboutViewController : UIViewController {
	IBOutlet UIScrollView *myCheatSheetScrollView;
	IBOutlet UIScrollView *myRulesScrollView;
	IBOutlet UIButton *homeButton;
	IBOutlet UIButton *rulesButton;
	IBOutlet UIButton *cheatSheetButton;
	IBOutlet UILabel *pageTitle;
	
}

@property (nonatomic, retain) UIScrollView *myCheatSheetScrollView;
@property (nonatomic, retain) UIScrollView *myRulesScrollView;
@property (nonatomic, retain) UIButton *homeButton;
@property (nonatomic, retain) UIButton *cheatSheetButton;
@property (nonatomic, retain) UIButton *rulesButton;
@property (nonatomic, retain) UILabel *pageTitle;

-(IBAction) onBack ;
-(IBAction) onCheat;
-(IBAction) onRules;
-(IBAction) onIntro;
@end
