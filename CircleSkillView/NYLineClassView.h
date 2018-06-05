//
//  NYLineClassView.h
//  CircleSkillView
//
//  Created by ningye on 2018/6/5.
//  Copyright © 2018年 ningye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYLineClassView : UIView

@property (nonatomic,strong) NSMutableArray *pointList;

//画线
-(void)drawLineMovePoint:(CGPoint)movePoint toPoint:(CGPoint)toPoint;

@end
