//
//  VolumeInfo.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "VolumeInfo.h"

@implementation VolumeInfo

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        _title = dictionary[@"title"];
        _authors = dictionary[@"authors"];
        _volumeDescription = dictionary[@"description"];
        _imageLinks = [[ImageLinks alloc] initWithDictionary:dictionary[@"imageLinks"]];
    }
    
    return self;
}

@end
