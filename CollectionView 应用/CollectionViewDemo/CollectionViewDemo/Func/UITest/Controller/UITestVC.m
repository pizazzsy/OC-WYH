//
//  UITestVC.m
//  CollectionViewDemo
//
//  Created by hnbwyh on 2018/10/9.
//  Copyright © 2018年 JiXia. All rights reserved.
//

#import "UITestVC.h"

@interface UITestVC ()

@end

@implementation UITestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor           = [UIColor whiteColor];
    self.title                          = NSStringFromClass(self.class);
    [self configUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)configUI{
    CGRect rect             = CGRectZero;
    rect.size               = CGSizeMake(80.0, 20.0);
    rect.origin             = CGPointMake(CGRectGetMidX(self.view.frame)-rect.size.width/2.0, CGRectGetHeight(self.view.frame)/2.0-rect.size.height);
    UISegmentedControl *dateSegControl         = [[UISegmentedControl alloc] initWithItems:@[@"1年",@"5年"]];
    dateSegControl.tintColor                   = [UIColor cyanColor];
    [dateSegControl setTitleTextAttributes:@{
                                             NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                             NSForegroundColorAttributeName:[UIColor cyanColor]
                                             }
                                  forState:UIControlStateNormal];
    [dateSegControl setTitleTextAttributes:@{
                                             NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                             NSForegroundColorAttributeName:[UIColor whiteColor]
                                             }
                                  forState:UIControlStateSelected];
    dateSegControl.clipsToBounds        = TRUE;
    dateSegControl.layer.cornerRadius   = 2.0;
    dateSegControl.layer.borderColor    = [UIColor whiteColor].CGColor;
    dateSegControl.layer.borderWidth    = 0.6;
    dateSegControl.momentary            = FALSE;
    dateSegControl.frame                = rect;
    [self.view addSubview:dateSegControl];
}

@end
