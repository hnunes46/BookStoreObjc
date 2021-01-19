//
//  Book.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "Book.h"

@implementation Book

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        _id = dictionary[@"id"];
        _volumeInfo = [[VolumeInfo alloc] initWithDictionary:dictionary[@"volumeInfo"]];
        _saleInfo = [[SaleInfo alloc] initWithDictionary:dictionary[@"saleInfo"]];
    }
    
    return self;
}

@end
