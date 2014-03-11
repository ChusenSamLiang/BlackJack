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
#import "Hand.h"
#import "Card.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *money_in;
@property (weak, nonatomic) IBOutlet UILabel *currentBalance;
@property (weak, nonatomic) IBOutlet UITextView *dealerH;
@property (weak, nonatomic) IBOutlet UITextView *playerH;
@property (weak, nonatomic) IBOutlet UITextField *doom;
@property (weak, nonatomic) IBOutlet UITextField *win;
@property (weak, nonatomic) IBOutlet UITextField *lose;
@property (weak, nonatomic) IBOutlet UITextField *tied;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *splitButton;
@property (weak, nonatomic) IBOutlet UIButton *doubleButton;
@property (weak, nonatomic) IBOutlet UIButton *hitButton;
@property (weak, nonatomic) IBOutlet UIButton *standButton;

@end

@implementation ViewController

- (IBAction)play:(id)sender {
    
    //sets the total for the player and dealer everytime they play
    dealerSum = 0;
    playerSum = 0;
    //set the ace flag as false
    aceP = false;
    aceD = false;
    //clear out the cards from the previous hand
    [_bj.player.inHand removeAllObjects];
    [_bj.dealer.inHand removeAllObjects];
    
    //removing the previous subviews
    //the images of the old cards
    for (int i = 0 ; i < [[self.view subviews] count]; i++) {
        for (UIView *subview in [self.view subviews]) {
            if (subview.tag == 1 || subview.tag == 2) {
                [subview removeFromSuperview];
            }
        }
    }
    
    //shuffle the deck
    if (counter > 2) {
        [_bj.deck shuffle];
        counter = 0;
    }
    counter++;
    
    //setup the deck
    [_bj setup];
    [self showDealer:_bj.dealer];
    [self showPlayer:_bj.player];
    //hide all the labels for
    //lose
    //win
    //tied
    //doom
    self.doom.hidden = YES;
    self.win.hidden = YES;
    self.lose.hidden = YES;
    self.tied.hidden = YES;
    
    self.playButton.enabled = NO;
    
    
    
    //int card1 = [[_bj.player.inHand objectAtIndex:0] pipValue];
    //int card2 = [[_bj.player.inHand objectAtIndex:1] pipValue];
    if ([[_bj.player.inHand objectAtIndex:0] pipValue] == [[_bj.player.inHand objectAtIndex:1] pipValue]) {
        self.splitButton.enabled = YES;
    }
    
}

- (IBAction)split:(id)sender {
    //make a split...LOL
    
    
}

- (IBAction)double:(id)sender {
    //doubles the current bet
    if(balance > bet){
        balance -= bet;
        bet *=2;
        self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance ];
        self.money_in.text = [NSString stringWithFormat:@"%d.00" , bet ];
    }
    
}


- (IBAction)hit:(id)sender {
    
    //UIButton *button = (UIButton *) sender;
    
    //int sum = 0 ;
    
    //draw a card
    //then show the hand
    [_bj playerDraw];
    [self showPlayer:_bj.player];
    
    for (int i = 0; i< [_bj.player.inHand count] ; ++i) {
        playerSum += [[_bj.player.inHand objectAtIndex:i] pipValue];
        if ([[_bj.player.inHand objectAtIndex:i] pipValue] == ACE) {
            aceP = true; //check if theres an ace
        }
    }
    //if theres an ace, check for the conditions where the ace will have a pipvalue of 1 or 11
    if (aceP == true) {
        if ((playerSum-11) > 11) {
            playerSum = playerSum - 10;
        }
    }
    
    //if sum is past 21
    if (playerSum > 21) {
        //NSLog(@"DOOOOM");
        //disable everything
        //calculate the money
        //[_bj.player.inHand removeAllObjects];
        //[_bj.dealer.inHand removeAllObjects];
        //button.enabled = NO;
        bet = 0;
        self.money_in.text = [NSString stringWithFormat:@"0.00"];
        //[self showPlayer:_bj.player];
        
        //self.playerH.text = @"DOOOOOOM";
        self.doom.hidden = NO;

    }
    //if sum is 21
    else if (playerSum == 21){
        balance += 2*bet;
        bet = 0;
        self.money_in.text = [NSString stringWithFormat:@"0.00"];
        self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
        self.win.hidden = NO;
    }
}

