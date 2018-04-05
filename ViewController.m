//
//  ViewController.m
//  TTFeedBack
//
//  Created by Jash on 2018/4/3.
//  Copyright © 2018年 Jash. All rights reserved.
//

#import "ViewController.h"
#import "TTFeedbackViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale)
#define SCREEN_HEIGHT ([UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale)

@interface ViewController () <UITextViewDelegate>

@property (strong, nonatomic) UITextView *txtTT;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"欢迎使用探探, 在使用过程中有疑问请反馈"];
    
    // 设置居中
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, attributedString.string.length)];
    
    // 设置字体大小
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:16.f]
                             range:NSMakeRange(0, attributedString.string.length)];
    
    // "反馈"可响应点击
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"TTFeedback"
                             range:[[attributedString string] rangeOfString:@"反馈"]];
    
    self.txtTT = [[UITextView alloc] initWithFrame:CGRectMake(0.f, ceilf(SCREEN_HEIGHT / 3), SCREEN_WIDTH, 40.f)];
    self.txtTT.delegate = self;
    self.txtTT.editable = NO;
    self.txtTT.scrollEnabled = NO;
    
    self.txtTT.attributedText = attributedString;
    self.txtTT.linkTextAttributes = @{ NSForegroundColorAttributeName: [UIColor blackColor],
                                        NSUnderlineColorAttributeName: [UIColor blackColor],
                                        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    
    [self.view addSubview:self.txtTT];
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([URL.absoluteString isEqualToString:@"TTFeedback"]) {
        TTFeedbackViewController *ttVC = [[TTFeedbackViewController alloc] init];
        [self presentViewController:ttVC animated:YES completion:^{}];
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
