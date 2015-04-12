//
//  SecondViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MapaViewController.h"
#import "Mapbox.h"

#define kMapboxMapID @"examples.map-z2effxa8"

@interface MapaViewController ()

@end

@implementation MapaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RMMapboxSource *onlineSource = [[RMMapboxSource alloc] initWithMapID:kMapboxMapID];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:onlineSource];
    
    mapView.zoom = 2;
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:mapView];
}

@end

