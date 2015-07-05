//
//  MapViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "REMarkerClusterer.h"
#import "AFHTTPRequestOperationManager.h"
#import "MarkerView.h"
#import "AppDelegate.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, REMarkerClusterDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property REMarkerClusterer *clusterer;

@property BOOL isLoadPicture;

@end
