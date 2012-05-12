//
//  HelpAboutViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/28/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "HelpAboutViewController.h"
#import "PaiGowAppDelegate.h"
#import "IntroViewController.h"


@implementation HelpAboutViewController
@synthesize myCheatSheetScrollView, myRulesScrollView, homeButton, cheatSheetButton, rulesButton, pageTitle;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.myCheatSheetScrollView.contentSize=CGSizeMake(305,1800);
	self.myRulesScrollView.contentSize=CGSizeMake(305,1200);
	self.myRulesScrollView.backgroundColor = [UIColor clearColor];
	self.myCheatSheetScrollView.backgroundColor = [UIColor clearColor];
	[self onCheat]; // show only cheat sheet
}


-(IBAction) onCheat {
	self.myRulesScrollView.hidden = true;
	self.myCheatSheetScrollView.hidden = false;
	self.rulesButton.hidden = false;
	self.cheatSheetButton.hidden = true;
	self.pageTitle.text = @"Tiles List";
	
}

-(IBAction) onRules {
	self.myRulesScrollView.hidden = false;
	self.myCheatSheetScrollView.hidden = true;
	self.rulesButton.hidden = true;
	self.cheatSheetButton.hidden = false;	
	self.pageTitle.text = @"Rules List";
}

-(IBAction) onBack {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.2];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:appDelegate.window cache:YES];
	[appDelegate.viewController.view removeFromSuperview];
	appDelegate.viewController = appDelegate.origViewController;
	[appDelegate.window addSubview:[appDelegate.origViewController view]];
	[UIView commitAnimations];
	
}


-(IBAction) onIntro {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.introViewController == nil) {
		appDelegate.introViewController = [[IntroViewController alloc] initWithNibName:@"Intro" bundle:[NSBundle mainBundle]];
		UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
		[appDelegate.introViewController view].backgroundColor = background;
		[background release];
	}
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:appDelegate.window cache:YES];
	[appDelegate.viewController.view removeFromSuperview];
	appDelegate.viewController = appDelegate.introViewController;
	[appDelegate.window addSubview:[appDelegate.introViewController view]];
	[UIView commitAnimations];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
