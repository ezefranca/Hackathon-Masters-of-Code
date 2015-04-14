//
//  CompraViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 12/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CBPeripheral.h>
#import "bluekitBle.h"
#import "MCRequesterInvoice.h"

@interface CompraViewController : UIViewController<UITextFieldDelegate,blueKitBLEDelegate>
{
    bluekitBle *t;
    Boolean isConnect;
    NSMutableString *gRecvTxtStr;
}
@property (weak, nonatomic) IBOutlet UITextField *gSendTxt;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gTxMethord;
@property (strong, nonatomic) NSString *UUID;
@property (strong, nonatomic) CBPeripheral *gConDev;

- (IBAction)doSelectMethord:(id)sender;

@property (weak, nonatomic) IBOutlet UINavigationItem *gNavigationBar;
@property (weak, nonatomic) IBOutlet UITextView *gRecvTxt;

- (IBAction)doSend:(id)sender;
- (IBAction)doClean:(id)sender;
- (IBAction)doDisconnect:(id)sender;

@end

