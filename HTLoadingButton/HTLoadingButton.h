//
//  HTLoadingButton.h
//  HTLoadingButton
//
//  Created by Pokey on 2020/1/8.
//  Copyright © 2020 Pokey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HTLoadingButtonPositionType) {
    HTLoadingButtonTypeHidden,
    HTLoadingButtonTypeCenter,
    HTLoadingButtonTypeTitleLeft,
    HTLoadingButtonTypeOnTitle,
    HTLoadingButtonTypeOnImage,
};

@interface HTLoadingButton : UIButton
- (void)loadingWithPositionType:(HTLoadingButtonPositionType)positionType;
- (void)loadingWithIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (void)startLoadingAnimating;
- (void)stopLoadingAnimating;

@end

NS_ASSUME_NONNULL_END
