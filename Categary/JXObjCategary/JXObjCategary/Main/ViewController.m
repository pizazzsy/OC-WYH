//
//  ViewController.m
//  JXObjCategary
//
//  Created by hnbwyh on 2018/7/16.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

#import "ViewController.h"
#import "DesTableViewCell.h"
#import "DataManager.h"
#import "Data1Model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView            *listTable;
@property (nonatomic,strong) DataManager            *dataManager;
@property (nonatomic,strong) NSMutableArray         *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.listTable registerClass:[DesTableViewCell class] forCellReuseIdentifier:NSStringFromClass([DesTableViewCell class])];
    [self.view addSubview:self.listTable];
    [self loadDataSource];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor                                       = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent             = FALSE;
}

#pragma mark ------ delegate

#pragma mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSMutableArray *data = self.listData.firstObject;
    return data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *data = self.listData.lastObject;
    return data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *data = self.listData.lastObject;
    Data1Model *f = data[indexPath.row];
    return f.cellHeight;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSMutableArray *data = self.listData.firstObject;
    return data[section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DesTableViewCell *cell      = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DesTableViewCell class])];
    NSMutableArray *data = self.listData.lastObject;
    Data1Model *f = data[indexPath.row];
    cell.textLabel.text         = f.cntDetail;
    return cell;
}

#pragma mark ------ private method

- (void)loadDataSource{
    [self.listData removeAllObjects];
    NSArray *arr = [self.dataManager loadListDataSource];
    [self.listData addObjectsFromArray:arr];
    [self.listTable reloadData];
}

#pragma mark ------ lazy load

-(UITableView *)listTable{
    if (!_listTable) {
        CGRect rect = self.view.bounds;
        rect.origin = CGPointZero;
        _listTable = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        _listTable.delegate         = self;
        _listTable.dataSource       = self;
    }
    return _listTable;
}

-(DataManager *)dataManager{
    if (!_dataManager) {
        _dataManager = [[DataManager alloc] init];
    }
    return _dataManager;
}

-(NSMutableArray *)listData{
    if (!_listData) {
        _listData = [[NSMutableArray alloc] init];
    }
    return _listData;
}

@end