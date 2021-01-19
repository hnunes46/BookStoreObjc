//
//  ImageLinks.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "ImageLinks.h"

@implementation ImageLinks

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    
    self = [super init];
    
    if (self) {
        _thumbnail = dictionary[@"thumbnail"];
    }
    
    return self;
}

@end
