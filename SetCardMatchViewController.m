//
//  SetCardMatchViewController.m
//  SuperCard
//
//  Created by MacMan on 10/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "SetCardMatchViewController.h"


@interface SetCardMatchViewController ()

@end

@implementation SetCardMatchViewController

-(Deck *)createDeck{
    return [[SetCardDeck alloc]init];
}


-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" :@"setCardBack"];
}

@end
