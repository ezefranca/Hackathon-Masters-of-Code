//
//  SecondViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MapaViewController.h"
#import "Mapbox.h"

#define kMapboxMapID @"juniormag2.ln5m5h9p"

@interface MapaViewController ()

@end

@implementation MapaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[RMConfiguration sharedInstance] setAccessToken:@"pk.eyJ1IjoianVzdGluIiwiYSI6IlpDbUJLSUEifQ.4mG8vhelFMju6HpIY-Hi5A"];
    
    RMMapboxSource *tileSource = [[RMMapboxSource alloc] initWithMapID:kMapboxMapID];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    
    // you will need to add a <RMMapViewDelegate> to the ViewController.h file
    mapView.delegate = self;
    
    [self.view addSubview:mapView];
    
    // build first marker and title
    RMAnnotation *annotation1 = [[RMAnnotation alloc]
                                 initWithMapView:mapView
                                 coordinate:CLLocationCoordinate2DMake(-23.5572, -46.6962)
                                 andTitle:@"Máquina de Chocolate"];
    
    annotation1.userInfo = @"training";
    
    [mapView addAnnotation:annotation1];
    
    // build second marker and title
    RMAnnotation *annotation2 = [[RMAnnotation alloc]
                                 initWithMapView:mapView
                                 coordinate:CLLocationCoordinate2DMake(-23.5571, -46.6961)
                                 andTitle:@"Máquina de Chocolate"];
    
    annotation2.userInfo = @"supplies";
    
    [mapView addAnnotation:annotation2];
    
    
    // set coordinates
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(-23.5570, -46.6960);
    
    // set zoom
    mapView.zoom = 14;
    
    // center the map to the coordinates
    mapView.centerCoordinate = center;
    
    // allows rotation
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMarker *marker;
    
    // set 'training' marker image
    if ([annotation.userInfo isEqualToString:@"training"])
    {
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"mapicon"]];
    }
    // set 'supplies' marker image
    else if ([annotation.userInfo isEqualToString:@"supplies"])
    {
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"mapicon"]];
    }
    
    marker.canShowCallout = YES;
    
    return marker;
}

@end

