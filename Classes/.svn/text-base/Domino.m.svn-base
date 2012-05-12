//
//  Domino.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "Domino.h"
@implementation Domino




@synthesize name, position, numberDots, shortName;

int const GEEJOON = 1;
int const TEEN = 2;
int const DAY = 3;
int const YUN = 4;
int const GOR = 5;
int const MOOY = 6;
int const CHONG = 7;
int const BON = 8;
int const FOO = 9;
int const PING = 10;
int const TIT = 11;
int const LOOK = 12;
int const CHOPGOW = 13;
int const CHOPBOT = 14;
int const CHOPCHIT = 15;
int const CHOPNG = 16;


- (id) initWithPosition:(int) pos numberDots:(int) dots name: (NSString *) tileName {
	position = pos;
	numberDots = dots;
	self.name = tileName;
	NSArray *lineElements = [tileName componentsSeparatedByString:@"-"];
	self.shortName = (NSString*) [lineElements objectAtIndex:0];
	return self;
}

- (bool) isTeenOrDay {
	return (numberDots == 2 ||  numberDots == 12);
}
/*
// return true if greater only (Demoting Geejoon for pair purposes)
- (bool) isGreaterThan: (Domino*) other {
	if(self.position == GEEJOON && other.position == GEEJOON) {
		return false;
	} else if (self.position == GEEJOON) {
		return false;
	} else if(other.position == GEEJOON) {
		return true;
	} else if (self.position > other.position) {
		return true;
	}
}
*/

@end
