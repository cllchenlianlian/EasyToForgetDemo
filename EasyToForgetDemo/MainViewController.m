//
//  MainViewController.m
//  EasyToForgetDemo
//
//  Created by 陈莲莲 on 16/8/17.
//  Copyright © 2016年 cll. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewModel.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *mainTableView;
@property(nonatomic, strong)NSMutableArray *dateMutableArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView              = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mainTableView.delegate     = self;
    self.mainTableView.dataSource   = self;
    [self.view addSubview:self.mainTableView];
    [self initDate];
}

- (void)initDate{
    NSArray *titlesArray            = @[@"NSAttributedString",@"TextField抖动效果",@"TextField-PlaceHolderColor"];
    NSArray *VCArray                = @[@"OneViewController",@"TwoViewController",@"ThreeViewController"];
    self.dateMutableArray           = [NSMutableArray array];
    NSInteger index                 = 0;
    for (NSString *title in titlesArray) {
        TableViewModel *model       = [[TableViewModel alloc]init];
        model.title                 = title;
        model.VCName                = VCArray[index++];
        [self.dateMutableArray addObject:model];
    }
}

#pragma mark ---- TableViewDataSource&&TableViewDelegate ---

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dateMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndentifier];
    }
    TableViewModel *model = self.dateMutableArray[indexPath.row];
    cell.textLabel.text   = model.title;
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewModel *model = self.dateMutableArray[indexPath.row];
    Class vcClass = NSClassFromString(model.VCName);
    UIViewController *vc  = [[vcClass alloc]init];
    vc.title              = model.title;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
