//
//  HTLoadingButton.m
//  HTLoadingButton
//
//  Created by Pokey on 2020/1/8.
//  Copyright © 2020 Pokey. All rights reserved.
//

#import "HTLoadingButton.h"

@interface HTLoadingButton ()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic, assign) HTLoadingButtonPositionType positonType;
@property(nonatomic, assign) UIActivityIndicatorViewStyle indicatorViewStyle;
@end

@implementation HTLoadingButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.positonType = HTLoadingButtonTypeHidden;
        self.indicatorViewStyle = UIActivityIndicatorViewStyleGray;
        
        self.activityIndicatorView = ({
            UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.indicatorViewStyle];
            aiv.hidesWhenStopped = NO;
            aiv.alpha = 0;
            aiv;
        });
        [self addSubview:self.activityIndicatorView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.activityIndicatorView.alpha = 0;
    float animationDuation = .4;
    float nomalMinWidth = 30;
    
    float imageViewAlpha = 1.0;
    float titleLabelAlpha = 1.0;
    float indicatorAlpha = 1.0;
    float x = 0;
    float y = 0;
    float w = 0;
    
    switch (self.positonType) {
        case HTLoadingButtonTypeHidden: {
            imageViewAlpha = titleLabelAlpha = 1;
            indicatorAlpha = 0;
            break;
        }
        case HTLoadingButtonTypeCenter: {
            w = MIN(MIN(self.frame.size.width, self.frame.size.height), nomalMinWidth);
            imageViewAlpha = titleLabelAlpha = 0;
            indicatorAlpha = 1;
            x = (self.frame.size.width - w) * .5;
            y = (self.frame.size.height - w) * .5;
            break;
        }
        case HTLoadingButtonTypeOnImage: {
            w = MIN(MIN(self.imageView.frame.size.width, self.imageView.frame.size.height), nomalMinWidth);
            x = CGRectGetMaxX(self.imageView.frame) - self.imageView.frame.size.width * .5 - w * .5;
            y = CGRectGetMaxY(self.imageView.frame) - self.imageView.frame.size.height * .5 - w * .5;
            imageViewAlpha = 0;
            titleLabelAlpha = 1;
            indicatorAlpha = 1;
            break;
        }
        case HTLoadingButtonTypeOnTitle: {
            w = MIN(MIN(self.titleLabel.frame.size.width, self.titleLabel.frame.size.height), nomalMinWidth);
            x = CGRectGetMaxX(self.titleLabel.frame) - self.titleLabel.frame.size.width * .5 - w * .5;
            y = CGRectGetMaxY(self.titleLabel.frame) - self.titleLabel.frame.size.height * .5 - w * .5;
            imageViewAlpha = 1;
            titleLabelAlpha = 0;
            indicatorAlpha = 1;
            break;
        }
        case HTLoadingButtonTypeTitleLeft: {
            w = MIN(MIN(self.titleLabel.frame.size.width, self.titleLabel.frame.size.height), nomalMinWidth);
            x = CGRectGetMaxX(self.titleLabel.frame) + 5;
            y = CGRectGetMaxY(self.titleLabel.frame) - self.titleLabel.frame.size.height * .5 - w * .5;
            indicatorAlpha = imageViewAlpha = titleLabelAlpha = 1;
            break;
        }
    }
    [self.activityIndicatorView setFrame:CGRectMake(x, y, w, w)];
    [UIView animateWithDuration:.1 animations:^{
        self.imageView.alpha = imageViewAlpha;
        self.titleLabel.alpha = titleLabelAlpha;
    } completion:^(BOOL finished) {
        if (indicatorAlpha > 0) {
            [self.activityIndicatorView startAnimating];
        }
        [UIView animateWithDuration:animationDuation animations:^{
            self.activityIndicatorView.alpha = indicatorAlpha;
        } completion:^(BOOL finished) {
            if (indicatorAlpha == 0) {
                [self.activityIndicatorView stopAnimating];
            }
        }];
    }];
}

- (void)loadingWithPositionType:(HTLoadingButtonPositionType)positionType {
    self.positonType = positionType;
}

- (void)loadingWithIndicatorStyle:(UIActivityIndicatorViewStyle)style {
    self.indicatorViewStyle = style;
    self.activityIndicatorView.activityIndicatorViewStyle = style;
}

- (void)startLoadingAnimating {
    [self.activityIndicatorView startAnimating];
    [self setNeedsLayout];
}

- (void)stopLoadingAnimating {
    [self.activityIndicatorView stopAnimating];
}

@end
