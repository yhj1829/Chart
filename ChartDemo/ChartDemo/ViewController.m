//
//  ViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "ViewController.h"
#import "SingleBarChartViewController.h"
#import "MultiBarCharViewController.h"
#import "SingleLineChartViewController.h"
#import "MultiLineChartViewController.h"
#import "PieChartViewController.h"
#import "WaveChartViewController.h"
#import "SingleHorizontalBarChartViewController.h"
#import "MultiHorizontalBarChartViewController.h"

static NSString *tableViewCellIdentifier=@"TableViewCellIdentifier";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"ChartDemo";

    self.automaticallyAdjustsScrollViewInsets=NO;

    self.view.backgroundColor=[UIColor lightGrayColor];

    [self.view addSubview:self.tableView];

}


// tableView
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,64,APPW,APPH-64) style:UITableViewStylePlain];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        self.tableView.tableFooterView=[UIView new];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
    }
    return _tableView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    NSArray *arr=@[@"SingleBarChartViewController",@"MultiBarCharViewController",@"SingleLineChartViewController",@"MultiLineChartViewController",@"PieChartViewController",@"WaveChartViewController",@"SingleHorizontalBarChartViewController",@"MultiHorizontalBarChartViewController"];

    cell.textLabel.text=arr[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kmargin*5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row==0)
    {
        [self.navigationController pushViewController:[SingleBarChartViewController new] animated:NO];
    }
    else if (indexPath.row==1)
    {
        [self.navigationController pushViewController:[MultiBarCharViewController new] animated:NO];
    }
     else if (indexPath.row==2)
    {
        [self.navigationController pushViewController:[SingleLineChartViewController new] animated:NO];
    }
     else if (indexPath.row==3)
     {
         [self.navigationController pushViewController:[MultiLineChartViewController new] animated:NO];
     }
     else if (indexPath.row==4)
     {
         [self.navigationController pushViewController:[PieChartViewController new] animated:NO];
     }
     else if (indexPath.row==5)
     {
         [self.navigationController pushViewController:[WaveChartViewController new] animated:NO];
     }
     else if (indexPath.row==6)
     {
         [self.navigationController pushViewController:[SingleHorizontalBarChartViewController new] animated:NO];
     }
     else
     {
         [self.navigationController pushViewController:[MultiHorizontalBarChartViewController new] animated:NO];
     }
}


// 间隙置边
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if ([tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }

    if ([tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }

    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
