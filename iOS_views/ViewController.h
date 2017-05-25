//
//  ViewController.h
//  iOS_views
//
//  Created by TMA103 on 5/10/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UIButton *btnAnimation;
@property (strong, nonatomic) NSMutableArray *imageArray;
//- (IBAction)btnStartAnimation:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *myColllection;

@end

