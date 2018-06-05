//
//  NYLineLayout.m
//  PhotosCollectionView
//
//  Created by ningye on 15/3/7.
//  Copyright (c) 2015年 ningye. All rights reserved.
//

#import "NYLineLayout.h"
#import "NYCollectionViewCell.h"

static const CGFloat NYItemWH=50;

@implementation NYLineLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
/**
 *  一些初始化工作最好在这里实现
 */
- (void)prepareLayout
{
    [super prepareLayout];
    //每个cell的尺寸
    //初始化
    self.itemSize=CGSizeMake(60, 180);
    //滚动方向
    self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //切除多余 保证item 在center
//    CGFloat inset=(self.collectionView.frame.size.width-NYItemWH)*0.5;
    self.sectionInset=UIEdgeInsetsMake(0, 5, 0, 5);
    
    self.minimumLineSpacing = 15;
    //每一个cell(item)都有自己的UICollectionViewLayoutAttributes
}

/**
 *  只要显示的边境发生改变就重新布局:
 内部会重新调用layoutAttributesForElementsInRect方法来重新布局
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 *  用来设置scrollview停止的瞬间调用
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect lastRect;
    lastRect.origin=proposedContentOffset;
    lastRect.size=self.collectionView.frame.size;
    
    NSArray *array=[super layoutAttributesForElementsInRect:lastRect];
    //屏幕中点的X
    CGFloat centerX=proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
    //计算中点
    CGFloat adjfloat=MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in array) {
        CGFloat chaValue=ABS(attr.center.x-centerX);
        if (chaValue< ABS(adjfloat)) {
            adjfloat=attr.center.x-centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x+adjfloat, proposedContentOffset.y);
}

///**
// *  重新布局
// */
//-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    //计算可见的rect
//    CGRect visiableRect;
//    visiableRect.size=self.collectionView.frame.size;
//    visiableRect.origin=self.collectionView.contentOffset;
//
//    NSArray *array=[super layoutAttributesForElementsInRect:rect];
//    //屏幕中点的X
//    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;
//
//    for (UICollectionViewLayoutAttributes *attr in array) {
//        //过滤不是可见的
//        if (!CGRectIntersectsRect(visiableRect, attr.frame)) continue;
//        CGFloat itemCenterX=attr.center.x;
//        CGFloat scale=1+0.7*(1-ABS(itemCenterX-centerX)/self.collectionView.frame.size.width);
//        attr.transform3D=CATransform3DMakeScale(scale,scale, 1.0);
//    }
//    return array;
//}

/**
 *  重新布局
 */
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //圆的半径
    CGFloat circleRadius=180;
    CGPoint circleCenter=CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height+180);
    
    //计算可见的rect
    CGRect visiableRect;
    visiableRect.size=self.collectionView.frame.size;
    visiableRect.origin=self.collectionView.contentOffset;
    NSArray *array=[super layoutAttributesForElementsInRect:rect];
    int count =0;
    
    //屏幕中点的X
    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;

    for (UICollectionViewLayoutAttributes *attr in array) {
        //过滤不是可见的
        if (!CGRectIntersectsRect(visiableRect, attr.frame)) continue;
        CGFloat itemCenterX = attr.center.x;
        CGFloat distance = itemCenterX-centerX;//x与屏幕中心的距离
        CGFloat newY = circleRadius*0.25 * (distance/circleRadius); //之前的一个设想
        attr.center=CGPointMake(attr.center.x,attr.center.y+newY);
        CGFloat bl=(distance/circleRadius);
        
        //计算当前的角度
        CGFloat angle= M_PI_2 + M_PI_4 *bl;  //最终根据，中间坐标与X的距离比 判断 a角度的值
#warning 顺便温习了一下三角函数
        CGFloat CY= circleCenter.y-circleRadius*sinf(angle);// ▶️Y= centerY - radius * sin(angle)
        NSLog(@"dis= %f  newY=%f  ==  b=%f    jd=%f   CY=%f",distance,newY,bl,M_PI_2*bl,CY);
        attr.center=CGPointMake(attr.center.x, CY-80);
    }
    
    return array;
}
@end
