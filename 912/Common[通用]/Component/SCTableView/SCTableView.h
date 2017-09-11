//
//  SCTableView.h
//  912
//
//  Created by Seacity on 2017/9/6.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  SCTableViewDelegate <NSObject>

@optional

-(void) didSelectTableRow:(NSIndexPath *)indexPath;
-(void)didNoDataAction;
-(void)pullRefreshData; //下拉刷新
-(void)pullLoadMoreData;    //上拉加载更多

@end

@interface SCTableView : UITableView

@property (nonatomic ,assign) id<SCTableViewDelegate> tableDelegate;

@property (nonatomic ,strong) NSMutableArray *dataArray;    //数据源

@property (nonatomic ,assign) CGFloat cellHeight;   //cell高度

@property (nonatomic ,assign) BOOL hasNoDataView;   //无数据时 是否显示视图

//下拉上拉
-(void) addHeaderRefresh;
-(void) addFooterLoadMore;
-(void) endHeaderRefresh;
-(void) endFooterLoadMore;
-(void) endRefreshingWithNoMoreData;
-(void) resetNoMoreData;

@end
