//
//  CardMatchingGame.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
#import "LogData.h"

@interface CardMatchingGame : NSObject

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSInteger)index;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

@property(nonatomic,readonly)int score;
@property(strong,nonatomic)NSMutableArray *pairedCardArray;

-(NSUInteger)singleOrMultipleOption:(NSUInteger)gameMatchOptions;
@property(strong,nonatomic)LogData *logData;
-(void)resetMatchedCardsArray;

@end
