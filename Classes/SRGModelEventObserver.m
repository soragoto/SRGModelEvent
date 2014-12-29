//
//  SRGModelEventObserver.m
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/30.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "SRGModelEventObserver.h"

@implementation SRGModelEventObserver {
    id _raw;
}

+ (instancetype)observerWithRaw:(id)raw
                      eventName:(NSString *)eventName
{
    return [[self alloc] initWithRaw:raw
                           eventName:eventName ];
}

- (instancetype)initWithRaw:(id)raw
                  eventName:(NSString *)eventName
{
    if( self = [super init]){
        _raw = raw;
    }
    return self;
}

- (void)stopObserving {
    if( _raw ){
        [[NSNotificationCenter defaultCenter] removeObserver:_raw];
        _raw = nil;
    }
}

@end
