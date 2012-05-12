//
//  IntroViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/28/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "IntroViewController.h"
#import "PaiGowAppDelegate.h"


@implementation IntroViewController
@synthesize myScrollView, myScrollView2, homeButton, webView;

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

- (void)viewDidLoad {
    [super viewDidLoad];
	self.myScrollView.contentSize=CGSizeMake(300,1200);
	self.myScrollView.hidden = false;
	self.webView.hidden = true;
	isInfo = false;
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"]isDirectory:NO]]];
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

// Toggle to info and back
-(IBAction) onInfo {
	if(!isInfo) {
		isInfo = true;
		self.myScrollView.hidden = true;
		self.webView.hidden = false;
		[infoButton setTitle:@"Introduction" forState:UIControlStateNormal];
	} else {
		isInfo = false;
		self.myScrollView.hidden = false;
		self.webView.hidden = true;
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"]isDirectory:NO]]];
		[infoButton setTitle:@"Help & About" forState:UIControlStateNormal];
	}
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

-(IBAction) onHelpAbout {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.helpViewController == nil) {
		appDelegate.helpViewController = [[HelpAboutViewController alloc] initWithNibName:@"HelpAbout" bundle:[NSBundle mainBundle]];
		UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
		[appDelegate.helpViewController view].backgroundColor = background;
		[background release];
	}
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:appDelegate.window cache:YES];
	[appDelegate.viewController.view removeFromSuperview];
	appDelegate.viewController = appDelegate.helpViewController;
	[appDelegate.window addSubview:[appDelegate.helpViewController view]];
	[UIView commitAnimations];
}

/*
- (void)dealloc {
    [super dealloc];
}
*/

@end
