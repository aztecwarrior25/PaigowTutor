//
//  Hand.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Domino.h"

extern int const WONG;
extern int const GONG;
extern int const NOTPAIR;


@interface Hand : NSObject {
	Domino *tileOne; 
	Domino *tileTwo;
}
@property(nonatomic, retain) Domino* tileOne;
@property(nonatomic, retain) Domino* tileTwo;
-(int) getValue;
-(int) getPairPosition; // returns -1 if not a pair, else pair position
-(int) getWongOrGong;	// returns -1 if not a Wong or Gong else returns 1 wong 2 gong
-(int) getWongOrGongOrHighNine;	// returns -1 if not a Wong or Gong else returns 1 wong 2 gong
-(Domino*) getHighTile; // returns null if expression evaluates to 0, else
-(Domino*) getLowTile;  // returns null if expression evaluates to 0, else
-(id) initWithTileOne: (Domino*) dom1 tileTwo:(Domino*) dom2;

- (NSString *) getHandDisplay;
- (NSComparisonResult)compareHand:(Hand*) otherObject;
- (bool) containsNumDots:(int) numDots;
- (bool) compareSameIf:(Hand*) other;
@end
