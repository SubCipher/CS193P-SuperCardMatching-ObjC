//
//  SetCard.m
//  SuperCard
//
//  Created by MacMan on 10/11/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


@synthesize uniformContext = _uniformContext;


-(int)match:(NSArray *)otherCards{
    int score = 0;
    if([otherCards count]==1){
        SetCard *otherCard = [otherCards firstObject];
        
        if(otherCard.rank ==self.rank){
            score = 4;
        }
        else if([otherCard.uniformContext isEqualToString:self.uniformContext]){
            score = 1;
        }
    }return score;
}



-(NSString *)contents{
    NSArray *rankStrings = [SetCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.uniformContext];
    
}

+(NSArray *)rankStrings{
    return @[@"👁",@"☉",@"☥",@"⚖",@"&&",@"||",@" ",@"+",@"-",@"-|-",@"+|+",@"-|+",@"+|-"];
}

+(NSArray *)validUniformContext{
    
    return @[@"⚪️",@"⚫️",@"🔴",@"🔵"];
}

-(void)setUniformContext:(NSString *)uniformContext{
    if([[SetCard validUniformContext] containsObject:uniformContext]){
        _uniformContext = uniformContext;
    }
}

-(NSString *)uniformContext {
    return _uniformContext ? _uniformContext : @"?";
}

-(void)setRank:(NSUInteger)rank{
    if(rank <[SetCard maxRank]){
        _rank = rank;
    }
}

+(NSUInteger)maxRank{
    return [[self rankStrings]count]-1;
}


@end
