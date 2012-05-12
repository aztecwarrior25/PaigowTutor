//
//  TilePickerViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Domino.h"
#import "Hand.h"

@interface TilePickerViewController : UIViewController {
	IBOutlet UILabel* questionTile;
	IBOutlet UILabel* answerStatus;
	IBOutlet UILabel* answerExplain;
	IBOutlet UIButton* nextQuestion;
	UIImageView* correct;
	NSMutableArray *drawnTiles;
	int questionAnswerPos, numOptions;
	Domino *questionDomino1;
	Domino *questionDomino2;
	Hand *questionHand1;
	Hand *questionHand2;

	float xOrig0, xWidth, yOrig;
	bool isPairMode;
	int numAttempts;
	
}

@property(nonatomic, retain) NSMutableArray* drawnTiles;

@property (nonatomic, retain) UILabel *questionTile;
@property (nonatomic, retain) UILabel *answerStatus;
@property (nonatomic, retain) UILabel *answerExplain;
@property (nonatomic, retain) UIImageView *correct;
@property (nonatomic, assign) bool isPairMode;

-(IBAction) onNewQuestionClick;
-(IBAction) onBack;
-(void) setIsPositionMode: (bool) setPos;
- (void) clearAllSubviews;
-(void) showDealOrig;

@end
