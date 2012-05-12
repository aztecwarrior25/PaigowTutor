//
//  PaiGowViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import "PaiGowViewController.h"
#import "PaiGowAppDelegate.h"
#import "UIMovableImageTile.h"
#import "TilePracticeViewController.h"
#import "Domino.h"
#import "Deck.h"
#import "Hand.h"
#import <QuartzCore/QuartzCore.h>


// Our conversion definition
#define DEGREES_TO_RADIANS(angle) ((angle / 180.0) * M_PI)

@implementation PaiGowViewController
@synthesize flipView, mainView;
@synthesize drawnTiles, upperHand, lowerHand;
@synthesize pairValues;
@synthesize selectedImage;
@synthesize selectedPos;
@synthesize resetButton,commitButton,drawTiles, dudHouseWayButton;

 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
	 UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
	 [self view].backgroundColor = background;
	 [background release];
 }
 return self;
 }

 enum {
	AB_PAIR = 1,
    AC_PAIR = 2,
	AD_PAIR = 3,
	BC_PAIR = 4,
	BD_PAIR = 5,
	CD_PAIR = 6
} pairs_possible;
/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	commitButton.hidden = true;
	resetButton.hidden = true;
	dudHouseWayButton.hidden = true;
	[super viewDidLoad];
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
- (void) clearAllSubviews {
	for (UIView *view in [self.view subviews]) {
		if([view isKindOfClass: [UIImageView class]]) {
			UIImageView *img = (UIImageView*) view;
			//NSLog([NSString stringWithFormat:@"removing image height %d" ,img.frame.size.height]); 
			if(img.frame.size.width < 200.0)
				[view removeFromSuperview];
		}
	}
	
	selectedImage = nil;
	selectedPos = -1;
}

-(IBAction) onDrawTilesClick {
	[self clearAllSubviews];
	
	Deck * d = [[Deck alloc] init];
	//[d printDeck];
	[d shuffle];
	//[d printDeck];
	NSMutableArray *tilesDrawn = [d dealWith:4];
	drawnTiles = tilesDrawn;
	[self showDealOrig];
	[d release];
	
	commitButton.hidden = true;
	drawTiles.hidden = true;
	dudHouseWayButton.hidden = true;
	pairValues.text = @"Select first tile (just tap)";
	
	Domino* firstTile = (Domino *) [drawnTiles objectAtIndex:0];
	Domino* secondTile = (Domino *) [drawnTiles objectAtIndex:1];
	Domino* thirdTile = (Domino *) [drawnTiles objectAtIndex:2];
	Domino* fourthTile = (Domino *) [drawnTiles objectAtIndex:3];
	// progressing considered as 1 through 6
	AB =[[Hand alloc] initWithTileOne:firstTile tileTwo:secondTile]; // hand 1
	AC =[[Hand alloc] initWithTileOne:firstTile tileTwo:thirdTile];
	AD =[[Hand alloc] initWithTileOne:firstTile tileTwo:fourthTile];
	BC =[[Hand alloc] initWithTileOne:secondTile tileTwo:thirdTile];
	BD =[[Hand alloc] initWithTileOne:secondTile tileTwo:fourthTile];
	CD =[[Hand alloc] initWithTileOne:thirdTile tileTwo:fourthTile]; // hand 6
	// pairs 1,6 || 2,5 || 3,4
	
	
}

/*Test framework to test strategy*/
-(IBAction) onTestRunClick {
	NSMutableArray *tilesDrawn = [[NSMutableArray alloc] init];
	[tilesDrawn addObject:(Domino *)[[Domino alloc] initWithPosition:1 numberDots:3 name:"Gee-Joon-3"]];
	[tilesDrawn addObject:(Domino *)[[Domino alloc] initWithPosition:1 numberDots:3 name:"Gee-Joon-3"]];
	[tilesDrawn addObject:(Domino *)[[Domino alloc] initWithPosition:1 numberDots:3 name:"Gee-Joon-3"]];
	[tilesDrawn addObject:(Domino *)[[Domino alloc] initWithPosition:1 numberDots:3 name:"Gee-Joon-3"]];
	drawnTiles = tilesDrawn;
	[self showDealOrig];
	
	commitButton.hidden = true;
	drawTiles.hidden = true;
	
	Domino* firstTile = (Domino *) [drawnTiles objectAtIndex:0];
	Domino* secondTile = (Domino *) [drawnTiles objectAtIndex:1];
	Domino* thirdTile = (Domino *) [drawnTiles objectAtIndex:2];
	Domino* fourthTile = (Domino *) [drawnTiles objectAtIndex:3];
	// progressing considered as 1 through 6
	AB =[[Hand alloc] initWithTileOne:firstTile tileTwo:secondTile]; // hand 1
	AC =[[Hand alloc] initWithTileOne:firstTile tileTwo:thirdTile];
	AD =[[Hand alloc] initWithTileOne:firstTile tileTwo:fourthTile];
	BC =[[Hand alloc] initWithTileOne:secondTile tileTwo:thirdTile];
	BD =[[Hand alloc] initWithTileOne:secondTile tileTwo:fourthTile];
	CD =[[Hand alloc] initWithTileOne:thirdTile tileTwo:fourthTile]; // hand 6
	// pairs 1,6 || 2,5 || 3,4
	
}

