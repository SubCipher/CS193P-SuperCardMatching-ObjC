//
//  CardMatchViewController.m
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchViewController.h"
#import "CardMatchingGame.h"
#import "LoggedActionViewController.h"



@interface CardMatchViewController ()
//UISLIDER
@property (weak, nonatomic) IBOutlet UISlider *logRptSlider;
//label for slider value
@property (weak, nonatomic) IBOutlet UILabel *loggedActionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;

//endSLIder

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *flipCardButtonCollection;

@property(strong,nonatomic)CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *matchScoreLabel;
@property(strong,nonatomic)Deck *deck;



@end

@implementation CardMatchViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"loggedActionSegue"]){
        if([segue.destinationViewController isKindOfClass:[LoggedActionViewController class]]){
            LoggedActionViewController *logvc = (LoggedActionViewController *)segue.destinationViewController;
            logvc.pairedLogArray = [self.game pairedCardArray];
            
        }
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}

/*
 @"\U2666\Ufe0f" diamonds
 
 @"\U2660\Ufe0f" clubs
 
 @"\u2663\ufe0f” spades
 
 @"\U2665\Ufe0f” harts
 
 */

- (IBAction)logRptSliderAction:(UISlider *)sender {
    sender.minimumValue = 0;
    sender.maximumValue = [[self.game pairedCardArray] count]-1;
    
    
    int sliderValueAsINT = sender.value;
    self.loggedActionsLabel.text = [NSString stringWithFormat:@"%@",self.game.pairedCardArray[sliderValueAsINT]];
    
    self.sliderValueLabel.text = [NSString stringWithFormat:@"index value: %d",sliderValueAsINT];
    NSLog(@"cardmatchVC :) %@",self.game.pairedCardArray);
    
}

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.flipCardButtonCollection count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return nil;
}



- (IBAction)flipCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.flipCardButtonCollection indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    
    [self updateUI];
    
}

-(void)updateUI{
    for(UIButton *cardButton in self.flipCardButtonCollection){
        NSInteger cardButtonIndex = [self.flipCardButtonCollection indexOfObject:cardButton];
        
        Card *card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }self.matchScoreLabel.text = [NSString stringWithFormat:@"Match Score: %d",self.game.score];
}


-(NSString *)titleForCard:(Card *)card{
    return card.chosen ? card.contents :@" ";
    
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return nil;
}

-(IBAction)segmentedControlAction:(UISegmentedControl *)sender{
    
    [self.game singleOrMultipleOption:sender.selectedSegmentIndex];
}

-(IBAction)resetButton:(UIButton *)sender{
    self.game = nil;
    [self updateUI];
}

@end
