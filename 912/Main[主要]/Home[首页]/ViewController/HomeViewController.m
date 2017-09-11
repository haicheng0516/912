//
//  HomeViewController.m
//  912
//
//  Created by Seacity on 2017/9/8.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "DetailHomeViewController.h"
#import "HomeDataModel.h"

#import "SCTableView.h"

@interface HomeViewController ()<SCTableViewDelegate>{
    
    SCTableView *_homeTableView;
}

@property (nonatomic ,strong)NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _homeTableView = [[SCTableView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT)];
    _homeTableView.cellHeight = 130;
    [_homeTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"HomeTableViewCell"];
    _homeTableView.tableDelegate = self;
    [self.view addSubview:_homeTableView];
    
    //    [_homeTableView addHeaderRefresh];
    //    [_homeTableView addFooterLoadMore];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animate {
    
    self.navigationController.navigationBar.barTintColor = [UIColor flatWhiteColor];
    
    HomeDataModel *model = [[HomeDataModel alloc] init];
    for (int i = 0; i<4; i++) {
        
        model.dataImageStr = @"placeholder";
        model.titleLabelStr = @"测试";
        [_homeTableView.dataArray addObject:model];
    }
    [_homeTableView reloadData];

//    NSLog(@"===%@",model.dataImageStr);
}



#pragma mark -- tableViewDelegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.navigationController.navigationBar.barTintColor = [UIColor flatRedColor];
    DetailHomeViewController *detailHomeVC = [[DetailHomeViewController alloc] init];
    [self.navigationController pushViewController:detailHomeVC animated:detailHomeVC];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
