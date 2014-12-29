//
//  SRGModelEventObserver.h
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/30.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRGModelEventObserver : NSObject

@property (readonly) NSString *eventName;

+ (instancetype) observerWithRaw:(id)raw eventName:(NSString *)eventName;
- (void) stopObserving;

@end
