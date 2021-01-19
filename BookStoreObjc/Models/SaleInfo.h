//
//  SaleInfo.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaleInfo : NSObject

@property (strong, nonatomic) NSString *buyLink;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
