//
//  BookDetailViewController.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 15/01/2021.
//

#import "BookDetailViewController.h"
#import "BSButton.h"
#import <SafariServices/SafariServices.h>

@interface BookDetailViewController ()

@property (strong, nonatomic) UIImageView *coverImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorsLabel;
@property (strong, nonatomic) UIButton *favoriteButton;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) BSButton * buyButton;

@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

- (instancetype) initWithBook:(Book *)book {
    
    self = [super init];
    if (self) {
        _book = book;
    }
    
    return self;
}


- (void) configureViewController {
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    [self configureCoverImageView];
    [self configureTitleLabel];
    [self configureAuthorsLabel];
    [self configureAddFavoriteButton];
    [self configureBuyButton];
    [self configureDescriptionTextView];
}


- (void) configureCoverImageView {
    _coverImageView = [[UIImageView alloc] init];
    [self.view addSubview:_coverImageView];
    
    NSString *urlString = _book.volumeInfo.imageLinks.thumbnail;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.coverImageView.image = image;
            });
        }

    }];
    
    [task resume];
    
    _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_coverImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:16].active = YES;
    [_coverImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [_coverImageView.widthAnchor constraintEqualToConstant:120].active = YES;
    [_coverImageView.heightAnchor constraintEqualToConstant:180].active = YES;
    
}


- (void) configureTitleLabel {
    
    _titleLabel = [[UILabel alloc] init];
    [self.view addSubview:_titleLabel];
    
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    _titleLabel.text = _book.volumeInfo.title;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_titleLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:16].active = YES;
    [_titleLabel.leadingAnchor constraintEqualToAnchor:_coverImageView.trailingAnchor constant:8].active = YES;
    [_titleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [_titleLabel.heightAnchor constraintEqualToConstant:80].active = YES;
    
}


- (void) configureAuthorsLabel {
    _authorsLabel = [[UILabel alloc] init];
    [self.view addSubview:_authorsLabel];
    
    _authorsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _authorsLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    _authorsLabel.textColor = UIColor.secondaryLabelColor;
    _authorsLabel.numberOfLines = 0;
    _authorsLabel.textAlignment = NSTextAlignmentLeft;
    
    if (_book.volumeInfo.authors.count > 0) {
        _authorsLabel.text = [_book.volumeInfo.authors componentsJoinedByString:@", "];
    } else {
        _authorsLabel.text = @"";
    }
    
    [_authorsLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:4].active = YES;
    [_authorsLabel.leadingAnchor constraintEqualToAnchor:_coverImageView.trailingAnchor constant:8].active = YES;
    [_authorsLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [_authorsLabel.heightAnchor constraintEqualToConstant:60].active = YES;
    
}


- (void) configureAddFavoriteButton {
    _favoriteButton = [[UIButton alloc] init];
    [self.view addSubview:_favoriteButton];
    
    _favoriteButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_favoriteButton setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [_favoriteButton addTarget:self action:@selector(favoriteButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [_favoriteButton.topAnchor constraintEqualToAnchor:_authorsLabel.bottomAnchor constant:0].active = YES;
    [_favoriteButton.leadingAnchor constraintEqualToAnchor:_coverImageView.trailingAnchor constant:8].active = YES;
    [_favoriteButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [_favoriteButton.heightAnchor constraintEqualToConstant:40].active = YES;
}


- (void) configureBuyButton {
    _buyButton = [[BSButton alloc] init];
    [self.view addSubview:_buyButton];
    [_buyButton addTarget:self action:@selector(buyButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    if (_book.saleInfo.buyLink) {
        [_buyButton setWithBackgroundColor:UIColor.systemGreenColor Title:@"Buy"];
    } else {
        [_buyButton setWithBackgroundColor:UIColor.systemPinkColor Title:@"Book not available"];
        _buyButton.enabled = NO;
    }
    
    [_buyButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20].active = YES;
    [_buyButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [_buyButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [_buyButton.heightAnchor constraintEqualToConstant:60].active = YES;
    
}


- (void) configureDescriptionTextView {
    _descriptionTextView = [[UITextView alloc] init];
    [self.view addSubview:_descriptionTextView];
    
    _descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
    _descriptionTextView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    _descriptionTextView.text = _book.volumeInfo.volumeDescription ? _book.volumeInfo.volumeDescription : @"No description available.";
    
    [_descriptionTextView.topAnchor constraintEqualToAnchor:_coverImageView.bottomAnchor constant:8].active = YES;
    [_descriptionTextView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [_descriptionTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [_descriptionTextView.bottomAnchor constraintEqualToAnchor:_buyButton.topAnchor constant:-16].active = YES;
    
    
}


- (void) favoriteButtonTapped {
    
}


- (void) buyButtonTapped {
    if (_book.saleInfo.buyLink) {
        NSURL *url = [[NSURL alloc] initWithString:_book.saleInfo.buyLink];
        SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
        [self presentViewController:safariViewController animated:true completion:NULL];
    }
}

@end
