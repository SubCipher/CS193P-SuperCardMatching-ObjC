//
//  PlayingCardView.h
//  SuperCard
//
//  Created by MacMan on 10/5/16.
//  Copyright © 2016 StepWiseDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property(nonatomic)NSUInteger rank;
@property(strong,nonatomic)NSString *suit;
@property(nonatomic)BOOL faceUp;
-(void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
