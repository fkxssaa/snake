//
//  ViewController.h
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Snake.h"

@interface ViewController : UIViewController

@property Snake *snake;
@property NSTimer *myTimer;
@property (nonatomic) UISwipeGestureRecognizer *upGestureRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *downGestureRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *leftGestureRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *rightGestureRecognizer;

@end

