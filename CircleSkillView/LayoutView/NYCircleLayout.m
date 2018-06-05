//
//  NYCircleLayout.m
//  PhotosCollectionView-StackLayout
//
//  Created by ningye on 15/3/8.
//  Copyright (c) 2015年 ningye. All rights reserved.
//

#import "NYCircleLayout.h"

@implementation NYCircleLayout


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.size=CGSizeMake(50, 50);
    //圆的半径
    CGFloat circleRadius=self.collectionView.frame.size.width*0.8;
    CGPoint circleCenter=CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height+50);
    //每个item之间的角度
    CGFloat angleData=M_PI*2/[self.collectionView numberOfItemsInSection:indexPath.section];
    //计算当前的角度
    CGFloat angle=indexPath.item*angleData;
    attr.center=CGPointMake(circleCenter.x+circleRadius*cosf(angle), circleCenter.y-circleRadius*sinf(angle));
    attr.zIndex=[self.collectionView numberOfItemsInSection:0]-indexPath.item;
    return attr;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array=[NSMutableArray array];
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        UICollectionViewLayoutAttributes *attr=[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attr];
    }
    return array;
}

@end
