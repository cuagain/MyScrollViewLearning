//
//  ViewController.m
//  MyScrollViewLearning
//
//  Created by thanawat.s on 9/19/2557 BE.
//  Copyright (c) 2557 thanawat.s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    CGFloat y = 10;
    for (int i=0; i<30; i++) {
        UILabel* lab = [UILabel new];
        lab.text = [NSString stringWithFormat:@"This is label %d", i+1];
        [lab sizeToFit];
        CGRect f = lab.frame;
        
        f.origin = CGPointMake(10,y);
        f.size.width = self.view.bounds.size.width - 20;
        lab.frame = f;
        lab.backgroundColor = [UIColor redColor];
        lab.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.scrollView addSubview:lab];
        y += lab.bounds.size.height + 10;
    }
    CGSize sz = self.scrollView.bounds.size;
    sz.height = y;
    self.scrollView.contentSize = sz;
    
    NSLog(@"%f", y);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
