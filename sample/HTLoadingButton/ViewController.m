//
//  ViewController.m
//  HTLoadingButton
//
//  Created by Pokey on 2020/1/7.
//  Copyright © 2020 Pokey. All rights reserved.
//

#import "ViewController.h"
#import "HTLoadingButton.h"

@interface ViewController ()
@property (nonatomic, strong) HTLoadingButton *loadingButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.loadingButton = ({
        HTLoadingButton *button = [HTLoadingButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
        [button setTitle:@"aaaaaaa" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(100, 100, 150, 50)];
        button;
    });
    [self.view addSubview:self.loadingButton];
    
    NSArray *positionArr = @[@"Hidden", @"Center", @"TitleLeft", @"OnTitle", @"OnImage"];
    for (int i = 0; i < positionArr.count; i++) {
        UIButton *changeTypeButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            [button setTitle:positionArr[i] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(100, 200 + 60 * i, 100, 50)];
            button.tag = i;
            [button addTarget:self action:@selector(changePositionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
        [self.view addSubview:changeTypeButton];
    }
    
    
    
}

- (void)changeTypeButtonClick {
    [self.loadingButton loadingWithIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)changePositionButtonClick:(UIButton *)sender {
    [self.loadingButton loadingWithPositionType:sender.tag];
    [self.loadingButton startLoadingAnimating];
}


@end
