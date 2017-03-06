//
//  MultiHorizontalBarChartViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "MultiHorizontalBarChartViewController.h"

@interface MultiHorizontalBarChartViewController ()<ZFGenericChartDataSource,ZFHorizontalBarChartDelegate>

@property(nonatomic,strong)ZFHorizontalBarChart *barChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation MultiHorizontalBarChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    [self setUp];

    self.barChart=[[ZFHorizontalBarChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height)];
    self.barChart.dataSource=self;
    self.barChart.delegate=self;
    self.barChart.topicLabel.text=@"xx小学各年级男女人数";
    self.barChart.unit=@"人";
    self.barChart.topicLabel.textColor=ZFPurple;
    self.barChart.valueLabelPattern=kPopoverLabelPatternBlank;
    self.barChart.isAnimated=YES;
    [self.barChart strokePath];
    [self.view addSubview:self.barChart];

}

-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
     return @[@[@"123", @"500", @"490", @"380", @"167", @"235"],
              @[@"256", @"283", @"236", @"240", @"183", @"200"],
              @[@"256", @"256", @"256", @"256", @"256", @"256"]];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级"];
}

-(NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart
{
     return @[ZFColor(125, 229, 255, 1),
              ZFColor(254, 199, 116, 1),
              ZFColor(185, 255, 122, 1)];
}

-(CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart
{
    return 500;
}

-(id)valueTextColorArrayInHorizontalBarChart:(ZFHorizontalBarChart *)barChart
{
    return ZFBlue;
}

-(void)horizontalBarChart:(ZFHorizontalBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex
{
    NSLog(@"第%ld个颜色中的第%ld个",(long)groupIndex,(long)barIndex);
}

-(void)horizontalBarChart:(ZFHorizontalBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex
{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
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
