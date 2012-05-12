//
//  TilePracticeViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/17/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "TilePracticeViewController.h"
#import "Deck.h"
#import "PaiGowAppDelegate.h"
#import <QuartzCore/CALayer.h>
#import <QuartzCore/CAGradientLayer.h>

#define SHADOW_HEIGHT 20.0
#define SHADOW_INVERSE_HEIGHT 10.0
#define SHADOW_RATIO (SHADOW_INVERSE_HEIGHT / SHADOW_HEIGHT)

@implementation TilePracticeViewController

@synthesize questionTile, drawnTiles, answerStatus, isPositionMode, correct, answerExplain;
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
	numOptions = 5;
	questionTile.text = @"Tap Show New to start training!";
	//[self onNewQuestionClick ];
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
		if([view isKindOfClass: [UILabel class]] && view.frame.origin.y > 300) {
			[view removeFromSuperview];
		}

		if([view isKindOfClass: [UIImageView class]] && view.frame.size.height > 55) {
			UIImageView *img = (UIImageView*) view;
			//NSLog([NSString stringWithFormat:@"removing image height %d" ,view.frame.size.height]); 
			if(img.frame.size.height > 80.00)
				[view removeFromSuperview];
		}
	}
	nextQuestion.hidden = false;
	questionTile.text = @"Press Show New to start training";
	if(correct != nil)
		correct.hidden = true;
	
	answerExplain.text = @"";
}

-(IBAction) onNewQuestionClick {
	[self clearAllSubviews];
	//NSLog([NSString stringWithFormat:@"ispos %d ", isPositionMode]);
	
	Deck * d = [[Deck alloc] init];
	//[d printDeck];
	[d shuffle];
	if([self isPositionMode]) {
		
		drawnTiles = (NSMutableArray *)[d dealUniqueValueWith:numOptions];;
		[self showDealOrig];
		[d release];
		/* old logic for highest lowest
		int highestPos = 99;
		for (int i = 0; i < numOptions; i++) {
			
			Domino *current = (Domino *) [drawnTiles objectAtIndex:i];
			if(current.position < highestPos) {
				highestPos = current.position;
				questionDomino = current;
				questionAnswerPos = i;
			}
		}
		 */
		int index = arc4random() % numOptions;
		questionDomino = [drawnTiles objectAtIndex:index];
		questionAnswerPos = index;
		questionTile.text = [NSString stringWithFormat:@"Which of these has the Rank %d?", questionDomino.position] ;


	} else {
		
		drawnTiles = (NSMutableArray *) [d dealUniqueWith:numOptions];
		[self showDealOrig];
		[d release];
		
		int index = arc4random() % numOptions;
		
		Domino *question = [drawnTiles objectAtIndex:index];
		// hokie pokie for correct name
		questionDomino = question;
		questionTile.text = [NSString stringWithFormat:@"Which of these tiles is a %@?", question.shortName];
		questionAnswerPos = index;
	}
	
	answerStatus.text = @"(Pick one)";
	numAttempts = 0;
	nextQuestion.hidden = true;
}

