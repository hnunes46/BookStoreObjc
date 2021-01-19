//
//  FavoriteBooksTableViewCell.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 19/01/2021.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "BSImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteBooksTableViewCell : UITableViewCell

@property (strong, nonatomic) BSImageView *bookImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorsLabel;

- (void) setBook:(Book *)book;

@end

NS_ASSUME_NONNULL_END
