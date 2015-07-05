//
//  MyTabBar.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "MyTabBar.h"

@implementation MyTabBar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (UIImage *)addBorderToImage:(UIImage *)image {
    CGImageRef bgimage = [image CGImage];
    float width = CGImageGetWidth(bgimage);
    float height = CGImageGetHeight(bgimage);
    
    // Create a temporary texture data buffer
    void *data = malloc(width * height * 4);
    
    // Draw image to buffer
    CGContextRef ctx = CGBitmapContextCreate(data,
                                             width,
                                             height,
                                             8,
                                             width * 4,
                                             CGImageGetColorSpace(image.CGImage),
                                             (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(ctx, CGRectMake(0, 0, (CGFloat)width, (CGFloat)height), bgimage);
    
    //Set the stroke (pen) color
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    
    //Set the width of the pen mark
    //    CGFloat borderWidth = (float)width*0.05;
    //    CGContextSetLineWidth(ctx, borderWidth);
    //
    //    //Start at 0,0 and draw a square
    //    CGContextMoveToPoint(ctx, 0.0, 0.0);
    //    CGContextAddLineToPoint(ctx, 0.0, height);
    //    CGContextAddLineToPoint(ctx, width, height);
    //    CGContextAddLineToPoint(ctx, width, 0.0);
    //    CGContextAddLineToPoint(ctx, 0.0, 0.0);
    //
    ////    Draw it
    //    CGContextStrokePath(ctx);
    
    // write it to a new image
    CGImageRef cgimage = CGBitmapContextCreateImage(ctx);
    UIImage *newImage = [UIImage imageWithCGImage:cgimage];
    CFRelease(cgimage);
    CGContextRelease(ctx);
    
    // auto-released
    return newImage;
}
-(CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height = 50;
    return sizeThatFits;
}


- (UIImage *)xxx:(UIColor *)color {
    UIImage *transparentBackground;
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, self.layer.contentsScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, components[0], components[1], components[2], CGColorGetAlpha(color.CGColor));
    UIRectFill(CGRectMake(0, 0, 1, 1));
    transparentBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //    id tabBarAppearance = self;
    //
    //    [tabBarAppearance setBackgroundImage:transparentBackground forBarMetrics:UIBarMetricsDefault];
    return transparentBackground;
}


- (void)initUI {
    //    rgba(80, 55, 54, 1)[NSColor colorWithRed:0.94 green:0.65 blue:0.42 alpha:1]
    
    
    
    [self setBarTintColor:[UIColor colorWithRed:236.0/255.0 green:140.0/255.0 blue:113.0/255.0 alpha:1]];
    [self setAlpha:1.0f];
    
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"space.png"]];
    //    [self setBackgroundImage:[self xxx:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1]]];
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    //    [self.layer setShadowColor:[UIColor colorWithRed:1 green:0.95 blue:0.95 alpha:1].CGColor];
    //    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    //    [self.layer setShadowRadius:3.0f];
    //    [self.layer setShadowOpacity:0.3f];
    
    [self initItem];
    
}
- (void)initItem {
    //    ;
    
    for (int i = 0; i < [self.items count]; i++) {
        UITabBarItem * tabItem = [self.items objectAtIndex:i];
        [tabItem setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
        [tabItem setImage:[[UIImage imageNamed:[NSString stringWithFormat: @"TabBarItem_%02i", i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabItem setSelectedImage:[[UIImage imageNamed:[NSString stringWithFormat: @"TabBarItem_%02i_on", i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //        [tabItem se]
    }
}
@end
