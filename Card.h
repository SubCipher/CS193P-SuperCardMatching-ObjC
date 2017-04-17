//
//  Card.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(nonatomic,strong)NSString *contents;

@property(nonatomic,getter=isMatched)BOOL matched;
@property(nonatomic,getter=isChosen)BOOL chosen;

-(int)match:(NSArray *)otherCards;

@end
