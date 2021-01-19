//
//  PersistenceManager.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 19/01/2021.
//

#import "PersistenceManager.h"
#import "Book.h"
#import <UIKit/UIKit.h>

@interface PersistenceManager ()

@property (strong, nonatomic) NSUserDefaults *defaults;

@end

@implementation PersistenceManager


+ (id) shared {
    static PersistenceManager *sharedPersistenceManager = nil;
    @synchronized (self) {
        if (sharedPersistenceManager == nil)
            sharedPersistenceManager = [[self alloc] init];
    }
    
    return sharedPersistenceManager;
}


- (instancetype) init {
    self = [super init];
    if (self) {
        self.defaults = NSUserDefaults.standardUserDefaults;
    }
    
    return self;
}


- (void) addFavoriteBook: (Book *) book {
    
    [self retrieveFavoriteswithCompletion:^(NSMutableArray * _Nonnull books) {
        if ([books containsObject:book]) {
            [books addObject:book];
            [self saveFavorites:books];
        }
    }];
    
}


- (void) retrieveFavoriteswithCompletion:(void(^)(NSMutableArray *books))completion {
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"favorites"]];
    
    completion(array);
}


- (void) saveFavorites:(NSMutableArray *)books {
    [[NSUserDefaults standardUserDefaults] setObject:books forKey:@"favorites"];
}

@end
