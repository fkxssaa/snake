//
//  Ball.m
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import "Ball.h"

@implementation Ball

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:10];
        self.willStop = NO;
        [self setBackgroundColor:[UIColor brownColor]];
    }
    return self;
}

-(void)moveByAheadBall:(Ball *)ball
{
    [UIView animateWithDuration:0.1 animations:^{
        self.center = ball.center;
    }];
}

-(void)moveByDirection:(NSString *)direction
{
    [UIView animateWithDuration:0.1 animations:^{
        CGPoint currectPoint = self.center;
        if ([direction isEqualToString:@"up"]) {
            if (currectPoint.y != 10) {
                currectPoint.y -= 20;
            } else {
                self.willStop = YES;
//                currectPoint.y = 470;
            }
        } else if ([direction isEqualToString:@"down"]){
            if (currectPoint.y != 470) {
                currectPoint.y += 20;
            } else {
                self.willStop = YES;
//                currectPoint.y = 10;
            }
        } else if ([direction isEqualToString:@"left"]){
            if (currectPoint.x != 10) {
                currectPoint.x -= 20;
            } else {
                self.willStop = YES;
//                currectPoint.x = 310;
            }
        } else{
            if (currectPoint.x != 310) {
                currectPoint.x += 20;
            } else {
                self.willStop = YES;
//                currectPoint.x = 10;
            }
        }
        self.center = currectPoint;
    }];
}

@end
