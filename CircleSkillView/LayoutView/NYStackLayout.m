//
//  NYStackLayout.m
//  PhotosCollectionView-StackLayout
//
//  Created by ningye on 15/3/8.
//  Copyright (c) 2015年 ningye. All rights reserved.
//

#import "NYStackLayout.h"

@implementation NYStackLayout

//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    return NO;
//}


//布局的size
-(CGSize)collectionViewContentSize
{
    return CGSizeMake(500, 500);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *angels=@[@0,@(-1.4),@(1.6),@(3),@(-2)];
    UICollectionViewLayoutAttributes *attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:indexPath.item inSection:0]];
    attr.size=CGSizeMake(100, 100);
    //随机center
    //        attr.center=CGPointMake(arc4random_uniform(self.collectionView.frame.size.width), arc4random_uniform(self.collectionView.frame.size.height));
    attr.center=CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height*0.5);
    if (indexPath.item>=5) {
        attr.hidden=YES;
    }else{
        attr.transform3D=CATransform3DMakeRotation([angels[indexPath.item] floatValue], 0, 0, 1.0);
    }
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