- (void) showDealOrig {
	yOrig = 275.0;
	xOrig0 = 44.0;
	xWidth = 62.0;
	
	Domino* drawnTile = (Domino *) [drawnTiles objectAtIndex:0];
	NSString *tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
	UIImage* image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.50f];
	UIImageView *tileImage = [[UIImageView alloc] initWithImage:image];
	CGRect frame = [tileImage frame];
	frame.origin.x = xOrig0;
	frame.origin.y = yOrig;
	[tileImage setFrame:frame];
	
	[self.view addSubview:tileImage];
	
	drawnTile = (Domino *) [drawnTiles objectAtIndex:1];
	tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
	image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.5f];
	tileImage = [[UIImageView alloc] initWithImage:image];
	frame = [tileImage frame];
	frame.origin.x = xOrig0 + xWidth;
	frame.origin.y = yOrig;
	[tileImage setFrame:frame];	
	[self.view addSubview:tileImage];
	
	drawnTile = (Domino *) [drawnTiles objectAtIndex:2];
	tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
	image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.5f];
	tileImage = [[UIImageView alloc] initWithImage:image];
	frame = [tileImage frame];
	frame.origin.x = xOrig0 + 2* xWidth;
	frame.origin.y = yOrig;
	[tileImage setFrame:frame];
	
	[self.view addSubview:tileImage];	
	
	drawnTile = (Domino *) [drawnTiles objectAtIndex:3];
	tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
	image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.50f];
	tileImage = [[UIImageView alloc] initWithImage:image];
	frame = [tileImage frame];
	frame.origin.x = xOrig0 + 3*xWidth;
	frame.origin.y = yOrig;
	[tileImage setFrame:frame];
	
	[self.view addSubview:tileImage];	
	
	upperHand = [[Hand alloc] init];
	lowerHand = [[Hand alloc] init];
	
	tileClicked[0] = tileClicked[1] = tileClicked[2] = tileClicked[3] = false;
	numClicked = 0;
	pairValues.text = @"";
	resetButton.hidden = true;

	topLeftPos = bottomLeftPos = topRightPos = bottomRightPos = -1;
	
	
	
}

-(IBAction) onReset {
	[self clearAllSubviews];
	
	[self showDealOrig];
	selectedPos = -1;
	topLeftPos = bottomLeftPos = topRightPos = bottomRightPos = -1;
	selectedImage = nil;
	numClicked = 0;
	tileClicked[0] = tileClicked[1] = tileClicked[2] = tileClicked[3] = false;
	commitButton.hidden = true;
	resetButton.hidden = true;
	dudHouseWayButton.hidden = true;
}


// Quick non proportional scale
-(UIImage*) getScaledImage:(UIImage *) sourceImage scaleBy:(float) fraction {
	
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	
	CGRect thumbnailRect = CGRectZero;
	
	thumbnailRect.size.width  = imageSize.width * 0.30f;
	thumbnailRect.size.height = imageSize.height * 0.30f;
	UIGraphicsBeginImageContext(CGSizeMake(thumbnailRect.size.width, thumbnailRect.size.height));
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	if(newImage == nil)
		newImage = sourceImage;
	
	return newImage;
	
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"-- I AM TOUCHED Start --");
	// get touch event
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchLocation = [touch locationInView:self.view];		
	
	for (UIView* aSubview in self.view.subviews) {
		if(![aSubview isKindOfClass:[UIImageView class]] || numClicked == 5) continue;
		
		if([aSubview pointInside: [self.view convertPoint:touchLocation toView:aSubview] withEvent:event]) {
			if(aSubview.frame.origin.y >= (yOrig - 50 )) {
				selectedPos = (int)(aSubview.frame.origin.x / xWidth);
				selectedImage = aSubview;	
			}
			break;
			
		}
	}
}

