//
//  PersistenceManager.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 19/01/2021.
//

#import <Foundation/Foundation.h>
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersistenceManager : NSObject

+ (id) shared;

- (void) addFavoriteBook: (Book *) book;
- (void) retrieveFavoriteswithCompletion:(void(^)(NSMutableArray *books))completion;

@end

NS_ASSUME_NONNULL_END
