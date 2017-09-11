//
//  SCTableView.m
//  912
//
//  Created by Seacity on 2017/9/6.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import "SCTableView.h"
#import "MJRefresh.h"
#import "SCTableViewCell.h"
#import "SCNoDataView.h"

#define WeakSelf __weak typeof(self) weakSelf = self;

@interface SCTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSString *cellIdentifier;
@property (nonatomic ,strong) UITableViewCell *noDataCell;

@end
@implementation SCTableView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        //清除没有数据cell的横线
        self.tableFooterView = [[UIView alloc] init];
        
        self.backgroundView = nil;
        [self setBackgroundColor:[UIColor clearColor]];
        self.separatorColor= [UIColor clearColor];
        self.separatorStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


#pragma mark 懒加载
-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataArray;
}

#pragma mark 注册
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
    [super registerClass:cellClass forCellReuseIdentifier:identifier];
}

#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.hasNoDataView && self.dataArray.count == 0) {//无数据时
        return 1;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.hasNoDataView && self.dataArray.count == 0) {//无数据时
        return self.cellHeight;
    }
    return self.cellHeight;
}


//绘制Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.hasNoDataView && self.dataArray.count == 0) {//无数据时
        return self.noDataCell;
    }
    
    //如果在重用队列里面没有可重用的cell就自动创建一个cell,无需人工alloc
    SCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    //去除选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(self.dataArray.count > 0){
        id dataModel = [self.dataArray objectAtIndex:indexPath.row];
        if ([cell respondsToSelector:@selector(setDataModel:)]) {
            [cell performSelectorOnMainThread:@selector(setDataModel:) withObject:dataModel waitUntilDone:YES];
        }
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.hasNoDataView && self.dataArray.count == 0) {//无数据时
        return;
    }
    
    if (_tableDelegate && [_tableDelegate respondsToSelector:@selector(didSelectTableRow:)]) {
        [_tableDelegate didSelectTableRow:indexPath];
    }
}

- (UITableViewCell *)noDataCell {
    if (!_noDataCell) {
        _noDataCell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT)];
        _noDataCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        SCNoDataView *view = [[SCNoDataView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT)];
        [_noDataCell addSubview:view];
        
        WeakSelf
        view.noDataActionBlock = ^(){
            if (weakSelf.tableDelegate && [weakSelf.tableDelegate respondsToSelector:@selector(didNoDataAction)]) {
                [weakSelf.tableDelegate didNoDataAction];
            }
        };
    }
    return _noDataCell;
}

#pragma mark 下拉上拉
-(void)addHeaderRefresh{
    WeakSelf
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (weakSelf.tableDelegate && [weakSelf.tableDelegate respondsToSelector:@selector(pullRefreshData)]) {
            [weakSelf.tableDelegate pullRefreshData];
        }
    }];
}

-(void)addFooterLoadMore{
    WeakSelf
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (weakSelf.tableDelegate && [weakSelf.tableDelegate respondsToSelector:@selector(pullLoadMoreData)]) {
            [weakSelf.tableDelegate pullLoadMoreData];
        }
    }];
}

-(void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

-(void)endFooterLoadMore{
    [self.mj_footer endRefreshing];
}

-(void)endRefreshingWithNoMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}

-(void)resetNoMoreData{
    [self.mj_footer resetNoMoreData];
}



@end
