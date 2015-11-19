//
//  Snake.m
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import "Snake.h"

@implementation Snake
@synthesize currectDirection;
@synthesize beforeDirection;
-(id)init
{
    Ball *headBall = [[Ball alloc]initWithFrame:CGRectMake(60, 20, 20, 20)];
    Ball *headNextBall = [[Ball alloc]initWithFrame:CGRectMake(40, 20, 20, 20)];
    Ball *secondBall = [[Ball alloc]initWithFrame:CGRectMake(20, 20, 20, 20)];
    self.body = [[NSMutableArray alloc]init];
    self = [super init];
    self.willStop = NO;
    if (self) {
        self.headBall = headBall;
        [self.body addObject:headNextBall];
        [self.body addObject:secondBall];
    }
    return self;
}

-(Ball*)addBall
{
    Ball *ball;
    if (self.body.count == 0) {
        ball = [[Ball alloc]initWithFrame:self.headBall.frame];
    } else{
        Ball *nail = (Ball *)[self.body lastObject];
        ball = [[Ball alloc]initWithFrame:nail.frame];
    }
    [self.body addObject:ball];
    return ball;
}

-(void)move
{
    if (self.headBall.willStop == NO) {
        for (int i = self.body.count-1; i >= 1; i --) {
            Ball *ball = (Ball *)[self.body objectAtIndex:i];
            Ball *aheadBall = (Ball *)[self.body objectAtIndex:i-1];
            [ball moveByAheadBall:aheadBall];
        }
        Ball *headNextBall = (Ball *)[self.body objectAtIndex:0];
        [headNextBall moveByAheadBall:self.headBall];
        [self.headBall moveByDirection:currectDirection];
    } else {
        self.willStop = YES;
    }
}
@end
