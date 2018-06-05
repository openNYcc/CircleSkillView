//
//  NYCollectionViewCell.m
//  CircleSkillView
//
//  Created by ningye on 2018/6/4.
//  Copyright © 2018年 ningye. All rights reserved.
//

#import "NYCollectionViewCell.h"

@implementation NYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIView *m_contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 100)];
        m_contentView.backgroundColor =[UIColor clearColor];
        [self addSubview:m_contentView];
        self.m_contentView = m_contentView;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,10, 60, 60)];
        imageView.layer.cornerRadius = 30;
        imageView.layer.masksToBounds=YES;
        [m_contentView addSubview:imageView];
        self.imageView = imageView;
        UILabel *txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 60, 20)];
        txtLabel.font = [UIFont systemFontOfSize:14.f];
        txtLabel.text = @"钻戒/r 1000星星";
        [m_contentView addSubview:txtLabel];
        self.txtLabel = txtLabel;
        
    }
    
    return self;
}

-(void)setImage:(NSString *)image
{
    _image=[image copy];
    
    self.imageView.image=[UIImage imageNamed:image];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect viewF = self.frame;
    NSLog(@"x=%f   y=%f",viewF.origin.x,viewF.origin.y);
//    self.imageView.frame = self.bounds;
//    self.titleLabel.frame = CGRectMake(0, self.hyb_height - 30, self.hyb_width, 30);
//    self.titleLabel.hidden = self.titleLabel.text.length > 0 ? NO : YES;
}

@end
