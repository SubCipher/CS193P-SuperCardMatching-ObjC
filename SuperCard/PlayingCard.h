//
//  PlayingCard.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic)NSString *suit;
@property(nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
