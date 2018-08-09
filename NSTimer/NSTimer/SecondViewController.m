//
//  SecondViewController.m
//  NSTimer
//
//  Created by 鞠凝玮 on 2018/8/7.
//  Copyright © 2018年 Ju. All rights reserved.
//

#import "SecondViewController.h"
#import "NSTimer+WeakTimer.h"

@interface SecondViewController ()
//@property (nonatomic, weak)NSTimer *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer weak_scheduledTimerWithTimeInterval:1 target:self selector:@selector(func) userInfo:nil repeats:YES];
}

- (void)func{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);

    NSLog(@"123");
    
}


- (void)dealloc
{
    NSLog(@"dealloc");
 

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