-(IBAction) onPractice {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
	if(appDelegate.tpViewController == nil) {
		appDelegate.tpViewController = [[TilePracticeViewController alloc] initWithNibName:@"TilePracticeViewController" bundle:[NSBundle mainBundle]];
		
	} 
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.2];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:appDelegate.window cache:YES];
	[appDelegate.viewController.view removeFromSuperview];
	appDelegate.viewController = appDelegate.tpViewController;
	[appDelegate.window addSubview:[appDelegate.tpViewController view]];
	[UIView commitAnimations];
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

/*Main logic that calculated hands when you tap tiles*/
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"-- I AM TOUCHED End --");
	
	// get touch event
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchLocation = [touch locationInView:self.view];
	if(selectedImage != nil) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:selectedImage cache:YES];
		[UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:pairValues cache:YES];
		
		// push down if already up
		
		if(tileClicked[selectedPos]) {
			numClicked --;
			CGRect frame = [selectedImage frame];
			frame.origin.y += 20;
			[selectedImage setFrame:frame];
			tileClicked[selectedPos] = false;
			
		} else {
			if(numClicked < 2) {
				numClicked++;
				CGRect frame = [selectedImage frame];
				frame.origin.y -= 20;
				[selectedImage setFrame:frame];
				tileClicked[selectedPos] = true;
			} 
			
		}
		
		
		selectedImage = nil;
		selectedPos = NOTPAIR;
		if(numClicked == 2) {
			// span through
			if(tileClicked[0] & tileClicked[1]) {
				topLeftPos = 0; topRightPos = 1;
				bottomLeftPos = 2; bottomRightPos = 3;
			} 
			
			if(tileClicked[0] & tileClicked[2]) {
				topLeftPos = 0; topRightPos = 2;
				bottomLeftPos = 1; bottomRightPos = 3;
			} 
			
			if(tileClicked[0] & tileClicked [3]) {
				topLeftPos = 0; topRightPos = 3;
				bottomLeftPos = 1; bottomRightPos = 2;
			} 
			
			if(tileClicked[1] & tileClicked [2]) {
				topLeftPos = 1; topRightPos = 2;
				bottomLeftPos = 0; bottomRightPos = 3;
			} 
			
			if(tileClicked[1] & tileClicked [3]) {
				topLeftPos = 1; topRightPos = 3;
				bottomLeftPos = 0; bottomRightPos = 2;
			} 
			
			if(tileClicked[2] & tileClicked [3]) {
				topLeftPos = 2; topRightPos = 3;
				bottomLeftPos = 0; bottomRightPos = 1;
			} 
			
			// show hand name tiles
			upperHand = [[Hand alloc] initWithTileOne:[drawnTiles objectAtIndex:topLeftPos] tileTwo:[drawnTiles objectAtIndex:topRightPos]];
			lowerHand = [[Hand alloc] initWithTileOne:[drawnTiles objectAtIndex:bottomLeftPos] tileTwo:[drawnTiles objectAtIndex:bottomRightPos]];
			//NSLog([NSString stringWithFormat:@"pair1=%@ of %d,%d", [upperHand getHandDisplay], topLeftPos, topRightPos]);
			//NSLog([NSString stringWithFormat:@"pair1=%@ of %d,%d", [lowerHand getHandDisplay], bottomLeftPos, bottomRightPos]);
			NSLog([lowerHand getHandDisplay]);
			pairValues.text = [self getHandsDisplayFor:upperHand And:lowerHand];
			commitButton.hidden = false;
		} else {
			upperHand = nil;
			lowerHand = nil;
			if(numClicked == 1) {
				pairValues.text = @"Now select second tile";
			} else {
				pairValues.text = @"Select first tile (just tap)";
			}
			commitButton.hidden = true;
		}
		
		[UIView commitAnimations];
		
	}
}

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration 
			  curve:(int)curve degrees:(CGFloat)degrees
{
	// Setup the animation
	[UIView beginAnimations:nil context:NULL];
	
	[UIView setAnimationDuration:duration];
	[UIView setAnimationTransition:curve forView: image cache:YES];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	// The transform matrix
	CGAffineTransform transform = image.transform;
	
	// Rotate the view 90 degrees around its new center point.
	transform = CGAffineTransformRotate(transform, DEGREES_TO_RADIANS(90));
	image.transform = transform;
	[UIView commitAnimations];
	
	// Commit the changes
}

