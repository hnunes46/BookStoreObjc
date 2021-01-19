//
//  BookStoreCollectionViewCell.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 15/01/2021.
//

#import "BookStoreCollectionViewCell.h"

@implementation BookStoreCollectionViewCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self configure];
    }
    
    return self;
}


- (void) configure {
    _bookImageView = [[BSImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_bookImageView];
    
    [_bookImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = YES;
    [_bookImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:0].active = YES;
    [_bookImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:0].active = YES;
    [_bookImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
    
}


- (void) setBook:(Book *)book {
    [_bookImageView downloadImageFromURL:book.volumeInfo.imageLinks.thumbnail];
}

@end
