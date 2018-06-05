//
//  NYCollectionViewCell.h
//  CircleSkillView
//
//  Created by ningye on 2018/6/4.
//  Copyright © 2018年 ningye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYCollectionViewCell : UICollectionViewCell

@property (nonatomic,weak) UIView *m_contentView;

@property (nonatomic,weak) UIImageView *imageView;

@property (nonatomic,weak) UILabel *txtLabel;

@property (nonatomic,copy) NSString *image;
@end
