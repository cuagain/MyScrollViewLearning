//
//  MainViewController.m
//  MyScrollViewLearning
//
//  Created by Thanawat Soisakhoo on 9/20/2557 BE.
//  Copyright (c) 2557 thanawat.s. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"%f, %f, %f", self.scrollView.bounds.size.height, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
    
    NSLog(@"%@", self.scrollView.constraints);
    
    UIView* v = self.scrollView.subviews[0];
    
    NSLog(@"%f", v.frame.size.height);
    
    NSLog(@"%f", self.scrollView.frame.size.height);
    
    NSLog(@"%i", v.translatesAutoresizingMaskIntoConstraints);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
