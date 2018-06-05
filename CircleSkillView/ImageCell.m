//
//  ImageCell.m
//  PhotosCollectionView
//
//  Created by ningye on 15/3/7.
//  Copyright (c) 2015年 ningye. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth=3;
    self.imageView.layer.cornerRadius=5;
    self.imageView.clipsToBounds =YES;
}

-(void)setImage:(NSString *)image
{
    _image=[image copy];

    self.imageView.image=[UIImage imageNamed:image];
}
@end
