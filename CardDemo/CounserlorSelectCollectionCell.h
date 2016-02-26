//
//  CounserlorSelectCollectionCell.h
//  MainApp
//
//  Created by long on 2/24/16.
//  Copyright © 2016 hzins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounserlorSelectCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgCounser;  //  顾问照片

@property (weak, nonatomic) IBOutlet UILabel *lblCounserName; // 顾问姓名
@property (weak, nonatomic) IBOutlet UIButton *btnCounserlorVoice;
@property (weak, nonatomic) IBOutlet UILabel *lblCounserIntroduce;  //   顾问介绍
// 专业能力
@property (weak, nonatomic) IBOutlet UILabel *lblProfessionalNumb;
@property (weak, nonatomic) IBOutlet UILabel *lblProfessionalText;
//  服务态度
@property (weak, nonatomic) IBOutlet UILabel *lblServiceNumb;
@property (weak, nonatomic) IBOutlet UILabel *lblResponseSpeedNumb;
// 响应速度
@property (weak, nonatomic) IBOutlet UILabel *lbResponseSpeedText;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceText;

@property (weak, nonatomic) IBOutlet UIButton *btnCounserDetail;  // 查看顾问详情

@end
