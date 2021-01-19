//
//  BookStoreCollectionViewCell.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 15/01/2021.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "BSImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookStoreCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) BSImageView *bookImageView;

- (void) setBook:(Book *)book;

@end

NS_ASSUME_NONNULL_END
