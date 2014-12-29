//
//  Counter.h
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/30.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRGModelEvent.h"

@interface Counter : NSObject

typedef void (^CounterWithCount)(NSInteger count);

@property (readonly) NSInteger count;

- (void) clear;
- (void) increment;
- (SRGModelEventObserver *) observeCountChange:(CounterWithCount)block;

@end
