//
//  FirstViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MachineViewController.h"
#import "MCRequesterLogin.h"
#import "LoginUser.h"

@interface MachineViewController ()

@end

@implementation MachineViewController

@synthesize list = _list;
@synthesize gDevView;
@synthesize myIndicator;
@synthesize gSelectDev;

#define SearchTimeOut 1

- (void)viewDidLoad
{
    [super viewDidLoad];
    t = [bluekitBle getSharedInstance];
    [t controlSetup:1];
    t.delegate = self;
    myIndicator.hidden = YES;
    isConnect = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if(t.peripherals!=nil)
    {
        return [t.peripherals count];
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"MachineCell";
    
    MachineCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MachineCell" owner:nil options:nil] firstObject];
    }
    
    NSUInteger row = [indexPath row];
    
    CBPeripheral *p = [t.peripherals objectAtIndex:row];
    
    cell.textLabel.text = p.name;
    
    CFStringRef sKey = CFUUIDCreateString(NULL, p.UUID);
    NSString  *changeUUIDToStr = [[NSString  alloc]initWithCString:CFStringGetCStringPtr(sKey, 0)
                                                          encoding:NSUTF8StringEncoding];
    cell.titulo.text = changeUUIDToStr;
    if ([changeUUIDToStr isEqual:@"ZBModule"]) {
        cell.titulo.text = @"Máquina de Chocolate";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    gSelectDev = [t.peripherals objectAtIndex:[indexPath row]];
    [self performSegueWithIdentifier:@"TXRX" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


- (IBAction)doSearchDev:(id)sender
{
    [myIndicator startAnimating];
    myIndicator.hidden = NO;
    [self DoSearch];
}

-(void)bluekitDisconnect
{
    NSLog(@"bluekitDisconnect");
}

-(void) RxValueUpdate:(Byte *)buf
{
    if (t.activePeripheral != nil)
    {
        NSLog(@"connect!");
    }
}

-(void) deviceFoundUpdate:(CBPeripheral *)p
{
    printf("Do device Found Update");
}

-(void) disconnectBle
{
    [t cancelConnectPeripheral];
}

-(void) DoSearch
{
    t.peripherals = nil;
    
    [gDevView reloadData];
    
    if (t.activePeripheral)
    {
        [t cancelConnectPeripheral];
        t.peripherals = nil;
    }
    [t findBLEPeripherals:SearchTimeOut];
    [NSTimer scheduledTimerWithTimeInterval:(float)SearchTimeOut target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
}

-(void) connectionTimer:(NSTimer *)timer
{
    [myIndicator stopAnimating];
    myIndicator.hidden = YES;
    [gDevView reloadData];
}

-(void)ShowMessage:(NSString *) title msg:(NSString *) message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Cancel", nil];
    [alert show];
}

-(void)doStopIndicator{
    
    [myIndicator stopAnimating];
    myIndicator.hidden = YES;
    
    if(t.activePeripheral !=nil)
    {
        NSLog(@"Connected!");
    }
    else
    {
        NSLog(@"Disconnect");
    }
    
    
}

- (IBAction)doDeviceConnect:(id)sender {
    
    t = [bluekitBle getSharedInstance];
    if(t.activePeripheral)
    {
        [t controlSetup:1];
        t.delegate = self;
        [t cancelConnectPeripheral];
    }
    else
    {
        [self DoSearch];
        // myIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        myIndicator.hidden = NO;
        [myIndicator startAnimating];
        [self performSelector:@selector(doStopIndicator) withObject:nil afterDelay:5.0];
        
    }
}

-(void) updateRssiValue:(int)rssi
{
    
}
-(void) blueConnect
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"TXRX"])
    {
        if(gSelectDev!=nil)
        {
            id theSegue=segue.destinationViewController;
            [theSegue setValue:gSelectDev forKey:@"gConDev"];
        }
    }
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark DELEGATE TABLE VIEW
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;    //count of section
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 2;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellID = @"MachineCell";
//    MachineCell *cell = (MachineCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
//    
////    if((indexPath.row < [_postagem count])){
////        
////        NutriPost *post = [_postagem objectAtIndex:indexPath.row];
////        NSString *img = post.imagemusuario;
////        NSString *imgURL = [img stringByReplacingOccurrencesOfString:@" " withString:@""];
////        [cell.profileImage sd_setImageWithURL:[NSURL URLWithString:imgURL]
////                             placeholderImage:[UIImage imageNamed:@"avatar"]
////                                      options:SDWebImageRetryFailed];
////        
////        if (!isVip){
////            cell.destaqueLabel.hidden = TRUE;
////            cell.estrela.hidden = TRUE;
////        }
////        //NSlog(@"%@", post.titulo);
////        if(post.mensagem.length > 2){
////            post.mensagem = [post.mensagem lowercaseString];
////            cell.postTitle.text = [NSString stringWithFormat:@"%@%@",[[post.mensagem substringToIndex:1] uppercaseString],[post.mensagem substringFromIndex:1]];
////        }else{
////            cell.postTitle.text = @"...";
////        }
////        cell.nomeAutor.text = [post.nome capitalizedString];
////        cell.nutriCRN.text = post.crn;
////        cell.postMessage.text = @"";
////        cell.destaqueLabel.text = @"";
////        if (!post.destaque) {
////            
////            cell.postMessage.text = post.mensagem;
////        }else{
////            cell.estrela.hidden = FALSE;
////            cell.destaqueLabel.text = post.titulodestaque;
////        }
////        //Deixar imagem redonda
////        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2;
////        cell.profileImage.clipsToBounds = YES;
////        //cell.profileImage.layer.masksToBounds = NO;
////    }else if((indexPath.row == [_postagem count]) && (requester == FALSE)){
////        requester = TRUE;
////        //NSlog(@"%ld---%lu", (long)indexPath.row, (unsigned long)_postagem.count);
////        int pagina = (([_postagem count]) / 6) + 1;
////        if(pagina == paginaAnterior) pagina += 1;
////        [DSComunidadeRequester.new getCommunityNutriPostsWithSuccessBlock:^(NSArray *results) {
////            [self.postagem addObjectsFromArray:results];
////            self.view.alpha = 1;
////            // //NSlog(@"%lu", (unsigned long)[_postagem count]);
////            reloadData = FALSE;
////            requester = FALSE;
////            [self.freeUserView.tableview reloadData];
////            [self performSelector: @selector(reloadView) withObject:self afterDelay: 0.1];
////        } errorBlock:^(NSError *error) {
////            UIAlertView * errorAlert = [[UIAlertView alloc]initWithTitle:@"Dieta e Saúde :("
////                                                                 message:@"Houve um erro ao carregar as postagens, por favor verifique sua internet e tente novamente"
////                                                                delegate:nil
////                                                       cancelButtonTitle:@"OK"
////                                                       otherButtonTitles:nil];
////            [errorAlert show];
////            self.view.alpha = 1;
////        } :pagina:isVip];
////    }
//    if(!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"MachineCell" owner:nil options:nil] firstObject];
//        cell.selectionStyle = UITableViewCellSeparatorStyleSingleLine;
//        //cell.accessoryView = tableViewAcessory;
//        
//    }
//    
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 142;
//}




@end
