//
//  Card.h
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    Spades, Hearts, Clubs, Diamonds
} Suit;

@interface Card : NSObject{
    
}

@property NSInteger cardNumber;

@property Suit suit;

-(id) initCardNumber:(NSInteger) _cardNumber suit:(Suit) _suit;

-(NSInteger) pipValue;

@end
