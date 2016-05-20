//
//  CustomListTableViewCell.h
//  MasonryFirDemo
//
//  Created by shavekevin on 16/4/25.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "SKBaseTableViewCell.h"
@class SKCustomListModel;
@interface CustomListCell : SKBaseTableViewCell
/**
 *  model
 */
@property (nonatomic, strong) SKCustomListModel *model;;

@end
