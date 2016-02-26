//
//  CounserSelectionLayout.h
//  MainApp
//
//  Created by long on 2/24/16.
//  Copyright © 2016 hzins. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSystemVersion ([[[UIDevice currentDevice] systemVersion] doubleValue])

#define kSystemVersionMoreThan8 (kSystemVersion >= 8.0)

//设备高度
#define kWindowHeight (kSystemVersionMoreThan8 ? [[[UIApplication sharedApplication] delegate] window].bounds.size.height : [[[UIApplication sharedApplication] delegate] window].bounds.size.height)

//设备宽度
#define kWindowWidth (kSystemVersionMoreThan8 ? [[[UIApplication sharedApplication] delegate] window].bounds.size.width : [[[UIApplication sharedApplication] delegate] window].bounds.size.width)

//设备比例
#define kScreenScale    ([UIScreen mainScreen].scale)

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height


#define  KItemSizeWidth   ((492/750)*kWindowWidth)
#define  KItemSizeHeight  ((336/667)*kWindowHeight)



#define  CounserSectionItemW  ((kWindowWidth * 246) / 375)

#define  CounserSectionItemH  (kWindowHeight * 366 / 667)

#define  CounserSectionMargL  (kWindowWidth / 2 - CounserSectionItemW/2)

@interface CounserSelectionLayout : UICollectionViewFlowLayout



@end
