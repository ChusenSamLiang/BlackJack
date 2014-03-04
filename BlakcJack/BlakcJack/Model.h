//
//  Model.h
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hand.h"
#import "Deck.h"

@interface Model : NSObject{
    Hand *player;
    Hand *dealer;
    Deck *deck;
}

@property Hand *player;
@property Hand *dealer;
@property Deck *deck;


-(void) setup;

@end
