//
//  Produtos.h
//  HackathonMaster
//
//  Created by Ezequiel on 12/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMappedEntity.h"

@interface Produtos : NSObject <DSMappedEntity>

@property(strong, nonatomic) NSString *productID;
@property(strong, nonatomic) NSString *nome;
@property(strong, nonatomic) NSString *imagem;
@property(strong, nonatomic) NSString *preco;
@property(strong, nonatomic) NSString *quantidade;

@end
