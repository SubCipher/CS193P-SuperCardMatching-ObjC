//
//  PlayingCardMatchViewController.m
//  SuperCard
//
//  Created by MacMan on 10/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "PlayingCardMatchViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardMatchViewController ()

@end

@implementation PlayingCardMatchViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}


-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" :@"cardBack"];
    
}




@end