- (void)moveImage:(UIImageView *)image duration:(NSTimeInterval)duration
			curve:(int)curve x:(CGFloat)x y:(CGFloat)y
{
	// Setup the animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:image cache:YES];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	// The transform matrix
	CGRect frame = [selectedImage frame];
	frame.origin.x = x;
	frame.origin.y = y;
	[image setFrame:frame];
	
	// Commit the changes
	[UIView commitAnimations];	
}

-(void)dealloc {
	[super dealloc];
}


-(IBAction) onCommit {
	if((topLeftPos + topRightPos + bottomLeftPos + bottomRightPos) < -1 || numClicked > 2) return;
	for (UIView* aSubview in self.view.subviews) {
		if(![aSubview isKindOfClass:[UIImageView class]] || aSubview.frame.size.width > 150) continue;
		
		selectedPos = (int)(aSubview.frame.origin.x / 60.0);
		selectedImage = aSubview;	
		float x,y;
		bool rotatable = false;
		
		if(selectedPos == bottomLeftPos) {
			x=40; y=46;
		}
		
		if(selectedPos == bottomRightPos) {
			y=46;
			x=102;
		}
		if(selectedPos == topLeftPos) {
			y=16;
			x=204;
			rotatable = true;
		}
		if(selectedPos == topRightPos) {
			y=79;
			x=204;
			rotatable = true;
		}
		
		[self moveImage:selectedImage duration:0.6 
				  curve:UIViewAnimationCurveLinear x:x y:y];
		
		if(rotatable) {
			
			[self rotateImage:selectedImage duration:0.6 
						curve:UIViewAnimationCurveEaseIn degrees:270];
		}
	}
	tileClicked[0] = tileClicked[1] = tileClicked[2] = tileClicked[3] = false;
	selectedPos  = -1;
	selectedImage = nil;
	numClicked = 5;
	resetButton.hidden = false;
	drawTiles.hidden = false;
	commitButton.hidden = true;
	[self setHouseFoxwoodsWay];
	NSLog([NSString stringWithFormat:@"House hands %@/%@", [highHouseHand getHandDisplay],[lowHouseHand getHandDisplay]]);
	[self show3Hands];
	// logic to mention the matching of hands to house hand ()
	/*
	if([upperHand compareHand:highHouseHand] == NSOrderedSame && [lowerHand compareHand:lowHouseHand] == NSOrderedSame ) {
		pairValues.text = [NSString stringWithFormat: @"%@ = Houseway",[self getHandsDisplayFor:upperHand And:lowerHand]];
	} else if([lowerHand compareHand:highHouseHand] == NSOrderedSame && [upperHand compareHand:lowHouseHand] == NSOrderedSame ) {
		pairValues.text = [NSString stringWithFormat: @"%@ = Houseway (swapped)",[self getHandsDisplayFor:upperHand And:lowerHand]];
	}*/
	 if([upperHand compareSameIf:highHouseHand]  && [lowerHand compareSameIf:lowHouseHand]) {
	 pairValues.text = [NSString stringWithFormat: @"%@ = Houseway",[self getHandsDisplayFor:upperHand And:lowerHand]];
	 } else if([lowerHand compareSameIf:highHouseHand] && [upperHand compareSameIf:lowHouseHand]) {
	 pairValues.text = [NSString stringWithFormat: @"%@ = Houseway (swapped)",[self getHandsDisplayFor:upperHand And:lowerHand]];
	 }
}

