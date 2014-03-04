//
//  Deck.h
//  BlakcJack
//
//  Created by Sam Liang on 3/3/14.
//  Copyright (c) 2014 Sam Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject{
    
    NSMutableArray * cards;
    
}

-(Card *) draw;
-(void) shuffle;

@end
