//
//  HistoricoViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MCRequesterInvoice.h"
#import "Invoice.h"
#import "HistoricoCell.h"

@interface HistoricoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
  
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)   NSMutableArray* postagem;
@end
