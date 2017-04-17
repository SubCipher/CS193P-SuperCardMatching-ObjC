//
//  CardStringConversion.m
//  SuperCard
//
//  Created by MacMan on 10/18/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import "CardStringConversion.h"

@interface CardStringConversion()


@end

@implementation CardStringConversion

-(void)setConvertedString:(NSMutableString *)convertedString{
    _convertedString = convertedString;
}


-(NSMutableString *)convertString:(NSArray *)stringSource{
   
    self.convertedString = [[NSMutableString alloc]initWithString:[stringSource description]];
   
    NSMutableString *arrayItem = [[NSMutableString alloc]initWithString:@"this object string"];
    
    NSLog(@"%@",arrayItem);
    
    return self.convertedString;
}


@end
