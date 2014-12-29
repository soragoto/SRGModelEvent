//
//  SRGModelEvent.h
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/29.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRGModelEventObserver.h"

@interface SRGModelEvent : NSObject

@property (readonly) NSString *key;

+ (instancetype)eventWithKey:(NSString *)key;
- (void)notify:(NSString *)eventName;
- (void)notify:(NSString *)eventName data:(NSDictionary *)data ;
- (SRGModelEventObserver *) observe:(NSString *)eventName handler:(void (^)(NSDictionary *))block ;

@end
