//
//  BSButton.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 18/01/2021.
//

#import "BSButton.h"

@implementation BSButton

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configure];
    }
    
    return self;
}


- (instancetype) initBackgroundColor:(UIColor *)backgroundColor Title:(NSString *)title {
    self = [self initWithFrame:CGRectZero];
    
    if (self) {
        self.backgroundColor = backgroundColor;
        [self setTitle:title forState:UIControlStateNormal];
    }
    
    return self;
}


- (void) configure {
    self.layer.cornerRadius = 10;
    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [self setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.translatesAutoresizingMaskIntoConstraints = false;
}


- (void) setWithBackgroundColor:(UIColor *)backgroundColor Title:(NSString *)title {
    self.backgroundColor = backgroundColor;
    [self setTitle:title forState:UIControlStateNormal];
}

@end