-(void) show3Hands {
	
	// Setup the animation
	
	Hand *lower;
	Hand *upper;
	Hand *lower1;
	Hand *upper1;
	Hand *lower2;
	Hand *upper2;
	UIImageView* housewayGuide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideline3.png"]];
	
	if([AB compareHand:CD] == NSOrderedDescending){
		upper = CD;
		lower = AB;
	} else {
		upper = AB;
		lower = CD;
	}
	UIMovableImageTile* firstWay = [[UIMovableImageTile alloc] initWithHands:upper lowerHand:lower];
	CGRect frame = [firstWay frame];
	frame.origin.x = 15;
	frame.origin.y = yOrig -50;
	[firstWay setFrame:frame];
	firstWay.alpha = 0.0;
	
	if([AC compareHand:BD] == NSOrderedDescending) {
		upper1 = BD;
		lower1 = AC;
	} else {
		upper1 = AC;
		lower1 = BD;
	}

	UIMovableImageTile* secondWay = [[UIMovableImageTile alloc] initWithHands:upper1 lowerHand:lower1];
	
	frame.origin.x = 180;
	frame.origin.y = yOrig - 50;
	[secondWay setFrame:frame];
	secondWay.alpha = 0.0;
	
	if([AD compareHand:BC] == NSOrderedDescending) {
		upper2 = BC; 
		lower2 = AD;
	} else {
		
		upper2 = AD; 
		lower2 = BC;
	}
	UIMovableImageTile* thirdWay = [[UIMovableImageTile alloc] initWithHands:upper2 lowerHand:lower2];

	// set the pointer that says house way
	frame.origin.x = 100;
	frame.origin.y = yOrig + 35;
	[thirdWay setFrame:frame];
	
	if(highHouseHand != nil && lowHouseHand != nil) {
		// check only one as the other is its complement
		if(highHouseHand == AB || highHouseHand ==CD) {
			frame.origin.x = 13;
			frame.origin.y = yOrig - 38;
		} else if(highHouseHand == AC || highHouseHand == BD) {
			frame.origin.x = 178;
			frame.origin.y = yOrig - 38 ;
		} else if(highHouseHand == AD || highHouseHand == BC) {
			frame.origin.x = 98;
			frame.origin.y = yOrig + 48;
		}
	}
	
	housewayGuide.alpha = 0.5;
	
	
	frame.size.height -= 10;
	[housewayGuide setFrame:frame];
	thirdWay.alpha = 0.0;
	
	CGRect frame2 = [dudHouseWayButton frame];
	frame2.origin.x = (frame.origin.x + housewayGuide.frame.size.width/2 - 12);
	frame2.origin.y = (frame.origin.y + housewayGuide.frame.size.height - 4);
	[dudHouseWayButton setFrame:frame2];
	
	[self.view addSubview:housewayGuide];
	[self.view addSubview:firstWay];
	[self.view addSubview:secondWay];
	[self.view addSubview:thirdWay];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.8f];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:firstWay];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:thirdWay];	
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:secondWay];
	firstWay.alpha = 1.0;
	secondWay.alpha = 1.0;
	thirdWay.alpha = 1.0;
	
	[UIView commitAnimations];
	
}