// Quick non proportional scale
-(UIImage*) getScaledImage:(UIImage *) sourceImage scaleBy:(float) fraction {
	
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	
	CGRect thumbnailRect = CGRectZero;
	
	thumbnailRect.size.width  = imageSize.width * (float) fraction;
	thumbnailRect.size.height = imageSize.height * (float) fraction;
	UIGraphicsBeginImageContext(CGSizeMake(thumbnailRect.size.width, thumbnailRect.size.height));
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
	
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"-- I AM TOUCHED End --");
	// get touch event
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchLocation = [touch locationInView:self.view];		
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.6];
	
	for (UIView* aSubview in self.view.subviews) {
		if(![aSubview isKindOfClass:[UIImageView class]] || touchLocation.y <= yOrig) continue;
		
		if([aSubview pointInside: [self.view convertPoint:touchLocation toView:aSubview] withEvent:event]) {
			
			if(numAttempts < 3) {
				[UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:answerStatus cache:YES];
				
				int answer = (int) (aSubview.frame.origin.x / xWidth);
				Domino * selected = (Domino *) [drawnTiles objectAtIndex:answer];
				
				//NSLog([NSString stringWithFormat:@"Ans tapped = %d", answer]);
				if(answer == questionAnswerPos) {
					answerStatus.text = [NSString stringWithFormat:@"Correct! thats a %@, (Rank %d)", selected.shortName, selected.position];
					nextQuestion.hidden = false;
					numAttempts = 4;
					
				} else {
					aSubview.alpha = 0.5;
					answerStatus.text = [NSString stringWithFormat:@"Incorrect! thats a %@, (Rank %d)", selected.shortName, selected.position];
					numAttempts ++;
				}
				
				if(numAttempts > 2) {
					nextQuestion.hidden = false;
					for (UIView* aSubview2 in self.view.subviews) {
						if(![aSubview2 isKindOfClass:[UIImageView class]] || aSubview2.frame.origin.y < yOrig) continue;
						int answer2 = (int) (aSubview2.frame.origin.x / xWidth);
						CGRect frame = [aSubview2 frame];
						if(answer2 != questionAnswerPos) {
							aSubview2.alpha = 0.4;
						} else {
							frame.origin.y -= 20;
							[aSubview2 setFrame:frame];
						}
						Domino* drawn = [drawnTiles objectAtIndex:answer2];
						// draw the labels to tell what were the tiles
						CGRect labelFrame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height + 10, 55, 30);
						UILabel* nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
						nameLabel.text =[NSString stringWithFormat:@"%@\n%d", drawn.shortName, drawn.position];
						nameLabel.textAlignment = UITextAlignmentCenter;
						nameLabel.numberOfLines = 2;						
						nameLabel.font = [UIFont fontWithName:@"Arial" size: 9.0];
						nameLabel.lineBreakMode = UILineBreakModeWordWrap;						
						nameLabel.backgroundColor = [UIColor clearColor]; // [UIColor brownColor];
						
						[self.view addSubview:nameLabel];
						if(questionDomino.position == 1) {
							answerExplain.text = @"GeeJoon Tile is actually lowest ranked as single tile, but highest ranked when in a pair";
						}
						[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:aSubview2 cache:YES];
						if(numAttempts != 4) {
							answerStatus.text = @"Sorry (Correct tile is highlighted)";
						}
						
					}
					
				}
			}
			
			break;
			
		}
	}
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

-(void) showDealOrig {
	yOrig = 275.0;
	xOrig0 = 10.0;
	xWidth = 60.0;
	
	for (int i = 0; i < numOptions; i++) {
		
		Domino* drawnTile = (Domino *) [drawnTiles objectAtIndex:i];
		NSString *tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
		UIImage* image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.32f ];
		UIImageView *tileImage = [[UIImageView alloc] init];
		
		CGRect frame = [tileImage frame];
		frame.origin.x = xOrig0 + i*xWidth + 2;
		frame.origin.y = -100;
		frame.size.height = image.size.height + 3;
		frame.size.width = image.size.width + 3;
		[tileImage setFrame:frame];
		
		CALayer  *layer = [CALayer layer];
		layer.bounds = frame;
		layer.position = CGPointMake(frame.size.width / 2 + 3, frame.size.height / 2 + 3);
		layer.backgroundColor = [UIColor colorWithWhite: 0.15 alpha: 0.85].CGColor;
		layer.zPosition = -1;
		layer.cornerRadius = 11.0;
		
		[tileImage.layer addSublayer: layer];
		
		layer = [CALayer layer];
		layer.bounds = frame;
		layer.position = CGPointMake(frame.size.width / 2 , frame.size.height / 2 );
		
		layer.zPosition = 1;
		layer.contents = (id)image.CGImage;
		[tileImage.layer addSublayer: layer];
		
		[self.view addSubview:tileImage];
		
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration: 1.4];
	for (NSObject *aSubview in self.view.subviews) {
		UIImageView* tileImage = (UIImageView*) aSubview;
		
		CGRect frame = [tileImage frame];
		if(frame.size.height > 80) {
			//frame.origin.x = xOrig0 + count*xWidth + 2;
			frame.origin.y = yOrig + 2;
			//count++;
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:tileImage cache:YES];
			[tileImage setFrame:frame];
		}
	}
	
	[UIView commitAnimations];	
}

-(void) setIsPositionMode: (bool) setPos {
	isPositionMode = setPos;
}

- (void)dealloc {
    [super dealloc];
}


@end
