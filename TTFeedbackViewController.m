//
//  TTFeedbackViewController.m
//  TTFeedBack
//
//  Created by Jash on 2018/4/5.
//  Copyright © 2018年 Jash. All rights reserved.
//

#import "TTFeedbackViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale)
#define SCREEN_HEIGHT ([UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale)

@interface TTFeedbackViewController ()

@property (strong, nonatomic) UILabel *lblTT;
@property (strong, nonatomic) UIButton *btnTT;

@end

@implementation TTFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.lblTT = [[UILabel alloc] initWithFrame:CGRectMake(0.f, ceilf(SCREEN_HEIGHT / 3), SCREEN_WIDTH, 40.f)];
    self.lblTT.textAlignment = NSTextAlignmentCenter;
    self.lblTT.text = @"This is TTFeedbackViewController";
    self.lblTT.font = [UIFont systemFontOfSize:20.f];
    [self.view addSubview:self.lblTT];
    
    self.btnTT = [[UIButton alloc] initWithFrame:CGRectMake(40.f, ceilf(SCREEN_HEIGHT / 3) * 2, SCREEN_WIDTH - 80.f, 40.f)];
    [self.btnTT addTarget:self action:@selector(btnTTAction) forControlEvents:UIControlEventTouchUpInside];
    [self.btnTT setTitle:@"Dismiss" forState:UIControlStateNormal];
    [self.btnTT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.btnTT];
}

- (void)btnTTAction
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
