//
//  CustomListViewController.m
//  MasonryFirDemo
//
//  Created by shavekevin on 16/4/25.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "CustomListVC.h"

static NSString *const cellIdentifier = @"cellIdentifier";

@interface CustomListVC ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSourceArr;
/**
 *  临时cell
 */
@property (nonatomic, strong) CustomListCell *tempCell;

@end


@implementation CustomListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    SKCustomListModel * model = [self.dataSourceArr objectAtIndex:indexPath.row];
    [cell setModel:model];
    [cell layOutViews];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    cell.contentView.backgroundColor =  [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKCustomListModel * model = [self.dataSourceArr objectAtIndex:indexPath.row];
    [self.tempCell setModel:model];
    if (model.cellHeight <= 0) {
        return [self.tempCell calculateHeight];
    }
    return model.cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

#pragma mark |----- lazy load
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CustomListCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}
- (CustomListCell *)tempCell {
    if (!_tempCell) {
        _tempCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    return _tempCell;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        
        NSString * str = @"sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； sdklahdlahsdl;hsadhioqhwdoihoid;shai极好的；啊哈哈上登陆撒谎的拉开；导航栏；按说的撒肯定会来撒会带来；傻掉了；啥都上课的挥洒；来看待和拉萨客户端来看撒谎的其实偶怕；发货吧；石板房；拉萨；大厦；啥的；啥领导力；啥的；拉伸的；阿萨德了；hash； ";
        
        _dataSourceArr = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            SKCustomListModel * model = [[SKCustomListModel alloc] init];
            model.hasTag = (i % 3 == 2);
            model.title = [NSString stringWithFormat:@"%zd%@", i, [str substringToIndex:i]];
            model.content = [str substringFromIndex:i];
            model.hasPic = (i % 5 == 3);
            model.type = ((i % 2 == 0) ? 1 : 2);
            [_dataSourceArr addObject:model];
        }
    }
    return _dataSourceArr;
}

@end
