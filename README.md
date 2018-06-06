# CircleSkillView

#主要的核心代码， 有更好方法的可以提，望能帮助到你

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