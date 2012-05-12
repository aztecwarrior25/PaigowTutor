//
//  Domino.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

extern int const GEEJOON;
extern int const TEEN;
extern int const DAY;
extern int const YUN;
extern int const GOR;
extern int const MOOY;
extern int const CHONG;
extern int const BON;
extern int const FOO;
extern int const PING;
extern int const TIT;
extern int const LOOK;
extern int const CHOPGOW;
extern int const CHOPBOT;
extern int const CHOPCHIT;
extern int const CHOPNG;

@interface Domino : NSObject {
	int position; // aka Rank
	int numberDots;
	NSString *name;
	NSString *shortName;
}

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* shortName;
@property(nonatomic, assign) int position;
@property(nonatomic, assign) int numberDots;

- (id) initWithPosition:(int) pos numberDots:(int) dots name: (NSString *) tileName; 
- (bool) isTeenOrDay;
//- (bool) isGreaterThan: (Domino*) other;

@end
