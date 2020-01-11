//
//  ViewController.m
//  UIFlexViewObjCDemo
//
//  Created by Alex on 08/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "ViewController.h"
@import UIFlexView;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFlexView *flexView = [[UIFlexView alloc] init];
    [self.view addSubview:flexView];
    
    flexView.translatesAutoresizingMaskIntoConstraints = NO;
    flexView.backgroundColor = UIColor.yellowColor;
    flexView.flexDirection = UIFlexDirectionConfigRow;
    flexView.flexWrap = UIFlexWrapConfigWrap;
    
    [NSLayoutConstraint activateConstraints:@[
        [flexView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [flexView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [flexView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [flexView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];
}

@end
