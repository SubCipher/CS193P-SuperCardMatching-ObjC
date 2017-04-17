//
//  LogData.h
//  SuperCard
//
//  Created by MacMan on 10/12/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface LogData : NSObject


-(NSMutableArray *)userActionLog:(Card *)cardContents matchCard:(Card *)otherCardContents;

@end
