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
static Model* bjModel = nil;

-(id) init{
    if ((self = [super init])) {
        _deck = [[Deck alloc] init];
        _player = [[Hand alloc] init];
        _dealer = [[Hand alloc] init];
    }
    return (self);
}

+(Model *) getModel{
    if (bjModel == nil) {
        bjModel = [[Model alloc] init];
    }
    return bjModel;
}

-(void)dealerDraw{
    [_dealer add:[_deck draw]];
}
-(void)playerDraw{
    [_player add:[_deck draw]];
}

-(void) setup{
    //deal....draw... initial cards and setups of a game
    [self dealerDraw];
    [self playerDraw];
    [self playerDraw];
    
}

@end
