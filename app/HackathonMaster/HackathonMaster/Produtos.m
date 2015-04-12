//
//  Produtos.m
//  HackathonMaster
//
//  Created by Ezequiel on 12/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "Produtos.h"

@implementation Produtos

+ (RKObjectMapping *) mappingForEntity {
    RKObjectMapping *postMapping = [RKObjectMapping mappingForClass:[Produtos class]];
    [postMapping addAttributeMappingsFromDictionary:@{
                                                      @"Id"  : @"productID",
                                                      @"Nome"  : @"nome",
                                                      @"Imagem"  : @"imagem",
                                                      @"Preco"  : @"preco",
                                                      @"Quantidade" : @"quantidade"
                                                      }];
    return postMapping;
}

@end