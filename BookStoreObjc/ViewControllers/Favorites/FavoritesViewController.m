//
//  FavoritesViewController.m
//  BookStoreObjc
//
//  Created by Helder Nunes on 14/01/2021.
//

#import "FavoritesViewController.h"
#import "Book.h"
#import "FavoriteBooksTableViewCell.h"
#import "PersistenceManager.h"

@interface FavoritesViewController ()

@property (strong, nonatomic) NSMutableArray<Book *> *dataSource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureViewController];
}


- (void) configureViewController {
    _dataSource = [[NSMutableArray alloc] init];
    
    [self configureFavoritesTableView];
    [PersistenceManager.shared retrieveFavoriteswithCompletion:^(NSMutableArray * _Nonnull books) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.dataSource addObjectsFromArray:books];
            [self.tableView reloadData];
        });
    }];
}


- (void) configureFavoritesTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.rowHeight = 100;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:FavoriteBooksTableViewCell.self forCellReuseIdentifier:@"favoritesBookcell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"favoritesBookCell";
    
    FavoriteBooksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setBook:_dataSource[indexPath.row]];
    
    return cell;
}

@end
