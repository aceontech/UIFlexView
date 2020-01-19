//
//  UIView+FlexFraming.h
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIFlexViewConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FlexFraming)

-(CGRect)trailingFrameFrom:(nullable UIView *)referenceView
            alongDirection:(UIFlexDirectionConfig)direction
             inParentFrame:(CGRect)targetFrame;

+(CGRect)frameOrZero:(UIView * _Nullable)view;

@end

NS_ASSUME_NONNULL_END
