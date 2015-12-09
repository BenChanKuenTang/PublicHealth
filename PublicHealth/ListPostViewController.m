//
//  ListPostViewController.m
//  PublicHealth
//
//  Created by Ben Chan on 4/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ListPostViewController.h"
#import "BaseTableViewCell.h"

@interface ListPostViewController ()

@end

@implementation ListPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataArray = @[@{@"title":@"1"},
                  @{@"title":@"testing long long long long long long long long long long long long long long long text"}];
    
    postTableView.rowHeight = UITableViewAutomaticDimension;
    postTableView.estimatedRowHeight = 50;
    
    [self showHUDWithTitle:@"Loading"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"title":@"foo", @"body":@"bar", @"userId":@"1"};
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_TEST];
    
    __weak ListPostViewController *weakSelf = self;
    [manager POST:api parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [postTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ListPostCell";
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    [cell setData:dataArray[indexPath.row]];
    
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return ;
//}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(nonnull NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
