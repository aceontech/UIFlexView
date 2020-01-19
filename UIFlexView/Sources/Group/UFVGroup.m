//
//  UFVGroup.m
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UFVGroup.h"

@interface UFVGroup ()
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, copy) NSArray<UIView*>* items;
@property (nonatomic, assign) UIFlexDirectionConfig flexDirection;
@end

@implementation UFVGroup

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<UIView*>*)items flexDirection:(UIFlexDirectionConfig)flexDirection
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.items = items;
        self.flexDirection = flexDirection;
    }
    return self;
}

- (CGFloat)minPositionAlongMainAxis:(CGRect)frame
{
    return [self minPositionAlongDirection:self.flexDirection frame:frame];
}

- (CGFloat)maxPositionAlongMainAxis:(CGRect)frame
{
    return [self maxPositionAlongDirection:self.flexDirection frame:frame];
}

- (CGFloat)minPositionAlongCrossAxis:(CGRect)frame
{
    return [self minPositionAlongDirection:UIFlexDirectionConfigFlip(self.flexDirection) frame:frame];
}

- (CGFloat)maxPositionAlongCrossAxis:(CGRect)frame
{
    return [self maxPositionAlongDirection:UIFlexDirectionConfigFlip(self.flexDirection) frame:frame];
}

#pragma mark - Helpers

-(CGFloat)minPositionAlongDirection:(UIFlexDirectionConfig)direction frame:(CGRect)frame
{
    switch (direction) {
        case UIFlexDirectionConfigRow:
            return CGRectGetMinX(frame);

        case UIFlexDirectionConfigColumn:
            return CGRectGetMinY(frame);
    }
}

-(CGFloat)maxPositionAlongDirection:(UIFlexDirectionConfig)direction frame:(CGRect)frame
{
    switch (direction) {
        case UIFlexDirectionConfigRow:
            return CGRectGetMaxX(frame);

        case UIFlexDirectionConfigColumn:
            return CGRectGetMaxY(frame);
    }
}

@end
