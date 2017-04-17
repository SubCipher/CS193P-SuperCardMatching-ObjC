//
//  ViewController.m
//  SuperCard
//
//  Created by MacMan on 10/6/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property(strong,nonatomic)Deck *deck;

@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck) _deck = [[PlayingCardDeck alloc]init];
    return _deck;
    
}

-(void)drawRandomPlayingCard{
    Card *card = [self.deck drawRandomCard];
    if([card isKindOfClass:[PlayingCard class]]){
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
        
    }
}







- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    
    if(!self.playingCardView.faceUp) [self drawRandomPlayingCard];
    self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
    
    
}
@end
