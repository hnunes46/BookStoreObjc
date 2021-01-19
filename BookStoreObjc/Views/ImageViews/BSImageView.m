//
//  BSImageView.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 18/01/2021.
//

#import "BSImageView.h"
#import "NetworkManager.h"

@implementation BSImageView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self configure];
    }
    
    return self;
}


- (void) configure {
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    self.translatesAutoresizingMaskIntoConstraints = NO;
}


- (void) downloadImageFromURL:(NSString *)urlString {
    
    [NetworkManager.shared downloadImageFromUrl:urlString withCompletion:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    }];
}

@end
