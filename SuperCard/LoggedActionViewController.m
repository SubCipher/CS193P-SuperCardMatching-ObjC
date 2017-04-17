//
//  LoggedActionViewController.m
//  SuperCard
//
//  Created by MacMan on 10/18/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "LoggedActionViewController.h"
#import "CardStringConversion.h"




@interface LoggedActionViewController()
@property (weak, nonatomic) IBOutlet UILabel *pairdCardsLabel;

@property(strong,nonatomic)CardStringConversion *cardString;

@property (weak, nonatomic) IBOutlet UILabel *pairIndexLabel;

@end


@implementation LoggedActionViewController
- (IBAction)pairedCardsSlider:(UISlider *)sender {
    
    sender.minimumValue = 0;
    sender.maximumValue = [self.pairedLogArray count]-1;
    
    
    int sliderValueAsINT = sender.value;
    
    self.pairdCardsLabel.text = [NSString stringWithFormat:@"%@",self.pairedLogArray[sliderValueAsINT]];
    
    self.pairIndexLabel.text = [NSString stringWithFormat:@"index value: %d",sliderValueAsINT];
    
    //return emojis for card suits 
    NSLog(@"card pair contents %@",[self.cardString convertString:self.pairedLogArray]);
    NSLog(@"cardmatchVC :) %@",self.pairedLogArray[sliderValueAsINT]);
   
}

@end
