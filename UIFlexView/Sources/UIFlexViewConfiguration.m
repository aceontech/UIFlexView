//
//  UIFlexViewConfiguration.m
//  UIFlexView
//
//  Created by Alex on 11/01/2020.
//  Copyright © 2020 Jarroo. All rights reserved.
//

#import "UIFlexViewConfiguration.h"

UIFlexDirectionConfig UIFlexDirectionConfigFlip(UIFlexDirectionConfig fromConfig) {
    switch (fromConfig) {
        case UIFlexDirectionConfigRow:
            return UIFlexDirectionConfigColumn;
            
        case UIFlexDirectionConfigColumn:
            return UIFlexDirectionConfigRow;
    }
}
