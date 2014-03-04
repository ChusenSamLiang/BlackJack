//
//  Hand.h
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Hand : NSObject{
    
}

@property NSMutableArray *inHand;

-(void) add:(Card *) card;
-(NSInteger) getPipValue;
-(NSInteger) countHand;

@end
