//
//  BSImageView.h
//  BookStoreObjc
//
//  Created by Helder Nunes on 18/01/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSImageView : UIImageView

- (void) downloadImageFromURL:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
