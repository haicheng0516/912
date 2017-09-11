//
//  SCNoDataView.h
//  912
//
//  Created by Seacity on 2017/9/11.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SCNoDataActionBlock)(void);

@interface SCNoDataView : UIView

@property (nonatomic ,copy) SCNoDataActionBlock noDataActionBlock;

@end
