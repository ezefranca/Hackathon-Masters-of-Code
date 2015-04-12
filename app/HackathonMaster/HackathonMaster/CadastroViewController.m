//
//  CadastroViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "CadastroViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cartao = [[NSDictionary alloc]init];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanCard:(id)sender {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    //Colocar logo do Master Card no lugar
     scanViewController.hideCardIOLogo = TRUE;
    [self presentViewController:scanViewController animated:YES completion:nil];
}

- (IBAction)cadastrar:(id)sender {
    NSDictionary *cadastro = [[NSDictionary alloc]init];
    cadastro = @{@"UserName" : _username.text, @"Password" : _password.text, @"DadosCartao" : cartao};
    NSLog(@"%@", cadastro);
    [MCRequesterLogin.new signInWithSucessBlock:cadastro successBlock:^{
        [self login];
    } errorBlock:^(NSError *error) {
        NSLog(@"Erro ao cadastrar %@", error);
    }];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"User canceled payment info");
    // Handle user cancellation here...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    // The full card number is available as info.cardNumber, but don't log that!
    NSLog(@"Received card info. Number: %@, expiry: %02i/%i, cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv);
    
    NSString *numero = [NSString stringWithFormat:@"%@",  info.cardNumber];
    NSString *ano = [NSString stringWithFormat:@"%li",  (unsigned long)info.expiryYear];
    NSString *mes = [NSString stringWithFormat:@"%li",  (unsigned long)info.expiryMonth];
    NSString *cvc = [NSString stringWithFormat:@"%@",  info.cvv];
    
    
    cartao = @{@"Numero" : numero,
                             @"Ano" : ano,
                             @"Mes" : mes,
                             @"Cvc" : cvc};
    
    // Use the card info...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    
    self.parteUm.hidden = TRUE;
    self.scanImage.hidden = TRUE;
    self.scanButton.hidden = TRUE;
    self.parteDois.hidden = FALSE;
}

- (void)login{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"principal"];
    [self presentViewController:view animated:YES completion:^(){ NSLog(@"Logou");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
