//
//  NetworkManager.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 18/01/2021.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

@property (strong, nonatomic) NSCache *imageCache;

+ (id) shared;

- (void) fetchBooksWithPage: (int) page withCompletion:(void (^)(NSMutableArray *books))block;
- (void) downloadImageFromUrl: (NSString *)urlString withCompletion:(void (^)(UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
