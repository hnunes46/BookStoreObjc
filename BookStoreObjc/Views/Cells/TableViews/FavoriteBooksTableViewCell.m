//
//  FavoriteBooksTableViewCell.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 19/01/2021.
//

#import "FavoriteBooksTableViewCell.h"

@implementation FavoriteBooksTableViewCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configure];
    }
    
    return self;
}


- (void) configure {
    _bookImageView = [[BSImageView alloc] initWithFrame:CGRectZero];
    _titleLabel = [[UILabel alloc] init];
    _authorsLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:_bookImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_authorsLabel];
    
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    
    _authorsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _authorsLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    _authorsLabel.textColor = UIColor.secondaryLabelColor;
    _authorsLabel.numberOfLines = 0;
    _authorsLabel.textAlignment = NSTextAlignmentLeft;
    
    [_bookImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:4].active = YES;
    [_bookImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:4].active = YES;
    [_bookImageView.heightAnchor constraintEqualToConstant:92].active = YES;
    [_bookImageView.widthAnchor constraintEqualToConstant:60].active = YES;
    
    [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8].active = YES;
    [_titleLabel.leadingAnchor constraintEqualToAnchor:_bookImageView.trailingAnchor constant:8].active = YES;
    [_titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8].active = YES;
    [_titleLabel.heightAnchor constraintEqualToConstant:50].active = YES;
    
    [_authorsLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:4].active = YES;
    [_authorsLabel.leadingAnchor constraintEqualToAnchor:_bookImageView.trailingAnchor constant:8].active = YES;
    [_authorsLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8].active = YES;
    [_authorsLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8].active = YES;
    
}


- (void) setBook:(Book *)book {
    
    [_bookImageView downloadImageFromURL:book.volumeInfo.imageLinks.thumbnail];
    _titleLabel.text = book.volumeInfo.title;
    
    if (book.volumeInfo.authors.count > 0) {
        _authorsLabel.text = [book.volumeInfo.authors componentsJoinedByString:@", "];
    } else {
        _authorsLabel.text = @"";
    }
}

@end
