//
//  Ball.h
//  ballAnimation
//
//  Created by fkx on 15/11/16.
//  Copyright © 2015年 fkx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ball : UIView

@property (nonatomic) BOOL willStop;

-(void)moveByAheadBall:(Ball *)ball;
-(void)moveByDirection:(NSString *)direction;

@end
