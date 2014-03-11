//
//  Hand.m
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import "Hand.h"
#import "Card.h"

@implementation Hand

-(id) init{
    if (self = [super init]) {
        self.inHand = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return (self);
}

-(NSInteger) countHand {
    return ([self.inHand count]);
}

-(NSInteger) getPipValue{
    NSInteger pValue = 0;
    for (Card *aCard in self.inHand) {
        pValue = pValue + [aCard pipValue];
    }
    return pValue;
}

-(void) add:(Card *)card {
    [self.inHand addObject:card];
}


-(Card *) getCardAtIndex:(NSInteger)index{
    return ([self.inHand objectAtIndex:index]);
}



@end
