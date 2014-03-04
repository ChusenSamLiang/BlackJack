//
//  ViewController.m
//  BlakcJack
//
//  Created by Sam Liang on 2/23/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *money_in;
@property (weak, nonatomic) IBOutlet UILabel *currentBalance;
@property (weak, nonatomic) IBOutlet UITextView *dealerH;
@property (weak, nonatomic) IBOutlet UITextView *playerH;

@end

@implementation ViewController
- (IBAction)play:(id)sender {
    
    //self.player.text = @"testing";
    Model *bj = [[Model alloc] init];
    [bj setup];
    
    NSString *one  = bj.dealer.description;
    one = [one stringByReplacingOccurrencesOfString:@"(" withString:@""];
    one = [one stringByReplacingOccurrencesOfString:@")" withString:@""];
    one = [one stringByReplacingOccurrencesOfString:@"," withString:@""];
    self.dealerH.text = one;
    
    NSString *two  = bj.player.description;
    two = [two stringByReplacingOccurrencesOfString:@"(" withString:@""];
    two = [two stringByReplacingOccurrencesOfString:@")" withString:@""];
    two = [two stringByReplacingOccurrencesOfString:@"," withString:@""];
    self.playerH.text = two;
    
}

- (IBAction)split:(id)sender {
    
}

- (IBAction)double:(id)sender {
}


- (IBAction)hit:(id)sender {
    
    
}

- (IBAction)stand:(id)sender {
    
    
}


//for the downcounter
- (IBAction)subtract:(id)sender {
    if (bet == 0) {}
    else{balance++;bet--;}
    self.money_in.text = [NSString stringWithFormat:@"%d.00" , bet ];
    self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
}
//for the upcounter
- (IBAction)add:(id)sender {
    if (balance == 0) {}
    else{balance--;bet++;}
    self.money_in.text = [NSString stringWithFormat:@"%d.00" , bet ];
    self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //initialize the deck
    //Deck *_deck = [[Deck alloc] init];
    //NSLog( @"%@",[_deck description]);
    //Model *bj = [[Model alloc] init];
    //[bj setup];
    
    balance = 100;
    bet = 0;
    win = false;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
