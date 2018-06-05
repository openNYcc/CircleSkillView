//
//  NYLineClassView.m
//  CircleSkillView
//
//  Created by ningye on 2018/6/5.
//  Copyright © 2018年 ningye. All rights reserved.
//

#import "NYLineClassView.h"

@interface NYLineClassView()

@property (nonatomic,strong) CAShapeLayer * chartLine;

@end

@implementation NYLineClassView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self inintCode];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self inintCode];
    }
    return self;
}

-(void)inintCode
{
    _chartLine = [CAShapeLayer layer];
    _chartLine.lineCap = kCALineCapRound;
    _chartLine.lineJoin = kCALineJoinBevel;
    _chartLine.fillColor = [[UIColor yellowColor] CGColor];
    _chartLine.lineWidth = 1.f;
    _chartLine.strokeEnd = 0.0;
    [self.layer insertSublayer:_chartLine atIndex:999999];
    [_chartLine renderInContext:UIGraphicsGetCurrentContext()];
}

- (void)drawLineMovePoint:(CGPoint)movePoint toPoint:(CGPoint)toPoint
{
    self.pointList = [NSMutableArray array];
    [self.pointList addObject:[NSValue valueWithCGPoint:movePoint]];
    [self.pointList addObject:[NSValue valueWithCGPoint:toPoint]];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    if (self.pointList&&self.pointList.count>0)
    {
        int pathCount=self.pointList.count-1;
        UIBezierPath *linePath=[[UIBezierPath alloc]init];
        linePath.lineWidth=1.f;
        
        for (int i=1; i<=pathCount; i++) {
            CGPoint movePoint=[self.pointList[i-1] CGPointValue];
            CGPoint addPoint=[self.pointList[i] CGPointValue];
            [linePath moveToPoint:movePoint];
            [linePath addLineToPoint:addPoint];
            //渲染到layer
//            [[UIColor yellowColor] set];
//            [linePath stroke];
        }
        //图层动画
        _chartLine.path = linePath.CGPath;
        _chartLine.strokeColor=[[UIColor blackColor] CGColor];
        
        _chartLine.strokeEnd = 1.0;
    }
 
}


@end
