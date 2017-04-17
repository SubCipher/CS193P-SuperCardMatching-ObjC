//
//  CardStringConversion.h
//  SuperCard
//
//  Created by MacMan on 10/18/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardStringConversion : NSObject

@property(strong,nonatomic)NSMutableString *convertedString;

-(NSString *)convertString:(NSArray *)stringFromSource;
@end
