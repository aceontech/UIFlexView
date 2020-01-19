//
//  UFVWrapGroup.h
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIFlexView/UIFlexViewConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface UFVWrapGroup : NSObject

+(void)layoutInFrame:(CGRect)frame
               items:(NSArray<UIView*>*)items
       flexDirection:(UIFlexDirectionConfig)flexDirection;

@end

NS_ASSUME_NONNULL_END
