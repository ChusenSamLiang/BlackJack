//
//  ViewController.h
//  BlakcJack
//
//  Created by Sam Liang on 2/23/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "Deck.h"

@interface ViewController : UIViewController{


    int balance;//money remain
    int bet;//money to bet
    //BOOL win;
    int playerSum;
    int dealerSum;
    int counter;
    BOOL aceD;
    BOOL aceP;
    NSInteger ACE;
}
@property (nonatomic) Model *bj; //makes the global model
@property (nonatomic) Deck *deck; //make the global deck
@property (nonatomic) Card *card;
@end


