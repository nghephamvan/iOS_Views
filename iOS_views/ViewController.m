//
//  ViewController.m
//  iOS_views
//
//  Created by TMA103 on 5/10/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "ViewController.h"
#import "ItemImageCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageArray, btnAnimation;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    imageArray = [NSMutableArray arrayWithArray:
  @[@"https://wallpaperscraft.com/image/stars_sky_shore_84534_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/street_city_night_cars_115485_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/horse_snow_muzzle_115406_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/matches_sticks_sulfur_115361_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/dog_grass_walk_sunlight_115372_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/flower_bud_petals_bush_115352_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/flowers_plant_buds_115339_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/cat_muzzle_fluffy_grass_lies_115323_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg",
    @"https://wallpaperscraft.com/image/rabbit_sitting_grass_cute_115215_2560x1440.jpg"]];
//    [UIView animateWithDuration:3.0 animations:^{
//        btnAnimation.alpha = 0.0;
//    }];
    
//    [UIView animateWithDuration:3.0 delay:5.0 options:UIViewAnimationOptionCurveLinear animations:^{ btnAnimation.alpha = 0.0; }
//        completion:^(BOOL finished) {
//            [UIView animateWithDuration:3.0 animations:^{
//                btnAnimation.alpha = 1.0;
//            }];
//        }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [imageArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ItemImageCell *collectionCell = (id)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    collectionCell.imageItem.image = nil;
    [collectionCell.indiacatorView setHidden:false];
    [collectionCell.indiacatorView startAnimating];
    
    NSString *imageString = [imageArray objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:imageString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil && data != nil) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [collectionCell.indiacatorView setHidden:true];
                collectionCell.imageItem.image = [UIImage imageWithData:data];
            }];
        }
    }] resume];
    return collectionCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(150.0, 100.0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(1, 1, 1, 1);
}
//- (IBAction)btnStartAnimation:(id)sender {
//    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{ btnAnimation.alpha = 0.0; }
//                     completion:^(BOOL finished) {
//                         [UIView animateWithDuration:3.0 animations:^{
//                             btnAnimation.alpha = 1.0;
//                         }];
//                     }];
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *t = [[event allTouches] anyObject];
//    CGPoint point = [t locationInView:t.view];
//    
//    
//    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        [btnAnimation setCenter:point];
//    } completion:nil];
//}
@end
