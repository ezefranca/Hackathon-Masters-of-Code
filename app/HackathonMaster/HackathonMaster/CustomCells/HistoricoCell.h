//
//  HistoricoCell.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoricoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imagem;
@property (strong, nonatomic) IBOutlet UILabel *titulo;
@property (strong, nonatomic) IBOutlet UILabel *preco;
@property (strong, nonatomic) IBOutlet UILabel *quantidade;

@end
