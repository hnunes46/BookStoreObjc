//
//  FavoritesViewController.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import <UIKit/UIKit.h>
#import "BSDataLoadingViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoritesViewController : BSDataLoadingViewController<UITableViewDelegate, UITableViewDataSource>

@end

NS_ASSUME_NONNULL_END
