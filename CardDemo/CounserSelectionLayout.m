//
//  CounserSelectionLayout.m
//  MainApp
//
//  Created by long on 2/24/16.
//  Copyright © 2016 hzins. All rights reserved.
//

#import "CounserSelectionLayout.h"




@implementation CounserSelectionLayout



//完成一个过程需要的位移
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

//#define itemW   (kWindowWidth * 246 / 375)
//#define  itemH  (kWindowHeight * 366 / 667)

//第一个要重写的方法 设置基本的大小
- (void)prepareLayout
{
    [super prepareLayout];
    //cell大小

    

    NSLog(@"%f %f %f %f %f %f %f %f",self.collectionView.frame.size.width, self.collectionView.frame.size.height, kWindowWidth, kWindowHeight,CounserSectionItemW, CounserSectionMargL,self.collectionView.contentSize.width,self.collectionView.contentSize.height);
    self.itemSize = CGSizeMake(CounserSectionItemW,CounserSectionItemH);
    //滑动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //组间四个方位间距
 
//    CGFloat inset = (self.collectionView.frame.size.width - itemW) * 0.5 ;
//    CGFself	CounserSelectionLayout *	0x7fa1d9690e20	0x00007fa1d9690e20loat inset = kWindowWidth / 2 - CounserSectionItemW/2;
    self.sectionInset = UIEdgeInsetsMake(0, CounserSectionMargL, 0, CounserSectionMargL);
    //列间距
    self.minimumLineSpacing = 0;

    


}


- (CGSize)collectionViewContentSize{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    
    return CGSizeMake(CounserSectionMargL*2+CounserSectionItemW * cellCount, 0);
}



- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
            return YES;

}



//最大旋转角度
#define rotate 15*M_PI/180

//

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    

    // 可见矩形框
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    // 计算屏幕最中间的x

    

    
    for (UICollectionViewLayoutAttributes *attribute in  array) {
        
        if(CGRectIntersectsRect(attribute.frame, visibleRect)){
          
            CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;

            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
    

          
                attribute.alpha =  (1-(distance / self.collectionView.frame.size.width) );
                CGFloat zoom = rotate*normalizedDistance;
                CATransform3D transfrom = CATransform3DIdentity;
                transfrom.m34 = 0.005;
                transfrom.m41 = -distance / 3.5; // X 平移
                transfrom.m42 = ABS(distance) / 5;  // y 平移
         
                transfrom = CATransform3DRotate(transfrom, -zoom, 0.0f, 0.0f, 1.0f);
            
            
            
                attribute.transform3D = transfrom;
                attribute.zIndex = 1;
                attribute.alpha =  (1-(ABS(distance) / self.collectionView.frame.size.width ));
        
        }
    }
    
    
    return array;
}



//类似于scrollview的scrollViewWillEndDragging
/**
 *  用来设置collectionView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
 *  @param velocity              滚动速度
 */

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    // 1.计算出scrollView最后会停留的范围
    CGRect lastRect;
    lastRect.origin = proposedContentOffset;
    lastRect.size = self.collectionView.frame.size;
    
    // 计算屏幕最中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 2.取出这个范围内的所有属性
    NSArray *array = [self layoutAttributesForElementsInRect:lastRect];
    //    KyoLog(@"begin");
    // 3.遍历所有属性
    CGFloat adjustOffsetX = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(attrs.center.x - centerX) < ABS(adjustOffsetX)) {
            adjustOffsetX = attrs.center.x - centerX;
            
//            return  CGPointMake(proposedContentOffset.x + adjustOffsetX, CGRectGetMinY(lastRect));
        }
        
    }

    return  CGPointMake(proposedContentOffset.x + adjustOffsetX, CGRectGetMinY(lastRect));
   

}




@end
