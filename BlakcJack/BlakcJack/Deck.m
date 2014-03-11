//
//  Deck.m
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@implementation Deck

-(id) init {
    
    if (self = [super init]) {
        cards = [[NSMutableArray alloc] init];
        for (int suit = 0; suit <= 3; suit++) {
            for (int cardNum = 1 ; cardNum <= 13; cardNum++) {
                [cards addObject:[[Card alloc] initCardNumber:cardNum suit:suit]];
            }
        }
    }
    
    [self shuffle];
    
    return self;
}

-(Card *) draw{
    
    if([cards count] > 0) {
        Card* get = [cards lastObject];
        [cards removeLastObject];
        return get;
    }
    return nil;
}

-(void) shuffle{
    
    NSUInteger count = [cards count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSUInteger rnd = count - i;
        NSUInteger n = (arc4random() % rnd) + 1;
        [cards exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}



@end
