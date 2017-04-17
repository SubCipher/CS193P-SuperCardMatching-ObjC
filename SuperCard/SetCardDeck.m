//
//  SetCardDeck.m
//  SuperCard
//
//  Created by MacMan on 10/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype) init{
    self = [super init];
    if(self){
        for(NSString *uniformContext in [SetCard validUniformContext]){
            for(NSUInteger rank = 1; rank <=[SetCard maxRank];rank++){
                SetCard *card = [[SetCard alloc]init];
                card.rank = rank;
                card.uniformContext = uniformContext;
                [self addCard:card];
            }
        }
    }return self;
}


@end
