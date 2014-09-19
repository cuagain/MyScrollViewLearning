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
    
    //[self scrollViewWithCoding];
    
    [self scrollViewCodingWithAutoLayout];
    
}

-(void) scrollViewCodingWithAutoLayout {
    UIScrollView* sv = [UIScrollView new];
    sv.backgroundColor = [UIColor whiteColor];
    sv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:sv];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[sv]|"
                                             options:0 metrics:nil
                                               views:@{@"sv":sv}]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[sv]|"
                                             options:0 metrics:nil
                                               views:@{@"sv":sv}]];
    UILabel* previousLab = nil;
    for (int i=0; i<30; i++) {
        UILabel* lab = [UILabel new];
        lab.translatesAutoresizingMaskIntoConstraints = NO;
        lab.text = [NSString stringWithFormat:@"This is label %d", i+1];
        [sv addSubview:lab];
        [sv addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[lab]"
                                                 options:0 metrics:nil
                                                   views:@{@"lab":lab}]];
        if (!previousLab) { // first one, pin to top
            [sv addConstraints:
             [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[lab]"
                                                     options:0 metrics:nil
                                                       views:@{@"lab":lab}]];
        }
        else { // all others, pin to previous
            [sv addConstraints:
             [NSLayoutConstraint
              constraintsWithVisualFormat:@"V:[prev]-(10)-[lab]"
              options:0 metrics:nil
              views:@{@"lab":lab, @"prev":previousLab}]];
        }
        
        previousLab = lab;
        
        NSLog(@"%i", i);
        
    }
    
    [sv addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lab]-(10)-|"
                                             options:0 metrics:nil
                                               views:@{@"lab":previousLab}]];
    
}

-(void) scrollViewWithCoding {
    
    UIScrollView* sv = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    sv.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:sv];
    sv.backgroundColor = [UIColor whiteColor];
    CGFloat y = 10;
    for (int i=0; i<30; i++) {
        UILabel* lab = [UILabel new];
        lab.text = [NSString stringWithFormat:@"This is label %d", i+1];
        [lab sizeToFit];
        CGRect f = lab.frame;
        f.origin = CGPointMake(10,y);
        f.size.width = self.view.bounds.size.width - 20;
        lab.frame = f;
        lab.backgroundColor = [UIColor redColor]; // make label bounds visible
        lab.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [sv addSubview:lab];
        y += lab.bounds.size.height + 10;
    }
    CGSize sz = sv.bounds.size;
    sz.height = y;
    sv.contentSize = sz;
    
    NSLog(@"%f", y);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
