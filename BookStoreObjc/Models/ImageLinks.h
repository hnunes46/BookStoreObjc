//
//  ImageLinks.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import <Foundation/Foundation.h>

@interface ImageLinks : NSObject

@property (strong, nonatomic) NSString *thumbnail;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

