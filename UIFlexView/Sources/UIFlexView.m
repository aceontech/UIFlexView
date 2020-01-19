//
//  UIFlexView.m
//  UIFlexView
//
//  Created by Alex on 07/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UIFlexView.h"
#import <UIKit/UIKit.h>
#import <UFVWrapGroup.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFlexView ()
@end

NS_ASSUME_NONNULL_END

@implementation UIFlexView

- (void)setFlexWrap:(UIFlexWrapConfig)flexWrap
{
    _flexWrap = flexWrap;
    [self setNeedsLayout];
}

- (void)setFlexDirection:(UIFlexDirectionConfig)flexDirection
{
    _flexDirection = flexDirection;
    [self setNeedsLayout];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.flexWrap = UIFlexWrapConfigNoWrap;
    self.flexDirection = UIFlexDirectionConfigRow;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    switch (self.flexWrap) {
        case UIFlexWrapConfigNoWrap:
            [self layoutSubviewsOnSingleLine];
            break;
            
        case UIFlexWrapConfigWrap:
            [UFVWrapGroup layoutInFrame:self.frame items:self.subviews flexDirection:self.flexDirection];
            break;
    }
}

-(void)layoutSubviewsOnSingleLine
{
    // TODO
}

@end
