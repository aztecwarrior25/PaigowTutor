//
//  Deck.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/6/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "Deck.h"
#import "Domino.h"


@implementation Deck
@synthesize deckOfDominoes;

-(id) init {
	deckOfDominoes = [[NSMutableArray alloc] init];
	Domino* newDomino;
	
	// Wild Card
	newDomino = [[Domino alloc] initWithPosition:GEEJOON numberDots:3 name:@"GeeJoon-3"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:GEEJOON numberDots:6 name:@"GeeJoon-6"];
	[deckOfDominoes addObject:newDomino];
	
	// Regular pairs
	newDomino = [[Domino alloc] initWithPosition:TEEN numberDots:12 name:@"Teen"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:TEEN numberDots:12 name:@"Teen"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:DAY numberDots:2 name:@"Day"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:DAY numberDots:2 name:@"Day"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:YUN numberDots:8 name:@"Yun"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:YUN numberDots:8 name:@"Yun"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:GOR numberDots:4 name:@"Gor"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:GOR numberDots:4 name:@"Gor"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:MOOY numberDots:10 name:@"Mooy"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:MOOY numberDots:10 name:@"Mooy"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHONG numberDots:6 name:@"Chong"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHONG numberDots:6 name:@"Chong"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:BON numberDots:4 name:@"Bon"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:BON numberDots:4 name:@"Bon"];
	[deckOfDominoes addObject:newDomino];
	
	newDomino = [[Domino alloc] initWithPosition:FOO numberDots:11 name:@"Foo"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:FOO numberDots:11 name:@"Foo"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:PING numberDots:10 name:@"Ping"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:PING numberDots:10 name:@"Ping"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:TIT numberDots:7 name:@"Tit"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:TIT numberDots:7 name:@"Tit"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:LOOK numberDots:6 name:@"Look"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:LOOK numberDots:6 name:@"Look"];
	[deckOfDominoes addObject:newDomino];
	
	// Military
	newDomino = [[Domino alloc] initWithPosition:CHOPGOW numberDots:9 name:@"ChopGow-L"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPGOW numberDots:9 name:@"ChopGow-R"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPBOT numberDots:8 name:@"ChopBot-L"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPBOT numberDots:8 name:@"ChopBot-R"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPCHIT numberDots:7 name:@"ChopChit-L"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPCHIT numberDots:7 name:@"ChopChit-R"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPNG numberDots:5 name:@"ChopNg-L"];
	[deckOfDominoes addObject:newDomino];
	newDomino = [[Domino alloc] initWithPosition:CHOPNG numberDots:5 name:@"ChopNg-R"];
	[deckOfDominoes addObject:newDomino];
	
	return self;
}

-(void) shuffle {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self.deckOfDominoes count]];
	NSMutableArray *copy = [self.deckOfDominoes mutableCopy];
	while ([copy count] > 0)
	{
		int index = arc4random() % [copy count];
		id objectToMove = [copy objectAtIndex:index];
		[array addObject:objectToMove];
		[copy removeObjectAtIndex:index];
	}
	
	//[copy release];
	//[self.deckOfDominoes release];
	self.deckOfDominoes = array;
}

-(void) printDeck {
	for (Domino *d in self.deckOfDominoes) {
		NSLog(d.name);
	}
}

-(NSMutableArray *) dealWith:(int) numberOfTiles {
	NSMutableArray* dealtTiles = [[NSMutableArray alloc] initWithCapacity:numberOfTiles];
	for (int i = 0; i < numberOfTiles; i++) {
		id objectToMove = [deckOfDominoes objectAtIndex:i];
		[dealtTiles addObject:objectToMove];
		[deckOfDominoes removeObjectAtIndex:i];
	}
	return dealtTiles;
}


-(NSMutableArray *) dealUniqueWith:(int) numberOfTiles {
	NSMutableArray* dealtTiles = [[NSMutableArray alloc] initWithCapacity:numberOfTiles];
	int k = 0, i = 0;
	while (k < numberOfTiles) {
		id objectToMove = [deckOfDominoes objectAtIndex:i];
		Domino *selectedDomino = (Domino *) objectToMove;
		bool unique = true;
		for (int j = 0; j < i; j++) {
			// look for duplicates and skip adding to return set if yes
			Domino *addedDomino = (Domino *) [deckOfDominoes objectAtIndex:j];
			if([selectedDomino.shortName isEqualToString:addedDomino.shortName]) {
				unique = false;
				break;
			}
		}
			   
		if(unique) {
			k++;
			[dealtTiles addObject:objectToMove];
			//[deckOfDominoes removeObjectAtIndex:i];
		}
		i++;
	}
	return dealtTiles;
}

-(NSMutableArray *) dealUniqueValueWith:(int) numberOfTiles {
	NSMutableArray* dealtTiles = [[NSMutableArray alloc] initWithCapacity:numberOfTiles];
	int k = 0, i = 0;
	while (k < numberOfTiles) {
		id objectToMove = [deckOfDominoes objectAtIndex:i];
		Domino *selectedDomino = (Domino *) objectToMove;
		bool unique = true;
		for (int j = 0; j < i; j++) {
			// look for duplicates and skip adding to return set if yes
			Domino *addedDomino = (Domino *) [deckOfDominoes objectAtIndex:j];
			if(selectedDomino.position == addedDomino.position) {
				unique = false;
				break;
			}
		}
		
		if(unique) {
			k++;
			[dealtTiles addObject:objectToMove];
			//[deckOfDominoes removeObjectAtIndex:i];
		}
		i++;
	}
	return dealtTiles;
}



@end

