//
//  UIFlexView.h
//  UIFlexView
//
//  Created by Alex on 07/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIFlexView/UIFlexViewConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFlexView : UIView

@property (nonatomic, assign) UIFlexWrapConfig flexWrap;
@property (nonatomic, assign) UIFlexDirectionConfig flexDirection;

@end

NS_ASSUME_NONNULL_END
