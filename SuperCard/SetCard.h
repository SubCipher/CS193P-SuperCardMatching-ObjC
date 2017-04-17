//
//  SetCard.h
//  SuperCard
//
//  Created by MacMan on 10/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property(strong,nonatomic)NSString *uniformContext;
@property(nonatomic)NSUInteger rank;

+(NSArray *)validUniformContext;
+(NSUInteger)maxRank;

@end
