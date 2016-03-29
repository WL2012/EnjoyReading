//
//  ERNationalNewsCell.h
//  EnjoyReading
//
//  Created by 王亮 on 16/3/10.
//  Copyright (c) 2016年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ERTechnologyNews;
@interface ERTechnologyNewsCell : UITableViewCell
/** 新闻模型 */
@property (nonatomic, strong) ERTechnologyNews *technologyNews;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
