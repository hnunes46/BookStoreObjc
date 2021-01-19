//
//  BSDataLoadingViewController.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 19/01/2021.
//

#import "BSDataLoadingViewController.h"

@interface BSDataLoadingViewController ()

@property (strong, nonatomic) UIView * containerView;

@end

@implementation BSDataLoadingViewController

- (void) showLoadingView {
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_containerView];
    
    _containerView.backgroundColor = UIColor.systemBackgroundColor;
    _containerView.alpha = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.alpha = 0.8;
    }];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    [self.containerView addSubview:activityIndicator];
    
    [activityIndicator.centerYAnchor constraintEqualToAnchor:_containerView.centerYAnchor].active = YES;
    [activityIndicator.centerXAnchor constraintEqualToAnchor:_containerView.centerXAnchor].active = YES;
    
    [activityIndicator startAnimating];
}


- (void) dismissLoadingView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.containerView removeFromSuperview];
        self.containerView = nil;
    });
}

@end
