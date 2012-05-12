//
//  UIMovableImageTile.h
//  TilePoet
//
//  Created by Shriniwas Kulkarni on 9/19/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Domino.h"
#import "Hand.h"

@interface UIMovableImageTile : UIImageView {
	CGPoint startPoint;
	NSString *tileText;
	int tileHeight;
	int alphabetWidth;
	int tileTextFontSize;
	Domino* domino;
}

@property (nonatomic, retain) NSString *tileText;
- (id)initWithImg:(UIImage *)tileImage txt:(NSString *)tileText origin:(CGPoint) tileCenter ;
- (id)initWithHands:(Hand*) upper lowerHand:(Hand*) lower;

-(void) printText;
//-(NSComparisonResult) compareX;
//-(NSComparisonResult) compareY;

@end
