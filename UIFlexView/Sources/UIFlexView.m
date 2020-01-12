//
//  UIFlexView.m
//  UIFlexView
//
//  Created by Alex on 07/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UIFlexView.h"
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIFlexView ()
@property (nonatomic, assign) CGFloat maxPositionAlongCrossAxis;
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
    [self reset];
}

-(void)reset
{
    self.maxPositionAlongCrossAxis = 0;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self reset];
    
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
    // TODO
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
    UIFlexDirectionConfig direction = UIFlexDirectionConfigFlip(self.flexDirection);
    CGRect frame = [self trailingFrameFor:view from:referenceView direction:direction];
    
    if ([self maxPositionAlongCrossAxisFromFrame:frame] < self.maxPositionAlongCrossAxis) {
        frame = [self frame:frame withUpdatedPositionAlongCrossAxis:self.maxPositionAlongCrossAxis];
    } else {
        [self persistMaxPositionInFrame:frame alongDirection:direction];
    }
    return frame;
}

-(CGRect)trailingFrameFor:(UIView *)view from:(nullable UIView *)referenceView direction:(UIFlexDirectionConfig)direction
{
    CGRect referenceViewFrame = [self viewFrameOrZero:referenceView];

    CGSize size = [view systemLayoutSizeFittingSize:self.bounds.size];
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

-(void)persistMaxPositionInFrame:(CGRect)frame alongDirection:(UIFlexDirectionConfig)direction
{
    switch (direction) {
        case UIFlexDirectionConfigRow:
            self.maxPositionAlongCrossAxis = CGRectGetMaxX(frame);
            break;
            
        case UIFlexDirectionConfigColumn:
            self.maxPositionAlongCrossAxis = CGRectGetMaxY(frame);
            break;
    }
}

-(CGRect)viewFrameOrZero:(UIView * _Nullable)view
{
    return view == nil ? CGRectZero : view.frame;
}

-(CGFloat)maxPositionAlongMainAxisFromFrame:(CGRect)frame
{
    return [self maxPositionAlongDirection:self.flexDirection fromFrame:frame];
}

-(CGFloat)maxPositionAlongCrossAxisFromFrame:(CGRect)frame
{
    return [self maxPositionAlongDirection:UIFlexDirectionConfigFlip(self.flexDirection) fromFrame:frame];
}

-(CGFloat)maxPositionAlongDirection:(UIFlexDirectionConfig)direction fromFrame:(CGRect)frame
{
    switch (direction) {
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
    return [self frame:frame withUpdatedPosition:position alongDirection:self.flexDirection];
}

-(CGRect)frame:(CGRect)frame withUpdatedPositionAlongCrossAxis:(CGFloat)position
{
    return [self frame:frame withUpdatedPosition:position alongDirection:UIFlexDirectionConfigFlip(self.flexDirection)];
}

-(CGRect)frame:(CGRect)frame withUpdatedPosition:(CGFloat)position alongDirection:(UIFlexDirectionConfig)direction
{
    switch (direction) {
        case UIFlexDirectionConfigRow:
            frame.origin.x = position;
            return frame;
            
        case UIFlexDirectionConfigColumn:
            frame.origin.y = position;
            return frame;
    }
}

@end
