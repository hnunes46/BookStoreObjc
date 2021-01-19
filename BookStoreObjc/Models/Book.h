//
//  Book.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import <Foundation/Foundation.h>
#import "SaleInfo.h"
#import "VolumeInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) VolumeInfo *volumeInfo;
@property (strong, nonatomic) SaleInfo *saleInfo;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
