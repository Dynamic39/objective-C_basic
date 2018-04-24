//
//  ViewController.h
//  SDImageSample
//
//  Created by Samuel K on 2018. 4. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImageManager.h>
#import <SDImageCache.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *SDImageview;
@property (weak, nonatomic) IBOutlet UIImageView *sdsampleImageview;

- (IBAction)saveImageBtn:(id)sender;

//SDImage manager 관련,
@property (nonatomic, nonnull, readonly) SDImageCacheConfig *config;
@property (assign, nonatomic) NSUInteger maxMemoryCost;
@property (assign, nonatomic) NSUInteger maxMemoryCountLimit;




@end

