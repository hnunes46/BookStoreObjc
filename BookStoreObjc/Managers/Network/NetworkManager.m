//
//  NetworkManager.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 18/01/2021.
//

#import "NetworkManager.h"
#import "Book.h"

@implementation NetworkManager

+ (id) shared {
    static NetworkManager *sharedNetworkManager = nil;
    @synchronized(self) {
        if (sharedNetworkManager == nil)
            sharedNetworkManager = [[self alloc] init];
    }
    return sharedNetworkManager;
}


- (instancetype) init {
    self = [super init];
    if (self) {
        self.imageCache = [[NSCache alloc] init];
    }
    
    return self;
}


- (void) fetchBooksWithPage: (int) page withCompletion:(void (^)(NSMutableArray *books))block; {
    NSMutableArray *books = [[NSMutableArray alloc] init];
    NSString *urlString = [NSString stringWithFormat:@"https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=%i", page];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *items = dictionary[@"items"];
        
        for (NSDictionary *bookDictionary in items) {
            Book *book = [[Book alloc] initWithDictionary:bookDictionary];
            [books addObject:book];
        }
        
        block(books);
    }];
    
    [task resume];

}


- (void) downloadImageFromUrl: (NSString *)urlString withCompletion:(void (^)(UIImage *image))completion {
    NSString *cacheKey = [NSString stringWithString:urlString];
    
    UIImage *cachedImage = [self.imageCache objectForKey:cacheKey];
    
    if (cachedImage) {
        completion(cachedImage);
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = [[UIImage alloc] initWithData:data];
        [self.imageCache setObject:image forKey:cacheKey];
        completion(image);
    }];
    
    [task resume];
}

@end
