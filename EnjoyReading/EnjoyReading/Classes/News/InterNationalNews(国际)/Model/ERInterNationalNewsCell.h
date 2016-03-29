//
//  ERNationalNewsCell.h
//  EnjoyReading
//
//  Created by 王亮 on 16/3/10.
//  Copyright (c) 2016年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ERInterNationalNews;
@interface ERInterNationalNewsCell : UITableViewCell
/** 国际新闻模型 */
@property (nonatomic, strong) ERInterNationalNews *interNationalNews;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
