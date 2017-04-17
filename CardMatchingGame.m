//
//  CardMatchingGame.m
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic,readwrite)int score;
@property(strong,nonatomic)NSMutableArray *cards;
@property(strong,nonatomic)NSMutableArray *matchOtherCards;
@property(nonatomic)NSInteger singleOrMultipleOption;

@end

@implementation CardMatchingGame

-(LogData *)logData{
    if(!_logData) _logData = [[LogData alloc]init];
    return _logData;
}


-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
    
}

-(NSUInteger)singleOrMultipleOption:(NSUInteger)gameMatchOptions{
    
    switch (gameMatchOptions) {
            
        case 0:
            self.singleOrMultipleOption = 0;
            break;
        case 1:
            self.singleOrMultipleOption = 1;
            break;
            
        default:
            self.singleOrMultipleOption = self.singleOrMultipleOption;
            break;
    }
    return self.singleOrMultipleOption;
}



-(NSMutableArray *)matchOtherCards{
    if(!_matchOtherCards) _matchOtherCards = [[NSMutableArray alloc]init];
    return _matchOtherCards;
    
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }return self;
}


-(Card *)cardAtIndex:(NSInteger)index{
    return (index <[self.cards count]) ? self.cards[index]:nil;
    
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)resetMatchedCardsArray{
    [self.matchOtherCards removeAllObjects];
}


-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    
                    //call to LogData.h to create an array and from dictionaries
                    
                    
                    self.pairedCardArray =[self.logData userActionLog:card matchCard:otherCard];
                                        
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        
                        if(self.singleOrMultipleOption == 0){
                            otherCard.matched = YES;
                            card.matched = YES;
                        }
                        else if(self.singleOrMultipleOption == 1){
                            [self.matchOtherCards addObject:otherCard];
                            
                            if([self.matchOtherCards count]==2){
                                if([self.matchOtherCards containsObject:card]){
                                    NSLog(@"card %@ match found at %@ otherCard",card.contents,otherCard);
                                }else{
                                    [self.matchOtherCards addObject:card];
                                }
                                for(Card *matchedCard in self.matchOtherCards){
                                    
                                    matchedCard.chosen = YES;
                                    matchedCard.matched = YES;
                                }[self resetMatchedCardsArray];
                                break;

                            }
                        }
                        
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        [self resetMatchedCardsArray];
                    }
                }
            }self.score -= COST_TO_CHOOSE;
            card.chosen =YES;
        }
    }
}
@end
