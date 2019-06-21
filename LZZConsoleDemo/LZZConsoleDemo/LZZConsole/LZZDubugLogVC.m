//
//  LZZDubugLogVC.m
//  ProfessorPlayCars
//
//  Created by 玩车tv on 2019/6/19.
//  Copyright © 2019 Wc. All rights reserved.
//

#import "LZZDubugLogVC.h"
#import "LZZConsole.h"

#define LZZCreenWidth [UIScreen mainScreen].bounds.size.width

@interface LZZDubugLogVC ()
@property(nonatomic,weak)UIScrollView * scrollView;
@end

@implementation LZZDubugLogVC

-(id)init
{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];
    
    
    CGFloat content_w = LZZCreenWidth - 16;
    CGFloat content_h = [UIScreen mainScreen].bounds.size.height;
    CGFloat fontSize = 12;
    NSString * log = [[LZZConsole shareConsole] getLog];

    CGRect textRect = [log boundingRectWithSize:CGSizeMake(content_w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, content_w, textRect.size.height)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = [UIColor greenColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = log;
    
    UIScrollView * sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, LZZCreenWidth, content_h)];
    [sv setContentSize:CGSizeMake(LZZCreenWidth, textRect.size.height)];
    [sv addSubview:label];
    [self.view addSubview:sv];
    self.scrollView = sv;
    
    UIButton * closeBtn= [[UIButton alloc] initWithFrame:CGRectMake(LZZCreenWidth - 60, 25, 50, 50)];
    closeBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    NSAttributedString * title = [[NSAttributedString alloc] initWithString:@"close" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [closeBtn setAttributedTitle:title forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    [self.view bringSubviewToFront:closeBtn];
    
}

-(void)closeBtnAction:(id)sender
{
    self.view.window.hidden = YES;
    [self.view.window resignKeyWindow];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGPoint off = self.scrollView.contentOffset;
    off.y = self.scrollView.contentSize.height - self.scrollView.bounds.size.height + self.scrollView.contentInset.bottom;
    [self.scrollView setContentOffset:off animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


@end
