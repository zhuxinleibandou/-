//
//  ViewController.m
//  TestImage
//
//  Created by 朱信磊 on 16/7/18.
//  Copyright © 2016年 朱信磊. All rights reserved.
//

#import "ViewController.h"
#import "CusView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self dealImage];
    
//    [self test];
    [self.view setNeedsLayout];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
//    CusView *view =[[CusView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
//    [self.view addSubview:view];
//
    UIImage *img = [self maskImage:[UIImage imageNamed:@"test"] withMask:[UIImage imageNamed:@"mask3"]];
    [self.MyImage setImage:img];
    [self.MyImage setFrame:CGRectMake(self.MyImage.frame.origin.x, self.MyImage.frame.origin.y, img.size.width, img.size.height)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UIImage*)maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef sourceImage = [image CGImage];
    CGImageRef imageWithAlpha = sourceImage;
    //add alpha channel for images that don't have one (ie GIF, JPEG, etc...)
    //this however has a computational cost
    if (CGImageGetAlphaInfo(sourceImage) == kCGImageAlphaNone) {
//        imageWithAlpha =CopyImageAndAddAlphaChannel(sourceImage);
    }
    
    CGImageRef masked = CGImageCreateWithMask(imageWithAlpha, mask);

    CGImageRelease(mask);
    
        if (sourceImage != imageWithAlpha) {
            CGImageRelease(imageWithAlpha);
        }
    
    UIImage* retImage = [UIImage imageWithCGImage:masked];
    CGImageRelease(masked);
    
    return retImage;
}





@end
