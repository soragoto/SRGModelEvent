//
//  ViewController.m
//  SRGModelEvent
//
//  Created by nori0620 on 2014/12/29.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "ViewController.h"
#import "Counter.h"

@interface ViewController ()

@property IBOutlet UILabel *countLabel;
@property Counter *counter;
@property SRGModelEventObserver *observer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = [Counter new];
    [self p_updateCountLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    __weak typeof(self) wSelf = self;
    _observer = [self.counter observeCountChange:^(NSInteger count){
        [wSelf p_updateCountLabel];
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [_observer stopObserving];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)didTapCountUp:(id)sender {
    [self.counter increment];
}

- (IBAction)didTapCountClear:(id)sender {
    [self.counter clear];
}

- (void) p_updateCountLabel {
    self.countLabel.text = [NSString stringWithFormat:@"Count:%ld",self.counter.count];
}



@end
