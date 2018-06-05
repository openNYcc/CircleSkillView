//
//  ViewController.m
//  CircleSkillView
//
//  Created by ningye on 2018/6/1.
//  Copyright © 2018年 ningye. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "NYLineLayout.h"
#import "NYStackLayout.h"
#import "NYCircleLayout.h"
#import "NYCollectionViewCell.h"
#import "NYLineClassView.h"

#define ScreenBounds [UIScreen mainScreen].bounds

static NSString const *ID=@"image";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *userView;


/**
 *  array photo names is nsmutablearray
 */
@property (nonatomic,strong) NSMutableArray *photos;

@property (nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic,weak) UIButton *sendGiftBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect=CGRectMake(0, ScreenBounds.size.height-180, ScreenBounds.size.width, 180);
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[NYLineLayout alloc] init]];
    collectionView.alwaysBounceHorizontal = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor =[UIColor clearColor];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    [collectionView registerClass:[NYCollectionViewCell class] forCellWithReuseIdentifier:ID];
//    [collectionView registerNib:[UINib nibWithNibName:@"NYCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView=collectionView;
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.photos.count*2500 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    UIButton *sendGiftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    sendGiftBtn.frame = CGRectMake(0, 0, 60, 60);
    sendGiftBtn.backgroundColor = [UIColor clearColor];
    sendGiftBtn.layer.borderColor = [UIColor yellowColor].CGColor;
    sendGiftBtn.layer.borderWidth = 1.f;
    sendGiftBtn.layer.cornerRadius = 30;
    sendGiftBtn.layer.masksToBounds = YES;
    sendGiftBtn.center = CGPointMake(collectionView.center.x, collectionView.frame.origin.y+50);
    [self.view addSubview:sendGiftBtn];
    self.sendGiftBtn = sendGiftBtn;
}

-(NSArray *)photos
{
    if (!_photos) {
        self.photos=[[NSMutableArray alloc] init];
        for (int i=1; i<=10; i++) {
            [self.photos addObject:[NSString stringWithFormat:@"gjdl%02d.jpg",i]];
        }
    }
    return _photos;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count*5000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NYCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSInteger index = indexPath.item % self.photos.count;
    cell.image =self.photos[index];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.photos removeObjectAtIndex:indexPath.item];
//    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

//点击头像
- (IBAction)userToClickdo:(UIButton *)sender
{
    //计算相对屏幕坐标
    CGPoint pointTo = CGPointZero;
    CGPoint pointSend = CGPointZero;
    pointTo = [self.userView convertPoint:sender.center toView:self.view];
    pointTo = CGPointMake(pointTo.x, pointTo.y+30);
    pointSend = CGPointMake(self.sendGiftBtn.center.x, self.sendGiftBtn.center.y-30);
    //用UIBezierPath 画线
    [(NYLineClassView *)self.view drawLineMovePoint:pointSend toPoint:pointTo];
    
//    //用UIBezierPath 画线
//    UIBezierPath *linePath=[[UIBezierPath alloc]init];
//    linePath.lineWidth = 1.f;
//    [linePath moveToPoint:pointSend];
//    [linePath addLineToPoint:pointTo];
//    self.view.layer.path =linePath;
    //渲染到layer
//    [[UIColor yellowColor] set];
//    [linePath stroke];
}




@end
