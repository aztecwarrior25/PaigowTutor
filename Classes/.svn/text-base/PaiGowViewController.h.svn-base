//
//  PaiGowViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hand.h"


@interface PaiGowViewController : UIViewController {
	IBOutlet UIView *pickerView;
	UIView *origView;
	IBOutlet UIButton* drawTiles;
	IBOutlet UIButton* checkHands;
	IBOutlet UIButton* checkHands2;
	IBOutlet UIButton* checkHands3;
	IBOutlet UILabel* pairValues;
	IBOutlet UIButton* commitButton;
	IBOutlet UIButton* resetButton;
	IBOutlet UIButton* dudHouseWayButton;
	
	IBOutlet UIView *mainView;
	IBOutlet UIView *flipView;
	
	Hand *upperHand;
	Hand *lowerHand;
	
	int numClicked;
	int topLeftPos, topRightPos, bottomLeftPos, bottomRightPos;


	NSMutableArray *drawnTiles;
	UIImageView *selectedImage;
	CGPoint startPoint;
	int selectedPos;
	float yOrig;
	float xOrig0;
	float xWidth;
	bool tileClicked[4];
	Hand *AB, *AC, *AD, *BC, *BD, *CD;
	int highestLow, highestHigh;
	Hand *highestLowHand, *highestHighHand;
	Hand *lowHouseHand, *highHouseHand;
	
}

@property(nonatomic, retain) UILabel* pairValues;
@property(nonatomic, retain) NSMutableArray* drawnTiles;

@property (nonatomic, retain) UIView *pickerView;
@property (nonatomic, retain) UIImageView *selectedImage;
@property (nonatomic, retain) Hand *upperHand;
@property (nonatomic, retain) Hand *lowerHand;
@property (nonatomic, retain) UIView *flipView;
@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIButton *commitButton;
@property (nonatomic, retain) UIButton *resetButton;
@property (nonatomic, retain) UIButton *dudHouseWayButton;
@property (nonatomic, retain) UIButton *drawTiles;
@property(nonatomic, assign) int selectedPos;


-(IBAction) onDrawTilesClick;
-(IBAction) onPractice;
-(IBAction) onHelpInfo;
-(IBAction) onBack;
//-(IBAction) onCheckHands;
-(IBAction) onCommit;
-(IBAction) onReset;
-(void) clearAllSubviews;
//- (bool) isTileImagePresentAt:(CGPoint) point;
-(void) showDealOrig;
-(NSString*) getHandsDisplayFor:(Hand*) first And: (Hand*) second;

@end

