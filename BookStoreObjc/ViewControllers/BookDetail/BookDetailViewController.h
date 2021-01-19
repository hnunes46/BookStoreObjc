//
//  BookDetailViewController.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 15/01/2021.
//

#import <UIKit/UIKit.h>
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailViewController : UIViewController

@property (strong, nonatomic) Book *book;


- (instancetype) initWithBook:(Book *) book;

@end

NS_ASSUME_NONNULL_END