- (IBAction)stand:(id)sender {
    
    //get player points
    playerSum = 0;
    for (int i = 0; i< [_bj.player.inHand count] ; ++i) {
        playerSum += [[_bj.player.inHand objectAtIndex:i] pipValue];
        if ([[_bj.player.inHand objectAtIndex:i] pipValue] == ACE) {
            aceP = true;
        }
    }
    
    if (aceP == true) {
        if ((playerSum-11) > 11) {
            playerSum = playerSum -10;
        }
    }
    
    //dealer gets another card
    [_bj dealerDraw];
    
    //check to see if who won
    for (int i = 0; i< [_bj.dealer.inHand count] ; ++i) {
        dealerSum += [[_bj.dealer.inHand objectAtIndex:i] pipValue];
        if ([[_bj.dealer.inHand objectAtIndex:i] pipValue] == ACE) {
            aceD = true; //gets the flag for an ace
        }
    }
    //check if theres an ace
    //whether the pipvalue is 1 or 11 for the ace
    if (aceD == true) {
        if ((dealerSum-11) > 11) {
            dealerSum = dealerSum - 10;
        }
    }
    
    
    if (dealerSum > 21) {
        self.win.hidden = NO;
        balance += 2*bet;
        bet = 0;
        self.money_in.text = [NSString stringWithFormat:@"0.00"];
        self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
    }
    else if (dealerSum == 21){
        self.lose.hidden = NO;
        bet = 0;
        self.money_in.text = [NSString stringWithFormat:@"0.00"];
    }
    else if (dealerSum >= 16){
        if (dealerSum > playerSum){
            self.lose.hidden = NO;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
        }
        else if (playerSum > dealerSum){
            self.win.hidden = NO;
            balance += 2*bet;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
            self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
        }

    }
    else if (playerSum == dealerSum){
        balance += bet;
        bet = 0;
        self.money_in.text = [NSString stringWithFormat:@"0.00"];
        self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
        self.tied.hidden = NO;
    }
    
    //less than 16
    //draw another card
    //see if that works
    else if (dealerSum < 16) {
        while (dealerSum < 16) {
            dealerSum = 0;
            [_bj dealerDraw];
            for (int i = 0; i< [_bj.dealer.inHand count] ; ++i) {
                dealerSum += [[_bj.dealer.inHand objectAtIndex:i] pipValue];
            }
        }
        
        if (aceD == true) {
            if ((dealerSum-11) > 11) {
                dealerSum-=10;
            }
        }
        
        //removing the previous subviews for the dealer.
        for (int i = 0 ; i < [[self.view subviews] count]; i++) {
            for (UIView *subview in [self.view subviews]) {
                if (subview.tag == 2) {
                    [subview removeFromSuperview];
                }
            }
        }
        //NSLog(@"dealer%d", dealerSum);
        //NSLog(@"player%d", playerSum);
        
        if (dealerSum > 21) {
            self.win.hidden = NO;
            balance += 2*bet;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
            self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
        }
        else if (dealerSum == 21){
            self.lose.hidden = NO;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
        }
        else if (dealerSum > playerSum){
            self.lose.hidden = NO;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
        }
        else if (playerSum > dealerSum){
            self.win.hidden = NO;
            balance += 2*bet;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
            self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
        }
        else if(playerSum == dealerSum){
            balance += bet;
            bet = 0;
            self.money_in.text = [NSString stringWithFormat:@"0.00"];
            self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
            self.tied.hidden = NO;
        }
    }
    [self showDealer:_bj.dealer];
    //NSLog(@"%d", dealerSum);
    //NSLog(@"%d", playerSum);
    
}


//for the downcounter of the money
- (IBAction)subtract:(id)sender {
    if (bet == 0) {}
    else{balance+=5;bet-=5;}
    self.money_in.text = [NSString stringWithFormat:@"%d.00" , bet ];
    self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
    if (bet > 0) {
        self.playButton.enabled = YES;
    }
}
//for the upcounter of the money
- (IBAction)add:(id)sender {
    if (balance == 0) {}
    else{balance-=5;bet+=5;}
    self.money_in.text = [NSString stringWithFormat:@"%d.00" , bet ];
    self.currentBalance.text = [NSString stringWithFormat:@"%d.00" , balance];
    if (bet > 0) {
        self.playButton.enabled = YES;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _bj = [[Model alloc] init];
    //[_bj setup];
    //[self show:_bj.dealer];
    //[self showDealer:_bj.dealer];
    //[self showPlayer:_bj.player];
    
    balance = 100;
    bet = 0;
    //win = false;
    playerSum = 0;
    dealerSum = 0;
    counter = 0;
    aceP = false;
    aceD = false;
    ACE = 11;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//create an imageview of the cards
//getting the image file names
-(void) show:(Hand *)hand atYPos:(NSInteger) yPos;{
    //int ypos = 80;
    for (int i = 0 ; i < [hand countHand]; ++i) {
        Card *card = [hand getCardAtIndex:i];
        UIImage *cardImage = [UIImage imageNamed:[card filename]];
        //UIImage *cardImage = [UIImage imageNamed:@"8heart.gif"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:cardImage];
        CGRect arect = CGRectMake((i*40)+20, yPos, 71, 96);
        imageView.frame = arect;
        if (yPos == 76) {
            imageView.tag = 2;
            //for the dealer only
        }
        else {
            imageView.tag = 1;
            //for the player
        }
        [self.view addSubview:imageView];
    }
}

//shows dealers current hand
-(void)showDealer:(Hand *)hand{
    [self show:hand atYPos:76];
}
//shows players current hand
-(void)showPlayer:(Hand *)hand{
    [self show:hand atYPos:345];
}



@end
