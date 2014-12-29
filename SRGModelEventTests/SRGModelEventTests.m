//
//  SRGModelEventTests.m
//  SRGModelEventTests
//
//  Created by nori0620 on 2014/12/29.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SRGModelEvent.h"

@interface SRGModelEventTests : XCTestCase

@end

@implementation SRGModelEventTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSimpleObserving {
    
    SRGModelEvent *event = [SRGModelEvent eventWithKey:@"article"];
   
    __block NSInteger counterA = 0;
    [event observe:@"edit" handler:^(NSDictionary *data){
        counterA++;
    }];
    
    XCTAssertEqual(counterA, 0);
    
    [event notify:@"edit"];
    XCTAssertEqual(counterA, 1);
    
    [event notify:@"edit"];
    XCTAssertEqual(counterA, 2);
}

- (void)testMultiInstanceObserving {
    
    SRGModelEvent *eventA = [SRGModelEvent eventWithKey:@"article.A"];
    SRGModelEvent *eventB = [SRGModelEvent eventWithKey:@"article.B"];
    
    __block NSInteger counterA = 0;
    __block NSInteger counterB = 0;
    
    [eventA observe:@"edit" handler:^(NSDictionary *data){
        counterA++;
    }];
    [eventB observe:@"edit" handler:^(NSDictionary *data){
        counterB++;
    }];
    [eventB observe:@"edit" handler:^(NSDictionary *data){
        counterB++;
    }];
    
    XCTAssertEqual(counterA, 0);
    XCTAssertEqual(counterB, 0);
    
    [eventA notify:@"edit"];
    [eventB notify:@"edit"];
    XCTAssertEqual(counterA, 1);
    XCTAssertEqual(counterB, 2);
    
    [eventA notify:@"edit"];
    [eventB notify:@"edit"];
    XCTAssertEqual(counterA, 2);
    XCTAssertEqual(counterB, 4);
}

- (void)testMultiEventObserving {
    
    SRGModelEvent *event = [SRGModelEvent eventWithKey:@"article.A"];
    
    __block NSInteger editCount   = 0;
    __block NSInteger deleteCount = 0;
    
    [event observe:@"edit" handler:^(NSDictionary *data){
        editCount++;
    }];
    [event observe:@"delete" handler:^(NSDictionary *data){
        deleteCount++;
    }];
    
    XCTAssertEqual(editCount, 0);
    XCTAssertEqual(deleteCount, 0);
    
    [event notify:@"edit"];
    XCTAssertEqual(editCount, 1);
    XCTAssertEqual(deleteCount, 0);
    
    [event notify:@"edit"];
    [event notify:@"delete"];
    XCTAssertEqual(editCount, 2);
    XCTAssertEqual(deleteCount, 1);
}

- (void)testObserveWithEvent {
    SRGModelEvent *event = [SRGModelEvent eventWithKey:@"article"];
   
    __block NSInteger counterA = 0;
    [event observe:@"edit" handler:^(NSDictionary *data){
        XCTAssertEqualObjects(data[@"key"], @"val");
        counterA++;
    }];
    
    XCTAssertEqual(counterA, 0);
    
    [event notify:@"edit" data:@{
        @"key": @"val"
    }];
    XCTAssertEqual(counterA, 1);
    
}

- (void) testStopObserving {
    SRGModelEvent *event = [SRGModelEvent eventWithKey:@"article"];
   
    __block NSInteger counterA = 0;
    SRGModelEventObserver *observer = [event observe:@"edit" handler:^(NSDictionary *data){
        counterA++;
    }];
    
    XCTAssertEqual(counterA, 0);
    
    [event notify:@"edit"];
    XCTAssertEqual(counterA, 1);
    
    [observer stopObserving];
    [event notify:@"edit"];
    [event notify:@"edit"];
    
    XCTAssertEqual(counterA, 1);
    
}


@end
