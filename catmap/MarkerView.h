//
//  MarkerView.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
#import "REMarkerClusterer.h"

@interface MarkerView : UIView

@property (weak, nonatomic) IBOutlet AsyncImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UIView *bgView3;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property RECluster *annotation;
@property MKMapView *mapView;

+ (MarkerView *)initSingle:(RECluster *)anno mapView:(MKMapView *)mv;
+ (MarkerView *)initMulti:(RECluster *)anno mapView:(MKMapView *)mv;

@end
