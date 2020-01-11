//
//  UIFlexView.m
//  UIFlexView
//
//  Created by Alex on 07/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UIFlexView.h"
@import UIKit;

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
    // Default property values
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
            [self layoutSubviewsWrappingOverMultipleLines];
            break;
    }
}

-(void)layoutSubviewsOnSingleLine
{
    
}

-(void)layoutSubviewsWrappingOverMultipleLines
{
    NSMutableArray *remainingSubviews = [[self subviews] mutableCopy];
    
    UIView* previousView = nil;
    while ([remainingSubviews count] > 0) {
        UIView *nextView = remainingSubviews[0];
        [remainingSubviews removeObjectAtIndex:0];
        
        CGRect nextFrame = [self trailingFrameFor:nextView alongMainAxisFrom:previousView];

        if ([self maxPositionAlongMainAxisFromFrame:nextFrame] <= [self maxDimensionAlongMainAxis]) {
            nextView.frame = nextFrame;
        } else {
            CGRect nextFrame = [self trailingFrameFor:nextView alongCrossAxisFrom:previousView];
            nextView.frame = [self frame:nextFrame withUpdatedPositionAlongMainAxis:0];
        }
        
        previousView = nextView;
    }
}

#pragma mark - Framing and positioning utilities

-(CGRect)trailingFrameFor:(UIView *)view alongMainAxisFrom:(nullable UIView *)referenceView
{
    return [self trailingFrameFor:view from:referenceView direction:self.flexDirection];
}

-(CGRect)trailingFrameFor:(UIView *)view alongCrossAxisFrom:(nullable UIView *)referenceView
{
    return [self trailingFrameFor:view from:referenceView direction:UIFlexDirectionConfigFlip(self.flexDirection)];
}

-(CGRect)trailingFrameFor:(UIView *)view from:(nullable UIView *)referenceView direction:(UIFlexDirectionConfig)direction
{
    CGRect referenceViewFrame = [self viewFrameOrZero:referenceView];

    CGSize size = [view systemLayoutSizeFittingSize:self.bounds.size]; //view.intrinsicContentSize;
    CGRect frame = CGRectMake(0, 0, size.width, size.height);

    switch (direction) {
        case UIFlexDirectionConfigRow:
            frame.origin.x = CGRectGetMaxX(referenceViewFrame);
            frame.origin.y = CGRectGetMinY(referenceViewFrame);
            break;
            
        case UIFlexDirectionConfigColumn:
            frame.origin.x = CGRectGetMinX(referenceViewFrame);
            frame.origin.y = CGRectGetMaxY(referenceViewFrame);
            break;
    }
    
    return frame;
}

-(CGRect)viewFrameOrZero:(UIView * _Nullable)view
{
    return view == nil ? CGRectZero : view.frame;
}

-(CGFloat)maxPositionAlongMainAxisFromFrame:(CGRect)frame
{
    switch (self.flexDirection) {
        case UIFlexDirectionConfigRow:
            return CGRectGetMaxX(frame);
            
        case UIFlexDirectionConfigColumn:
            return CGRectGetMaxY(frame);
    }
}

-(CGFloat)maxDimensionAlongMainAxis
{
    switch (self.flexDirection) {
        case UIFlexDirectionConfigRow:
            return self.bounds.size.width;
            
        case UIFlexDirectionConfigColumn:
            return self.bounds.size.height;
    }
}

-(CGRect)frame:(CGRect)frame withUpdatedPositionAlongMainAxis:(CGFloat)position
{
    switch (self.flexDirection) {
        case UIFlexDirectionConfigRow:
            frame.origin.x = position;
            return frame;
            
        case UIFlexDirectionConfigColumn:
            frame.origin.y = position;
            return frame;
    }
}

@end
