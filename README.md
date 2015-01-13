SRGModelEvent
=============

[![CI Status](http://img.shields.io/travis/soragoto/SRGModelEvent.svg?style=flat)](https://travis-ci.org/soragoto/SRGModelEvent)
[![Version](https://img.shields.io/cocoapods/v/SRGModelEvent.svg?style=flat)](https://github.com/soragoto/SRGModelEvent)
[![License](https://img.shields.io/cocoapods/l/SRGModelEvent.svg?style=flat)](https://github.com/soragoto/SRGModelEvent)
[![Platform](https://img.shields.io/cocoapods/p/SRGModelEvent.svg?style=flat)](https://github.com/soragoto/SRGModelEvent)


SRGModelEvent is thin wrapper library of NSNotification to observe/notify your model more easily.

## Installation

Add the following line to your podfile and run `pod update`.

```ruby
pod 'SRGModelEvent'
````

## Usage

At first you need to include header file.
```objc
#import "SRGEventDateRecorder.h"
```

Simple usage for SRGModelEvent.

```objc
// Create isntance for manage event for "User Model".
SRGModelEvent *userEvent = [SRGModelEvent eventWithKey:@"user"];

// You can observe event with event-name as string value. ( ex. "login" )
SRGModelEventObserver *loginObserver = [userEvent observe:@"login" handler:^(NSDictionary *data){
    // This blocks run when event is notified.
});

// You can notify in your model.
[userEvent notify:@"login"];

// You can stopObserving if needed.
[loginObserver stopObserving];
```

And you can observe/notify event with custom data.

```objc
// You can notify event with data.
[userEvent notify:@"login" data:@{
    @"login_date" : [NSDate date]
}];

// You can observe event with data.
[userEvent observe:@"login" handler:^(NSDictionary *data){
    NSDate *loginDate = data[@"login_date"];
    // do something
}];
````
## LICENSE

SRGModelEvent is released under the MIT license. See LICENSE for details.
