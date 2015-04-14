//
//  FirstViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MachineCell.h"
#import "bluekitBle.h"
#import <CoreBluetooth/CBPeripheral.h>

@interface MachineViewController : UIViewController <blueKitBLEDelegate,UITableViewDelegate, UITableViewDataSource>
{
    bluekitBle *t;
    Boolean isConnect;
}
@property (strong, nonatomic) NSArray *list;
@property (weak, nonatomic) IBOutlet UITableView *gDevView;
- (IBAction)doSearchDev:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;
@property (weak, nonatomic) IBOutlet CBPeripheral *gSelectDev;
@end

