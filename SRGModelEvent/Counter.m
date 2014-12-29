//
//  Counter.m
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/30.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "Counter.h"

@implementation Counter {
    SRGModelEvent *_event;
}

- (instancetype)init {
    if( self = [super init]){
        _event = [SRGModelEvent eventWithKey:@"counter"];
    }
    return self;
}

- (void)increment {
    _count++;
    [_event notify:@"change" data:@{ @"count": @(_count) }];
}

- (void)clear {
    _count = 0;
    [_event notify:@"change" data:@{ @"count": @(_count) }];
}

- (SRGModelEventObserver *)observeCountChange:(CounterWithCount)block {
    return [_event observe:@"change" handler:^(NSDictionary *data){
        block( [data[@"count"] integerValue] );
    }];
}

@end
