//
//  Deck.m
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(strong,nonatomic)NSMutableArray *deck;


@end

@implementation Deck

-(NSMutableArray *)deck{
    if(!_deck) _deck = [[NSMutableArray alloc]init];
    return _deck;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.deck insertObject:card atIndex:0];
    }else{
        [self.deck addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    if([self.deck count]){
    unsigned index = arc4random() %[self.deck count];
    randomCard = self.deck[index];
    [self.deck removeObjectAtIndex:index];
        
    }return randomCard;
}


@end
