//
//  HomeTableViewCell.m
//  912
//
//  Created by Seacity on 2017/9/11.
//  Copyright © 2017年 Seacity. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeDataModel.h"

@interface HomeTableViewCell(){

    UIImageView *dataImageView;
    UILabel *dataLabel;
}

@end

@implementation HomeTableViewCell


-(instancetype ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void) initView{

    self.frame = CGRectMake(0, 0, FULL_SCREEN_WIDTH, 130);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.mas_top).offset(3);
        make.left.equalTo(self.mas_left).offset(5);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
}


-(void) setDataModel:(HomeDataModel *)dataModel{

    self.dataImage = dataModel.dataImageStr;
//    self.dataLabel = dataModel.titleLabel;
}



@end
