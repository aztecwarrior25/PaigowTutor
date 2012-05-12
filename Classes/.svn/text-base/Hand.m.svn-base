//
//  Hand.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "Hand.h"
#import <math.h>

@implementation Hand


int const WONG = 1;
int const GONG = 2;
int const HIGHNINE = 3;

int const NOTPAIR = -1;

@synthesize tileOne,tileTwo;

-(int) getValue {
	int value = (tileOne.numberDots + tileTwo.numberDots) % 10;
	
	// Wild card check
	if(tileOne.position == GEEJOON) {
		value = MAX(((3 + tileTwo.numberDots)%10), ((6 + tileTwo.numberDots)%10));
	} else if(tileTwo.position == GEEJOON) {
		value = MAX(((3 + tileOne.numberDots)%10), ((6 + tileOne.numberDots)%10));
	}
	
	return value;
}

-(int) getPairPosition {
	if(tileOne.position == tileTwo.position) {
		return tileTwo.position;
	} 
	return NOTPAIR;
}

-(int) getWongOrGong {
	if([self getPairPosition] == NOTPAIR) {
		if(([tileOne isTeenOrDay] && tileTwo.numberDots == 9) ||
		   ([tileTwo isTeenOrDay] && tileOne.numberDots == 9)) {
			return WONG;
		}
		
		if(([tileOne isTeenOrDay] && tileTwo.numberDots == 8) ||
		   ([tileTwo isTeenOrDay] && tileOne.numberDots == 8)) {
			return GONG;
		}
	}
	return NOTPAIR;
}

-(int) getWongOrGongOrHighNine {
	if([self getPairPosition] == NOTPAIR) {
		if(([tileOne isTeenOrDay] && tileTwo.numberDots == 9) ||
		   ([tileTwo isTeenOrDay] && tileOne.numberDots == 9)) {
			return WONG;
		}
		
		if(([tileOne isTeenOrDay] && tileTwo.numberDots == 8) ||
		   ([tileTwo isTeenOrDay] && tileOne.numberDots == 8)) {
			return GONG;
		}
		
		if(([tileOne isTeenOrDay] && tileTwo.numberDots == 7) ||
		   ([tileTwo isTeenOrDay] && tileOne.numberDots == 7)) {
			return HIGHNINE;
		}
	}
	return NOTPAIR;
}

- (Domino*) getHighTile { // this is applicable for non pair and non zero
	if([self getPairPosition] == NOTPAIR || [self getValue] > 0) {
		// Gee Joon tiles are demoted in tie breakers
		if(tileTwo.position == GEEJOON) {
			return tileOne;
		} else if(tileOne.position == GEEJOON) {
			return tileTwo;
		}
		
		if([self getWongOrGong] > NOTPAIR) {
			// send the other tile for Wong/Gong ???
			if([tileTwo isTeenOrDay]) {
				return tileOne;
			} else if([tileOne isTeenOrDay]) {
				return tileTwo;
			}
		}
		
		
		// lower the position higher the rank except geejoon and wong/gong
		return (tileOne.position < tileTwo.position) ? tileOne : tileTwo;
	}
	
	return nil;
}

- (Domino*) getLowTile {
	if([self getPairPosition] == NOTPAIR || [self getWongOrGong] == NOTPAIR || [self getValue] > 0) {
		if(tileTwo.position == GEEJOON) {
			return tileTwo;
		}
		if(tileTwo.position == GEEJOON) {
			return tileOne;
		}
		
		return tileOne.position < tileTwo.position ? tileOne :tileTwo;
	}
	
	return NULL;
}

-(id) initWithTileOne: (Domino*) dom1 tileTwo:(Domino*) dom2 { 
	self.tileOne = dom1;
	self.tileTwo = dom2;
	
	return self;
}

-(NSString *) getHandDisplay {
	NSString *returnStr = nil;
	if([self getPairPosition] > 0) {
		returnStr = [NSString stringWithFormat:@"%@ (%d)", tileTwo.shortName, tileTwo.position];
	} else if([self getWongOrGong] > 0) {
		if([self getWongOrGong] == 1) {
			returnStr = [NSString stringWithFormat:@"WONG"];
		} else {
			returnStr = [NSString stringWithFormat:@"GONG"];
		}
	} else {
		returnStr = [NSString stringWithFormat:@"%d", [self getValue]];
	}
	
	return returnStr;
}

// compare 2 hands  return ASCENDING IF you are higher, DESCENDING IF OTHER IS HIGHER ELSE SAME
- (NSComparisonResult)compareHand:(Hand*) otherObject {
	int myPairPos = [self getPairPosition];	
	int otherPairPos = [otherObject getPairPosition];
	
	
	// if one of the hands is a pair, then check which, if both are pairs check higher ranked
	if(myPairPos != NOTPAIR || otherPairPos != NOTPAIR) {
		if(myPairPos == NOTPAIR) return NSOrderedDescending;
		if(otherPairPos == NOTPAIR) return NSOrderedAscending;
		return(myPairPos == otherPairPos)? NSOrderedSame : (myPairPos < otherPairPos) ? NSOrderedAscending : NSOrderedDescending;
	} 
	
	int myWongPos = [self getWongOrGong];
	int otherWongPos = [otherObject getWongOrGong];
	// if one of the pairs is a Wong or gong then check which, if both are same then break tie, else wong is higher than gong
	if(myWongPos != NOTPAIR || otherWongPos != NOTPAIR) {
		if(myWongPos == NOTPAIR) return NSOrderedDescending;
		if(otherWongPos == NOTPAIR) return NSOrderedAscending;
		// in case both are either a wong or gong
		if(myWongPos == otherWongPos) {
			return ([self getHighTile].position == [otherObject getHighTile].position)? NSOrderedSame :
		    ([self getHighTile].position < [otherObject getHighTile].position)? NSOrderedAscending : NSOrderedDescending;
			
		}
		
		
		// 
		return(myWongPos < otherWongPos) ? NSOrderedAscending : NSOrderedDescending;
		
	}
	int myValue = [self getValue];
	int otherValue = [otherObject getValue];
	// when hand values are exactly equal - if they are zero then its a tie, if not, check the high tile - if those are equal too then also its a tie
	// else use high tile as tie breaker 
	if (myValue == otherValue) {
		return (myValue == 0)? NSOrderedSame: ([self getHighTile].position == [otherObject getHighTile].position)? NSOrderedSame :
		([self getHighTile].position < [otherObject getHighTile].position)? NSOrderedAscending : NSOrderedDescending;
	}
	// when values differ the higher value wins
	return (myValue > otherValue)? NSOrderedAscending : NSOrderedDescending;
}

- (bool) containsNumDots:(int) numDots {
	return tileOne.numberDots == numDots || tileTwo.numberDots == numDots;
}

-(bool) compareSameIf:(Hand*) other {
	return ((self.tileOne.position == other.tileOne.position && self.tileTwo.position == other.tileTwo.position) ||
			(self.tileTwo.position == other.tileOne.position && self.tileOne.position == other.tileTwo.position)) ? true : false;
} 

@end
