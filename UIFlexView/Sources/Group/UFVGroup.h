//
//  UFVGroup.h
//  UIFlexView
//
//  Created by Alex Manarpies on 19/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIFlexViewConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface UFVGroup : NSObject

@property (readonly, nonatomic, assign) CGRect frame;
@property (readonly, nonatomic, copy) NSArray<UIView*>* items;
@property (readonly, nonatomic, assign) UIFlexDirectionConfig flexDirection;

-(instancetype)initWithFrame:(CGRect)frame
                       items:(NSArray<UIView*>*)items
               flexDirection:(UIFlexDirectionConfig)flexDirection;

- (CGFloat)minPositionAlongMainAxis:(CGRect)frame;
- (CGFloat)maxPositionAlongMainAxis:(CGRect)frame;
- (CGFloat)minPositionAlongCrossAxis:(CGRect)frame;
- (CGFloat)maxPositionAlongCrossAxis:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
