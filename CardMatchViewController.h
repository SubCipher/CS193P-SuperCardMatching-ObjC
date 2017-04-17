//
//  CardMatchViewController.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"


@interface CardMatchViewController : UIViewController
@property(nonatomic)int score;
-(Deck *)createDeck;

-(UIImage *)backgroundImageForCard:(Card *)card;

@end
