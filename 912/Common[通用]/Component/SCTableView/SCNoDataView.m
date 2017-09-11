//
//  SCNoDataView.m
//  912
//
//  Created by Seacity on 2017/9/11.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import "SCNoDataView.h"

@implementation SCNoDataView


-(instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *nilDataImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        nilDataImage.frame = CGRectMake(FULL_SCREEN_WIDTH/3, 80, FULL_SCREEN_WIDTH/3, FULL_SCREEN_HEIGHT/8);
        
        UILabel *nilDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(FULL_SCREEN_WIDTH/3+5, 80+FULL_SCREEN_HEIGHT/8, FULL_SCREEN_WIDTH/2, 40)];
        nilDataLabel.text = @"很抱歉,暂无结果";
        nilDataLabel.font = [UIFont systemFontOfSize:15];
        nilDataLabel.textColor = [UIColor flatPinkColor];
        
        self.hidden = NO;
        [self addSubview:nilDataLabel];
        [self addSubview:nilDataImage];
    }
    return self;
}






@end
