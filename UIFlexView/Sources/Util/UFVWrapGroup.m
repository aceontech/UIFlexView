//
//  UFVWrapGroup.m
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UFVWrapGroup.h"
#import <UIView+FlexFraming.h>

@interface UFVWrapGroup ()
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, copy) NSArray<UIView*>* items;
@property (nonatomic, assign) UIFlexDirectionConfig flexDirection;

@property (nonatomic, assign) CGFloat maxPositionAlongCrossAxis;
@end

@implementation UFVWrapGroup

+ (void)layoutInFrame:(CGRect)frame items:(NSArray<UIView *> *)items flexDirection:(UIFlexDirectionConfig)flexDirection
{
    UFVWrapGroup *group = [[UFVWrapGroup alloc] initWithFrame:frame items:items flexDirection:flexDirection];
    [group layout];
}

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<UIView*>*)items flexDirection:(UIFlexDirectionConfig)flexDirection
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.items = items;
        self.flexDirection = flexDirection;

        [self reset];
    }
    return self;
}

-(void)reset
{
    self.maxPositionAlongCrossAxis = 0;
}

- (void)layout
{
    [self reset];

    NSMutableArray<UIView*> *remainingSubviews = [self.items mutableCopy];
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
    return [view trailingFrameFrom:referenceView alongDirection:self.flexDirection inParentFrame:self.frame];
}

-(CGRect)trailingFrameFor:(UIView *)view alongCrossAxisFrom:(nullable UIView *)referenceView
{
    UIFlexDirectionConfig direction = UIFlexDirectionConfigFlip(self.flexDirection);
    CGRect frame = [view trailingFrameFrom:referenceView alongDirection:direction inParentFrame:self.frame];

    if ([self maxPositionAlongCrossAxisFromFrame:frame] < self.maxPositionAlongCrossAxis) {
        frame = [self frame:frame withUpdatedPositionAlongCrossAxis:self.maxPositionAlongCrossAxis];
    } else {
        [self persistMaxPositionInFrame:frame alongDirection:direction];
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
            return self.frame.size.width;

        case UIFlexDirectionConfigColumn:
            return self.frame.size.height;
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
