//
//  VolumeInfo.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import <Foundation/Foundation.h>
#import "ImageLinks.h"
NS_ASSUME_NONNULL_BEGIN

@interface VolumeInfo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray<NSString *> *authors;
@property (strong, nonatomic) NSString *volumeDescription;
@property (strong, nonatomic) ImageLinks *imageLinks;


- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