-(void) setHouseFoxwoodsWay {
	//bool specialWay1 = [self getIfFoxwoodsWayWith:AB lower:CD];	
	Hand* upper = nil, *lower = nil;
	bool isHouseWay = false;
	int pairCheck = [self isPairInHands];
	if(pairCheck > NOTPAIR) {
		Hand* pair = [self givePairOf:pairCheck];
		Hand* other = [self giveComplementPairOf:pairCheck];
		
		// A  Never split 4 5 6 10 or 11
		if (pair.tileOne.numberDots == 4 || pair.tileOne.numberDots == 5 
			|| pair.tileOne.numberDots == 6 || pair.tileOne.numberDots == 10 
			|| pair.tileOne.numberDots == 11) {
			
			isHouseWay = true;
		}
		
		// split 1/GeeJoon only with 6-6, 6-4 , 6-5
		if([pair getPairPosition] == GEEJOON) {
			if ([other containsNumDots:6] 
				&& ([other containsNumDots:6] || [other containsNumDots:5] || [other containsNumDots:4])) {
				isHouseWay = false;
			} else {
				isHouseWay = true; // ok GeeJoon
			}
		}
		// split 2 or 12 only to make 6/8 or better OR with 9, 11
		if(pair.tileOne.numberDots == 2 || pair.tileOne.numberDots == 12) {
			// check by splitting to see if you make 6/8 or better
			Hand* splitOne = [[Hand alloc] initWithTileOne:pair.tileOne tileTwo:other.tileOne];
			Hand* splitTwo = [[Hand alloc] initWithTileOne:pair.tileTwo tileTwo:other.tileTwo];
			if(([splitOne  getValue] > 6 && [splitTwo getValue] > 8)
			   || ([splitTwo  getValue] > 6 && [splitOne getValue] > 8)) {
				isHouseWay = false;
			} else if([other containsNumDots:9] && [other containsNumDots:11]) {
				isHouseWay = false; 
			} else {
				isHouseWay = true; // ok to pair 2 and 12
			}
		}
		
		// split 9 only with combination of 2 12 10
		if(pair.tileOne.numberDots == 9) {
			if(([other containsNumDots:2] && [other containsNumDots:12]) ||
			   ([other containsNumDots:10] && [other containsNumDots:12]) ||
			   ([other containsNumDots:2] && [other containsNumDots:10])) {
				isHouseWay = false;
			} else {
				isHouseWay = true;
			}
		}
		// split 8 only with combination of 2 12 10 11 also with 9 and 11
		if(pair.tileOne.numberDots == 8) {
			if(([other containsNumDots:2] && [other containsNumDots:12]) ||
			   ([other containsNumDots:2] && [other containsNumDots:11]) ||
			   ([other containsNumDots:2] && [other containsNumDots:10]) ||
			   ([other containsNumDots:10] && [other containsNumDots:12]) ||
			   ([other containsNumDots:10] && [other containsNumDots:11]) ||
			   ([other containsNumDots:11] && [other containsNumDots:12])) {
				isHouseWay = false;
			} else if([other containsNumDots:9] && [other containsNumDots:11]) {
				isHouseWay = false; 
			} else {
				isHouseWay = true;
			}
		}
		// split 7 only with combination of 2 12 10 11 
		if(pair.tileOne.numberDots == 7) {
			if(([other containsNumDots:2] && [other containsNumDots:12]) ||
			   ([other containsNumDots:2] && [other containsNumDots:11]) ||
			   ([other containsNumDots:2] && [other containsNumDots:10]) ||
			   ([other containsNumDots:10] && [other containsNumDots:12]) ||
			   ([other containsNumDots:10] && [other containsNumDots:11]) ||
			   ([other containsNumDots:11] && [other containsNumDots:12])) {
				isHouseWay = false;
			} else {
				isHouseWay = true;
			}
		}	
		if(isHouseWay) {
			highHouseHand = pair;
			lowHouseHand = other;
		} else {
			// this means the split tile is best TODO check
			highHouseHand = [[Hand alloc] initWithTileOne:other.tileOne tileTwo:pair.tileOne];
			lowHouseHand = [[Hand alloc] initWithTileOne:other.tileTwo tileTwo:pair.tileTwo];
		}
		return;
	} else if(pairCheck < NOTPAIR) { // should not come here
		// double pair - false only when GeeJoon and 6-6 present
		upper = [self givePairOf:pairCheck];
		lower = [self giveComplementPairOf:pairCheck];
		//if(!((([upper getPairPosition] == 1) && ([lower containsNumDots:6])) || (([upper containsNumDots:6]) && ([lower getPairPosition] == 1))))
		return;
	}
	
	// TODO add exceptions and rare case of double gond and wong
	int wongcheck = [self isWongOrGongOrHigh9InHands];
	if(wongcheck > NOTPAIR) {
		upper = [ self givePairOf:wongcheck];
		lower = [ self giveComplementPairOf:wongcheck];
		// prefer 9 over WONG OR GONG - this happens when a 7 exists in the other tiles
		if([lower containsNumDots:7]) {
			Domino *teenDay = [upper.tileOne isTeenOrDay]?upper.tileOne:upper.tileTwo;
			Domino *sevenTile = (lower.tileOne.numberDots == 7) ? lower.tileOne:lower.tileTwo;
			highHouseHand = [[Hand alloc] initWithTileOne:teenDay tileTwo:sevenTile];
			lowHouseHand = [[Hand alloc] initWithTileOne:[upper.tileOne isTeenOrDay]?upper.tileTwo:upper.tileOne 
												 tileTwo:(lower.tileOne.numberDots == 7)?lower.tileTwo:lower.tileOne ];
			return;
		}
		
		// 
		Hand *wong = nil, *gong = nil, *other = nil;
		if([upper getWongOrGong] == WONG) {
			wong = upper;
			other = lower;
		} else if ([upper getWongOrGong] == GONG) {
			gong = upper; 
			other = lower;			
		}
		
				
		// play gong over wong
		if(wong != nil && [other containsNumDots:8]) {
			Domino *teenDay = [upper.tileOne isTeenOrDay]?upper.tileOne:upper.tileTwo;
			Domino *eightTile = (lower.tileOne.numberDots == 8) ? lower.tileOne:lower.tileTwo;
			highHouseHand = [[Hand alloc] initWithTileOne:teenDay tileTwo:eightTile];
			lowHouseHand = [[Hand alloc] initWithTileOne:[upper.tileOne isTeenOrDay]?upper.tileTwo:upper.tileOne 
												 tileTwo:(lower.tileOne.numberDots == 8)?lower.tileTwo:lower.tileOne ];
			
			return;
		}
		
		if(gong != nil && [other containsNumDots:9]) {
			highHouseHand = upper;
			lowHouseHand = lower;
			return;
		}
		
		// when given a choice of 2 and 12 play 12 in high hand
		if(wong != nil && [wong containsNumDots:2] && [other containsNumDots:12]) {
			Domino *twoTile = (upper.tileOne.numberDots == 2)?upper.tileOne:upper.tileTwo;
			Domino *twelveTile = (lower.tileOne.numberDots == 12) ? lower.tileOne:lower.tileTwo;
			highHouseHand = [[Hand alloc] initWithTileOne:twelveTile tileTwo:(upper.tileOne.numberDots ==2)?upper.tileTwo:upper.tileOne];
			lowHouseHand = [[Hand alloc] initWithTileOne:twoTile tileTwo:(lower.tileOne.numberDots == 12)?lower.tileTwo:lower.tileOne];
			return;
		}
		
		if(gong != nil && [gong containsNumDots:2] && [other containsNumDots:12]) {
			Domino *twoTile = (upper.tileOne.numberDots == 2)?upper.tileOne:upper.tileTwo;
			Domino *twelveTile = (lower.tileOne.numberDots == 12) ? lower.tileOne:lower.tileTwo;
			highHouseHand = [[Hand alloc] initWithTileOne:twelveTile tileTwo:(upper.tileOne.numberDots ==2)?upper.tileTwo:upper.tileOne];
			lowHouseHand = [[Hand alloc] initWithTileOne:twoTile tileTwo:(lower.tileOne.numberDots == 12)?lower.tileTwo:lower.tileOne];
			return;
		}
		
		highHouseHand = upper;
		lowHouseHand = lower;
		return;
		
		
	} else if(wongcheck < NOTPAIR) {
		// double wong&gong - not sure
		highHouseHand = [self givePairOf:wongcheck];
		lowHouseHand = [self giveComplementPairOf:wongcheck];
		return true;
	}
	
	// Finally play Rule 3
	[self findHighLowHands];
	if([highestLowHand getValue] < 3 && [highestHighHand getValue] >= 7) {
		highHouseHand =  highestHighHand;
		lowHouseHand = [self giveComplementPairOf:highestHigh];
	} else {
		lowHouseHand =  highestLowHand;
		highHouseHand = [self giveComplementPairOf:highestLow];
	}
}

