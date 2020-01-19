//
//  UIView+FlexFraming.m
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UIView+FlexFraming.h"

@implementation UIView (FlexFraming)

-(CGRect)trailingFrameFrom:(nullable UIView *)referenceView
            alongDirection:(UIFlexDirectionConfig)direction
             inParentFrame:(CGRect)targetFrame
{
    CGRect referenceFrame = [UIView frameOrZero:referenceView];

    CGSize intrinsicSize = [self systemLayoutSizeFittingSize:targetFrame.size];
    CGRect trailingFrame = CGRectMake(0, 0, intrinsicSize.width, intrinsicSize.height);

    switch (direction) {
        case UIFlexDirectionConfigRow:
            trailingFrame.origin.x = CGRectGetMaxX(referenceFrame);
            trailingFrame.origin.y = CGRectGetMinY(referenceFrame);
            break;

        case UIFlexDirectionConfigColumn:
            trailingFrame.origin.x = CGRectGetMinX(referenceFrame);
            trailingFrame.origin.y = CGRectGetMaxY(referenceFrame);
            break;
    }

    return trailingFrame;
}

+(CGRect)frameOrZero:(nullable UIView*)view
{
    return view == nil ? CGRectZero : view.frame;
}

@end
