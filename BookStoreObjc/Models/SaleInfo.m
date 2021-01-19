//
//  SaleInfo.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "SaleInfo.h"

@implementation SaleInfo

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    
    if (self) {
        _buyLink = dictionary[@"buyLink"];
    }
    
    return self;
}

@end
