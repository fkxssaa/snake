//
//  ViewController.m
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController
@synthesize upGestureRecognizer;
@synthesize downGestureRecognizer;
@synthesize leftGestureRecognizer;
@synthesize rightGestureRecognizer;
@synthesize myTimer;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.snake = [[Snake alloc]init];
    
    upGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    downGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];;
    leftGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    rightGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    
    [upGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [downGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [leftGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [rightGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeFired) userInfo:nil repeats:YES];
    
    [self.view addSubview:self.snake.headBall];
    [self.view addSubview:(Ball *)[self.snake.body objectAtIndex:0]];
    [self.view addSubview:(Ball *)[self.snake.body objectAtIndex:1]];
    [self.view addGestureRecognizer:upGestureRecognizer];
    [self.view addGestureRecognizer:downGestureRecognizer];
    [self.view addGestureRecognizer:leftGestureRecognizer];
    [self.view addGestureRecognizer:rightGestureRecognizer];
    
}

-(void)timeFired
{
    if (self.snake.willStop == NO) {
        [self.snake move];
        if (self.snake.headBall.center.x == 110 | self.snake.headBall.center.y == 210) {
            [self.view addSubview:[self.snake addBall]];
        }
    } else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"游戏结束" message:@"game over" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        [myTimer setFireDate:[NSDate distantFuture]];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.snake.headBall removeFromSuperview];
    for (Ball *ball in self.snake.body) {
        [ball removeFromSuperview];
    }
    [self viewDidLoad];
}

-(void)handleSwipes:(UIGestureRecognizer *)sender
{
    if (sender == upGestureRecognizer && ![self.snake.currectDirection isEqualToString:@"down"]) {
        self.snake.currectDirection = @"up";
        return;
    } else if (sender == downGestureRecognizer && ![self.snake.currectDirection isEqualToString:@"up"]){
        self.snake.currectDirection = @"down";
        return;
    } else if (sender == leftGestureRecognizer && ![self.snake.currectDirection isEqualToString:@"right"]){
        self.snake.currectDirection = @"left";
        return;
    } else if(![self.snake.currectDirection isEqualToString:@"left"]){
        self.snake.currectDirection = @"right";
        return;
    }
}

@end

