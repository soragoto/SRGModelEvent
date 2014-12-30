//
//  SRGModelEvent.m
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/29.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "SRGModelEvent.h"

static const NSString *EventNamePrefix = @"SRGModelEvent";

@implementation SRGModelEvent

+ (instancetype)eventWithKey:(NSString *)key {
    return [[[self class] alloc] initWithKey:key];
}

- (instancetype)initWithKey:(NSString *)key {
    if( self = [super init]){
        _key = key;
    }
    return self;
}

- (SRGModelEventObserver *)observe:(NSString *)eventName handler:(void (^)(NSDictionary *))handler{
    [self p_assertKeyIsRequired];
    id observer = [[NSNotificationCenter defaultCenter]
                   addObserverForName: [self p_fullEventName:eventName]
                   object:self
                   queue:nil
                   usingBlock:^(NSNotification *note){
                       handler( note.userInfo );
                   }
    ];
    return [SRGModelEventObserver observerWithRaw:observer
                                        eventName:eventName];
}

- (void)notify:(NSString *)eventName data:(NSDictionary *)data {
    [self p_assertKeyIsRequired];
    NSNotification *notification = [ NSNotification
                                    notificationWithName: [self p_fullEventName:eventName]
                                    object:self
                                    userInfo:data
                                    ];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)notify:(NSString *)eventName {
    [self notify:eventName data: @{} ];
}

- (NSString *) p_fullEventName:(NSString *)eventName {
    return [@[ EventNamePrefix, _key, eventName ] componentsJoinedByString:@"."];
}

- (void) p_assertKeyIsRequired {
    NSAssert(_key != nil,@"key is required params");
}

@end
