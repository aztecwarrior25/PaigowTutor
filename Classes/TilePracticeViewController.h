//
//  TilePracticeViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/17/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Domino.h"

@interface TilePracticeViewController : UIViewController {
	IBOutlet UILabel* questionTile;
	IBOutlet UILabel* answerStatus;
	IBOutlet UILabel* answerExplain;
	IBOutlet UIButton* nextQuestion;
	UIImageView* correct;
	NSMutableArray *drawnTiles;
	int questionAnswerPos, numOptions;
	Domino *questionDomino;
	float xOrig0, xWidth, yOrig;
	bool isPositionMode;
	int numAttempts;
	
}

@property(nonatomic, retain) NSMutableArray* drawnTiles;

@property (nonatomic, retain) UILabel *questionTile;
@property (nonatomic, retain) UILabel *answerStatus;
@property (nonatomic, retain) UILabel *answerExplain;
@property (nonatomic, retain) UIImageView *correct;
@property (nonatomic, assign) bool isPositionMode;
-(IBAction) onNewQuestionClick;
-(IBAction) onBack;
-(void) setIsPositionMode: (bool) setPos;
- (void) clearAllSubviews;
-(void) showDealOrig;
@end
