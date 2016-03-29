//
//  ERNationalNewsCell.m
//  EnjoyReading
//
//  Created by 王亮 on 16/3/10.
//  Copyright (c) 2016年 wangliang. All rights reserved.
//

#import "ERTravelNewsCell.h"
#import "ERTravelNews.h"
#import "UIImageView+WebCache.h"


@interface ERTravelNewsCell()
/**  标题 */
@property (nonatomic, weak) UILabel *titleLabel;
/**  时间 */
@property (nonatomic, weak) UILabel *ctimeLabel;
/**  来源 */
@property (nonatomic, weak) UILabel *erdescriptionLabel;
/**  图片 */
@property (nonatomic, weak) UIImageView *pictureView;
/**  分隔线 */
@property (nonatomic, weak) UIView *spView;

@end

@implementation ERTravelNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化子控件
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = NewsTitleFont;
        titleLabel.numberOfLines = 0;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        
        UILabel *ctimeLabel = [[UILabel alloc] init];
        ctimeLabel.font = NewsCtimeFont;
        ctimeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:ctimeLabel];
        self.ctimeLabel = ctimeLabel;
        
        UILabel *erdescriptionLabel = [[UILabel alloc] init];
        erdescriptionLabel.font = NewsErdescriptionFont;
        erdescriptionLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:erdescriptionLabel];
        self.erdescriptionLabel = erdescriptionLabel;
        
        UIView *spView = [[UIView alloc] init];
        spView.backgroundColor = [UIColor grayColor];
        spView.alpha = 0.4;
        [self.contentView addSubview:spView];
        self.spView = spView;
        
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"nationalNews";
    ERTravelNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ERTravelNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(void)setTravelNews:(ERTravelNews *)travelNews
{
    _travelNews = travelNews;
    
    [self setupFrames];
    
    self.titleLabel.text = travelNews.title;
    
    if (travelNews.picUrl.length) {
        self.pictureView.hidden = NO;
        [self.pictureView sd_setImageWithURL:[NSURL URLWithString:travelNews.picUrl]];
    }else{
        self.pictureView.hidden = YES;
    }
    self.ctimeLabel.text = travelNews.ctime;
    self.erdescriptionLabel.text = travelNews.erdescription;
    
}

- (void)setupFrames
{
    // 标题
    CGFloat titleLabelX = NewsCellMargin;
    CGFloat titleLabelY = NewsCellMargin;
    CGFloat titleLabelW = [UIScreen mainScreen].bounds.size.width - 2 * NewsCellMargin;
    CGSize titleLabelSize = [_travelNews.title boundingRectWithSize:CGSizeMake(titleLabelW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:NewsTitleFont} context:nil].size;
    self.titleLabel.frame = (CGRect){{titleLabelX,titleLabelY},titleLabelSize};
    
    if (self.travelNews.picUrl.length){
        // 图片
        CGFloat pictureViewW = 119;
        CGFloat pictureViewH = 83;
        CGFloat pictureViewX = titleLabelX;
        CGFloat pictureViewY = CGRectGetMaxY(self.titleLabel.frame) + NewsCellMargin;
        self.pictureView.frame = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        // 描述
        CGFloat erdescriptionLabelX = NewsCellMargin;
        CGFloat erdescriptionLabelY = CGRectGetMaxY(self.pictureView.frame) + NewsCellMargin;
        CGSize erdescriptionLabelSize = [_travelNews.erdescription sizeWithAttributes:@{NSFontAttributeName:NewsErdescriptionFont}];
        self.erdescriptionLabel.frame = (CGRect){{erdescriptionLabelX,erdescriptionLabelY},erdescriptionLabelSize};
        
        // 时间
        CGFloat ctimeLabelX = CGRectGetMaxX(self.erdescriptionLabel.frame) + NewsCellMargin;
        CGFloat ctimeLabelY = erdescriptionLabelY;
        CGSize ctimeLabelSize = [_travelNews.ctime sizeWithAttributes:@{NSFontAttributeName:NewsCtimeFont}];
        self.ctimeLabel.frame = (CGRect){{ctimeLabelX,ctimeLabelY},ctimeLabelSize};
        
        // 分隔线
        self.spView.frame = CGRectMake(0, CGRectGetMaxY(self.ctimeLabel.frame) + NewsCellMargin * 0.5, [UIScreen mainScreen].bounds.size.width, 1);
        self.travelNews.cellHeight = CGRectGetMaxY(self.spView.frame);
        
    }else{
        // 描述
        CGFloat erdescriptionLabelX = NewsCellMargin;
        CGFloat erdescriptionLabelY = CGRectGetMaxY(self.titleLabel.frame) + NewsCellMargin;
        CGSize erdescriptionLabelSize = [_travelNews.erdescription sizeWithAttributes:@{NSFontAttributeName:NewsErdescriptionFont}];
        self.erdescriptionLabel.frame = (CGRect){{erdescriptionLabelX,erdescriptionLabelY},erdescriptionLabelSize};
        
        // 时间
        CGFloat ctimeLabelX = CGRectGetMaxX(self.erdescriptionLabel.frame) + NewsCellMargin;
        CGFloat ctimeLabelY = erdescriptionLabelY;
        CGSize ctimeLabelSize = [_travelNews.ctime sizeWithAttributes:@{NSFontAttributeName:NewsCtimeFont}];
        self.ctimeLabel.frame = (CGRect){{ctimeLabelX,ctimeLabelY},ctimeLabelSize};
        
        // 分隔线
        self.spView.frame = CGRectMake(0, CGRectGetMaxY(self.ctimeLabel.frame) + NewsCellMargin * 0.5, [UIScreen mainScreen].bounds.size.width, 1);
        self.travelNews.cellHeight = CGRectGetMaxY(self.spView.frame);
        
    }
}
@end
