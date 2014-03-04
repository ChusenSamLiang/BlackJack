//
//  Model.m
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "Model.h"


@implementation Model


@synthesize player = _player;
@synthesize dealer = _dealer;
@synthesize deck = _deck;

-(id) init{
    if ((self = [super init])) {
        _deck = [[Deck alloc] init];
        _player = [[Hand alloc] init];
        _dealer = [[Hand alloc] init];
    }
    return (self);
}

-(void) setup{
    
    //deal....draw... initial cards and setups of a game
    [_player add:[_deck draw]];
    [_dealer add:[_deck draw]];
    [_player add:[_deck draw]];
    [_dealer add:[_deck draw]];
    
   // NSLog([NSString stringWithFormat:@"Player:%@", _player.description]);
   // NSLog([NSString stringWithFormat:@"Dealer:%@", _dealer.description]);

    
}

@end
