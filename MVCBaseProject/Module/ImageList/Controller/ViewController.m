//
//  ViewController.m
//  MVCBaseProject
//
//  Created by Virendra Ravalji on 2018/12/22.
//  Copyright © 2018 Virendra Ravalji. All rights reserved.
//

#import "ViewController.h"
#import "SampleTableViewCell.h"
#import "APIManager.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ViewController";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SampleTableViewCell *cell = (SampleTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"SampleCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[SampleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SampleCell"];
    }
    
    cell.titleLabel.text = @"SampleTitel";
    cell.subTitleLabel.text = @"SampleSubTitle";
    [cell loadImageAsynchronously:(indexPath.row + 1) % 5];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30; // Constant for now
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [APIManager.sharedInstance apiCallWithRequestType:@"" url:@"" andParameters:@{}];
}
@end
