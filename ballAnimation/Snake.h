//
//  Snake.h
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ball.h"

@interface Snake : NSObject

@property Ball *headBall;
@property NSString *currectDirection;
@property NSString *beforeDirection;
@property NSMutableArray *body;
@property (nonatomic) BOOL willStop;

-(void)move;
-(Ball*)addBall;

@end
