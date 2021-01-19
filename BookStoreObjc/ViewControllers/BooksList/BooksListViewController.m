//
//  BooksListViewController.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "BooksListViewController.h"
#import "BookStoreCollectionViewCell.h"
#import "Book.h"
#import "BookDetailViewController.h"
#import "NetworkManager.h"

@interface BooksListViewController ()

@property (strong, nonatomic) NSMutableArray<Book *> *dataSource;
@property (strong, nonatomic) UICollectionView *collectionView;
@property int page;


- (void) fetchData;

@end

@implementation BooksListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}


- (void) configureViewController {
    _page = 0;
    _dataSource = [[NSMutableArray alloc] init];
    [self configureBooksCollectionView];
    [self fetchData];
}


- (void) configureBooksCollectionView {
    CGFloat width = self.view.bounds.size.width;
    CGFloat padding = 12;
    CGFloat minimumItemSpacing = 10;
    CGFloat availableWidth = width - (padding * 2) - (minimumItemSpacing * 2);
    CGFloat itemWidth = availableWidth / 2;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth + 40);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = UIColor.systemBackgroundColor;
    [_collectionView registerClass:BookStoreCollectionViewCell.self forCellWithReuseIdentifier:@"bookStoreCell"];
    
}


- (void) fetchData {
    [self showLoadingView];
    
    [NetworkManager.shared fetchBooksWithPage:_page withCompletion:^(NSMutableArray * _Nonnull books) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissLoadingView];
            [self.dataSource addObjectsFromArray:books];
            [self.collectionView reloadData];
        });
    }];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"bookStoreCell";
    
    BookStoreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setBook:_dataSource[indexPath.row]];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] initWithBook:_dataSource[indexPath.row]];
    [self.navigationController pushViewController:bookDetailViewController animated:YES];

}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height;
    CGFloat height = scrollView.frame.size.height;
    
    if (offsetY > contentHeight - height) {
        _page = _page + 20;
        [self fetchData];
    }
}

@end
