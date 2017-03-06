//
//  SingleBarChartViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "SingleBarChartViewController.h"
#import "ZFChart.h"

@interface SingleBarChartViewController ()<ZFGenericChartDataSource,ZFBarChartDelegate>

@property(nonatomic,strong)ZFBarChart *barChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation SingleBarChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    self.title = @"ChartDemo";

    [self setUp];

    self.barChart=[[ZFBarChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height-64)];
    self.barChart.dataSource=self;
    self.barChart.delegate=self;
    self.barChart.topicLabel.text=@"xx小学各年级人数";
    self.barChart.unit=@"人";
    self.barChart.isAnimated=NO;
    self.barChart.isShowSeparate=YES;

    [self.view addSubview:self.barChart];
    [self.barChart strokePath];

}

-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[@"123",@"256",@"300",@"283",@"490",@"236"];
}

-(NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级"];
}

-(NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[ZFMagenta];
}


-(CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart
{
    return 500;
}

-(NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart
{
    return kmargin;
}

-(void)barChart:(ZFBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex
{
    NSLog(@"第%ld组--第%ld个",(long)groupIndex,(long)barIndex);
}

-(void)barChart:(ZFBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex
{
    NSLog(@"第%ld组--第%ld个",(long)groupIndex,(long)labelIndex);
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
        self.barChart.frame=CGRectMake(0,0,size.width,size.height-NAVIGATIONBAR_HEIGHT*.5);
    }
    else
    {
       self.barChart.frame=CGRectMake(0,0,size.width,size.height+NAVIGATIONBAR_HEIGHT*.5);
    }

    [self.barChart strokePath];
}

-(void)setUp
{
    if (self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
       // 首次进入控制器为横屏时
        _height=APPH-NAVIGATIONBAR_HEIGHT*.5;
    }
    else
    {
        // 首次进入控制器为竖屏时
        _height=APPH-NAVIGATIONBAR_HEIGHT;
    }
}

@end