-(int) isPairInHands {
	/*
	//rare double pair
	if([AB getPairPosition] > NOTPAIR && [CD getPairPosition] > NOTPAIR) {
		highHouseHand = AB;
		lowHouseHand = CD;
		return -2;
	}
	if([BC getPairPosition] > NOTPAIR && [AD getPairPosition] > NOTPAIR) {
		highHouseHand = BC;
		lowHouseHand = AD;
		return -3;
	}
	if([AC getPairPosition] > NOTPAIR && [BD getPairPosition] > NOTPAIR) {
		highHouseHand = AC;
		lowHouseHand = BD;
		return -4;
	}
	 */
	
	if([AB getPairPosition] > NOTPAIR)
		return 1;
	
	if([AC getPairPosition] > NOTPAIR)
		return 2;
	
	if([AD getPairPosition] > NOTPAIR)
		return 3;
	
	if([BC getPairPosition] > NOTPAIR)
		return 4;
	
	if([BD getPairPosition] > NOTPAIR)
		return 5;
	
	if([CD getPairPosition] > NOTPAIR)
		return 6;
	
	return NOTPAIR;
	
}

-(int) isWongOrGongOrHigh9InHands {
	
	//rare double wong/gong?
	if([AB getWongOrGong] > NOTPAIR && [CD getWongOrGong] > NOTPAIR)
		return -2;
	if([BC getWongOrGong] > NOTPAIR && [AD getWongOrGong] > NOTPAIR)
		return -3;
	if([AD getWongOrGong] > NOTPAIR && [BC getWongOrGong] > NOTPAIR)
		return -4;
	
	// once checked for double check for gong/wong/high9
	if([AB getWongOrGongOrHighNine] > NOTPAIR)
		return 1;
	
	if([AC getWongOrGongOrHighNine] > NOTPAIR)
		return 2;
	
	if([AD getWongOrGongOrHighNine] > NOTPAIR)
		return 3;
	
	if([BC getWongOrGongOrHighNine] > NOTPAIR)
		return 4;
	
	if([BD getWongOrGongOrHighNine] > NOTPAIR)
		return 5;
	
	if([CD getWongOrGongOrHighNine] > NOTPAIR)
		return 6;
	
	return NOTPAIR;
	
}

