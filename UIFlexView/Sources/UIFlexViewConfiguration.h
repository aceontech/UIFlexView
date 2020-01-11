//
//  UIFlexViewConfiguration.h
//  UIFlexView
//
//  Created by Alex on 10/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef UIFlexViewConfiguration_h
#define UIFlexViewConfiguration_h

typedef NS_ENUM(NSInteger, UIFlexWrapConfig) {
    UIFlexWrapConfigNoWrap,
    UIFlexWrapConfigWrap
};

typedef NS_ENUM(NSInteger, UIFlexDirectionConfig) {
    UIFlexDirectionConfigRow,
    UIFlexDirectionConfigColumn
};

UIFlexDirectionConfig UIFlexDirectionConfigFlip(UIFlexDirectionConfig fromConfig);

#endif /* UIFlexViewConfiguration_h */
