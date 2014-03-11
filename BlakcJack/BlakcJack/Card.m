//
//  Card.m
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize suit = _suit, cardNumber = _cardNumber;

-(id) initCardNumber:(NSInteger) cardNumber suit:(Suit) suit{
    
    if( self = [super init]){
        
        _suit = suit;
        _cardNumber = cardNumber;
    }
    
    return self;
}

-(NSString *) filename{
    return [NSString stringWithFormat:@"%@%02d.gif" , [self getSuit] , [self cardNumber] ];
}

-(NSInteger) pipValue {
    
    if (_cardNumber >= 10) {
        return (10);
    }
    else if (_cardNumber == 1){
        return (11);
    }
    else{
        return (_cardNumber);
    }
}

-(NSString *) getSuit{
    
    switch (_suit) {
        case Spades:
            return @"spade";
            break;
        case Hearts:
            return @"heart";
            break;
        case Clubs:
            return @"club";
            break;
        case Diamonds:
            return @"diamond";
            break;
            
        default:
            return nil;
            break;
    }
}

-(NSString *) getNumber{
    
    switch (_cardNumber) {
        case 1:
            return @"Ace";
            break;
        case 11:
            return @"Jack";
            break;
        case 12:
            return @"Queen";
            break;
        case 13:
            return @"King";
            break;
            
        default:
            return [NSString stringWithFormat:@"%ld", (long)_cardNumber];
            break;
    }
}



@end
