//
//  LogData.m
//  SuperCard
//
//  Created by MacMan on 10/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "LogData.h"



@interface LogData()
@property(strong,nonatomic)NSMutableArray *loggedActionArray;
@property(strong,nonatomic)NSMutableDictionary *loggedActionsDict;


@end


@implementation LogData


//convert universal chart to emoji

-(NSMutableArray *)loggedActionArray{
    if(!_loggedActionArray) _loggedActionArray= [[NSMutableArray alloc]init];
    return _loggedActionArray;
}



-(NSMutableDictionary *)loggedActions:(NSString *)cardContents matchCard:(NSString *)otherCardContents{
    
    
   self.loggedActionsDict = [NSMutableDictionary dictionary];
    
    [self.loggedActionsDict setObject:cardContents forKey:otherCardContents];
    
    return self.loggedActionsDict;
}


-(NSMutableArray *)userActionLog:(Card *)card matchCard:(Card *)otherCard{
    //add strings from loggedActionsDict to loggedActionArray
    
    [self.loggedActionArray addObject:[self loggedActions:card.contents matchCard:otherCard.contents]];
   
    //NSLog(@"==>%@",self.loggedActionArray);
    return self.loggedActionArray;
   
    
}



@end