-(void) findHighLowHands {
	highestLow = 0; highestHigh = 0;
	if([AB getValue] > [CD getValue]) {
		highestLow = CD_PAIR; highestLowHand = CD;
		highestHigh = AB_PAIR; highestHighHand = AB;
	} else {
		highestLow = AB_PAIR; highestLowHand = AB;
		highestHigh = CD_PAIR; highestHighHand = CD;
	}
	if([AC getValue] > [BD getValue]) {
		if([BD getValue] > [highestLowHand getValue]) {
			highestLow = BD_PAIR; highestLowHand = BD;
		}
		if([AC getValue] > [highestHighHand getValue]) {
			highestHigh = AC_PAIR; highestHighHand = AC;
		}
	} else {
		if([AC getValue] > [highestLowHand getValue]) {
			highestLow = AC_PAIR; highestLowHand = AC;
		}
		if([BD getValue] > [highestHighHand getValue]) {
			highestHigh = BD_PAIR; highestHighHand = BD;
		}
	}
	
	if([AD getValue] > [BC getValue]) {
		if([BC getValue] > [highestLowHand getValue]) {
			highestLow = BC_PAIR; highestLowHand = BC;
		}
		if([AD getValue] > [highestHighHand getValue]) {
			highestHigh = AD_PAIR; highestHighHand = AD;
		}
	} else {
		if([AD getValue] > [highestLowHand getValue]) {
			highestLow = AD_PAIR; highestLowHand = AD;
		}
		if([BC getValue] > [highestHighHand getValue]) {
			highestHigh = BC_PAIR; highestHighHand = BC;
		}
	}
	
	NSLog([NSString stringWithFormat:@"HIGHEST low hand - %d=%d", highestLow, [highestLowHand getValue]]);
	NSLog([NSString stringWithFormat:@"HIGHEST high hand - %d=%d", highestHigh, [highestHighHand getValue]]);
	
}

- (Hand*) giveComplementPairOf:(int) handNum {
	switch (handNum) {
		case AB_PAIR:
			return CD;
		case CD_PAIR:
			return AB;
		case AC_PAIR:
			return BD;
		case BD_PAIR:
			return AC;
		case AD_PAIR:
			return BC;
		case BC_PAIR:
			return AD;
		default:
			break;
	}
		return nil;
}

- (Hand*) givePairOf:(int) handNum {
	switch (handNum) {
		case AB_PAIR:
			return AB;
		case CD_PAIR:
			return CD;
		case AC_PAIR:
			return AC;
		case BD_PAIR:
			return BD;
		case AD_PAIR:
			return AD;
		case BC_PAIR:
			return BC;
		default:
			break;
	}
	return nil;
	
}

-(NSString*) getHandsDisplayFor:(Hand*) first And: (Hand*) second {
	NSString* displayString = [NSString stringWithFormat:@"%@ / %@", [first getHandDisplay],[second getHandDisplay]];
	if([first compareHand:second] == NSOrderedDescending) {
		displayString = [NSString stringWithFormat:@"%@ / %@", [second getHandDisplay],[first getHandDisplay]];
	}
	return displayString;
}

-(IBAction) onHelpInfo {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"How to Play" 
													message:@"Tap a tile to select it. Tap it again to un-select it. When you tap 2 tiles, you can split them into 2 Paigow hands!"
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
}


@end
