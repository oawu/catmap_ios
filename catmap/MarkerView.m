//
//  MarkerView.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "MarkerView.h"


@implementation MarkerView

@synthesize annotation, mapView;

+ (MarkerView *)initSingle:(RECluster *)anno mapView:(MKMapView *)mv {
    MarkerView *markView = [[[NSBundle mainBundle] loadNibNamed:@"SingleMarkerView" owner:nil options:nil] lastObject];
    
    if ([markView isKindOfClass:[MarkerView class]])
        return [markView initSingleUI:anno mapView:mv];
    else
        return nil;
}
+ (MarkerView *)initMulti:(RECluster *)anno mapView:(MKMapView *)mv {
    MarkerView *markView = [[[NSBundle mainBundle] loadNibNamed:@"MultiMarkerView" owner:nil options:nil] lastObject];
    
    if ([markView isKindOfClass:[MarkerView class]])
        return [markView initMultiUI:anno mapView:mv];
    else
        return nil;
}
- (void) initBaseData:(RECluster *)anno mapView:(MKMapView *)mv {
    [self setAnnotation:anno];
    [self setFrame:CGRectMake(0, 0, 0, 0)];
    [self setMapView:mv];
}
- (MarkerView *)initSingleUI:(RECluster *)anno mapView:(MKMapView *)mv {
    [self initBaseData:anno mapView:mv];
    
    CGFloat radius = 1.5f;
    NSDictionary *picture = ((REMarker *)[self.annotation.markers objectAtIndex:0]).userInfo;
    NSURL *w100Url = [NSURL URLWithString:[[picture objectForKey:@"name"] objectForKey:@"100w"]];
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:self.mainImageView];
    [self.mainImageView setImageURL:w100Url];
    
    if ([picture objectForKey:@"color"] != nil) {
        id color = [picture objectForKey:@"color"];
        [self.mainImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                               green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:0.85f]];
    }
    
    [self.mainImageView.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.mainImageView.layer setBorderWidth:8.0f / [UIScreen mainScreen].scale];
    [self.mainImageView setClipsToBounds:YES];
    [self.mainImageView.layer setCornerRadius:radius];
    [self.mainImageView setContentMode:UIViewContentModeScaleAspectFill];
    
    [self.bgView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.bgView.layer setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    [self.bgView.layer setShadowRadius:3.0f];
    [self.bgView.layer setShadowOpacity:0.5f];
    [self.bgView.layer setCornerRadius:radius];
    
    [self.bgView2 setHidden:YES];
    [self.bgView3 setHidden:YES];
    
    return self;
}
- (MarkerView *)initMultiUI:(RECluster *)anno mapView:(MKMapView *)mv {
    [self initBaseData:anno mapView:mv];
    
    
    CGFloat radius = 1.5f;
    NSDictionary *picture = ((REMarker *)[self.annotation.markers objectAtIndex:0]).userInfo;
    NSURL *w100Url = [NSURL URLWithString:[[picture objectForKey:@"name"] objectForKey:@"100w"]];
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:self.mainImageView];
    [self.mainImageView setImageURL:w100Url];
    if ([picture objectForKey:@"color"] != nil) {
        id color = [picture objectForKey:@"color"];
        [self.mainImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                               green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:0.85f]];
    }
    
    [self.mainImageView.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.mainImageView.layer setBorderWidth:8.0f / [UIScreen mainScreen].scale];
    [self.mainImageView setClipsToBounds:YES];
    [self.mainImageView.layer setCornerRadius:radius];
    [self.mainImageView setContentMode:UIViewContentModeScaleAspectFill];
    
    [self.bgView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.bgView.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    [self.bgView.layer setShadowRadius:2.0f];
    [self.bgView.layer setShadowOpacity:0.5f];
    [self.bgView.layer setCornerRadius:radius];
    
    //    [self.bgView2 setHidden:YES];
    [self.bgView2.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.bgView2.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    [self.bgView2.layer setShadowRadius:2.0f];
    [self.bgView2.layer setShadowOpacity:0.5f];
    [self.bgView2.layer setCornerRadius:radius];
    [self.bgView2 setTransform:CGAffineTransformMakeRotation(0.18)];
    
    //    [self.bgView3 setHidden:YES];
    [self.bgView3.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.bgView3.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    [self.bgView3.layer setShadowRadius:2.0f];
    [self.bgView3.layer setShadowOpacity:0.5f];
    [self.bgView3.layer setCornerRadius:radius];
    [self.bgView3 setTransform:CGAffineTransformMakeRotation(-0.17)];
    
    
    //    [self.countLabel setHidden:YES];
    [self.countLabel setBackgroundColor:[UIColor colorWithRed:0.09 green:0.68 blue:0.93 alpha:1]];
    [self.countLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    [self.countLabel.layer setBorderColor:[UIColor colorWithRed:0.08 green:0.49 blue:0.97 alpha:1].CGColor];
    [self.countLabel.layer setBorderWidth:2.0f / [UIScreen mainScreen].scale];
    [self.countLabel.layer setCornerRadius:13];
    [self.countLabel setClipsToBounds:YES];
    
    [self.countLabel setText:[NSString stringWithFormat:@"%lu", self.annotation.markers.count]];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePinButtonTap:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
    return self;
}
- (void) handlePinButtonTap:(UITapGestureRecognizer *)gestureRecognizer {
    CGFloat maxLat = 0, minLat = 0;
    CGFloat maxLng = 0, minLng = 0;
    
    for (REMarker *marker in self.annotation.markers) {
        CGFloat annotationLat = marker.coordinate.latitude;
        CGFloat annotationLong = marker.coordinate.longitude;
        
        if (minLat == 0 || minLat > annotationLat)
            minLat = annotationLat;
        if (maxLat == 0 || maxLat < annotationLat)
            maxLat = annotationLat;
        
        if (minLng == 0 || minLng > annotationLong)
            minLng = annotationLong;
        if (maxLng == 0 || maxLng < annotationLong)
            maxLng = annotationLong;
    }
    
    CGFloat latDelta = maxLat - minLat;
    CGFloat lngDelta = maxLng - minLng;
    
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake((maxLat + minLat) / 2, (maxLng + minLng) / 2), MKCoordinateSpanMake(latDelta + latDelta / 2, lngDelta + lngDelta / 2)) animated:YES];
}

@end
