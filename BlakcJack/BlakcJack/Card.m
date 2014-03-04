//
//  Card.m
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize suit = aSuit, cardNumber = aCardNumber;

-(id) initCardNumber:(NSInteger) _cardNumber suit:(Suit) _suit{
    
    if( self = [super init]){
        
        aSuit = _suit;
        aCardNumber = _cardNumber;
    }
    
    return self;
}

-(NSInteger) pipValue {
    
    if (aCardNumber >= 10) {
        return (10);
    }
    else if (aCardNumber == 1){
        return (11);
    }
    else{
        return (aCardNumber);
    }
}

-(NSString *) getSuit{
    
    switch (aSuit) {
        case Spades:
            return @"Spades";
            break;
        case Hearts:
            return @"Hearts";
            break;
        case Clubs:
            return @"Clubs";
            break;
        case Diamonds:
            return @"Diamonds";
            break;
            
        default:
            return nil;
            break;
    }
}

-(NSString *) getNumber{
    
    switch (aCardNumber) {
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
            return [NSString stringWithFormat:@"%ld", (long)aCardNumber];
            break;
    }
}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@%@ (pipValue = %ld)", [self getSuit] , [self getNumber] , (long)[self pipValue]];
}


@end
