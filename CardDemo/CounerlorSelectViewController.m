//
//  CounerlorSelectViewController.m
//  MainApp
//
//  Created by long on 2/23/16.
//  Copyright © 2016 hzins. All rights reserved.
//

#import "CounerlorSelectViewController.h"
#import "CounserlorSelectCollectionCell.h"
#import "CounserSelectionLayout.h"


@interface CounerlorSelectViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *imgBg;

@property (nonatomic, strong) NSMutableArray*  arrayData;

- (void)requestNetwork;
@end

@implementation CounerlorSelectViewController


#pragma mark -------------------
#pragma mark - CycLife


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView]
    ;
}

- (void)setupView{
    self.title = @"选择顾问";
   
    UIImageView *collectViewBgImg = [[UIImageView alloc] init];
    collectViewBgImg.bounds = self.collectionView.bounds;
    collectViewBgImg.center = self.collectionView.center;
    UIImage *originalImg = [UIImage imageNamed:@"consultant_bg_card_normal"];
    
    collectViewBgImg.image  = [originalImg resizableImageWithCapInsets:UIEdgeInsetsMake(originalImg.size.height/2, 0.1, originalImg.size.height/2, 0) resizingMode:UIImageResizingModeStretch];
//    self.collectionView.backgroundView = collectViewBgImg;
    self.imgBg.image = [originalImg resizableImageWithCapInsets:UIEdgeInsetsMake(originalImg.size.height/2, 0.1, originalImg.size.height/2, 0) resizingMode:UIImageResizingModeStretch];
    self.collectionView.collectionViewLayout = [[CounserSelectionLayout alloc] init];
    self.collectionView.showsHorizontalScrollIndicator = NO;
//    self.collectionView.decelerationRate = 0; // 滑动速率
//    self.collectionView.pagingEnabled = YES;
    
    [self performSelector:@selector(requestNetwork) withObject:nil afterDelay:0.2f];

}
#pragma mark --------------------
#pragma mark - Settings, Gettings


#pragma mark --------------------
#pragma mark - Events

- (void)requestNetwork{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.arrayData = [NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]];

        [self.collectionView reloadData];
        
        self.collectionView.contentOffset = CGPointMake(CounserSectionItemW * 11 , 0);
    });
}
#pragma mark -------------------
#pragma mark - Methods

#pragma mark --------------------
#pragma mark - UITableViewDelegate, UITableViewSourceData

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayData.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CounserlorSelectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CounserlorSelectCollectionCell" forIndexPath:indexPath];
    cell.lblServiceNumb.text =  [self.arrayData[indexPath.row] stringValue];
    return cell;
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
        if (scrollView.contentOffset.x <= CounserSectionItemW * 7 + CounserSectionMargL) {

            scrollView.contentOffset = CGPointMake(CounserSectionMargL + CounserSectionItemW *  17, 0);
        }else if (scrollView.contentOffset.x >= CounserSectionItemW* 19 + CounserSectionMargL ){
            

            self.collectionView.contentOffset = CGPointMake(CounserSectionMargL + CounserSectionItemW * 9, 0);
        }
    
}
#pragma mark ------------------
#pragma mark - KyoRefreshControlDelegate

#pragma mark --------------------
#pragma mark - NSNotification

#pragma mark --------------------
#pragma mark - KVO/KVC

@end
