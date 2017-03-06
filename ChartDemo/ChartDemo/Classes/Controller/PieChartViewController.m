//
//  PieChartViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "PieChartViewController.h"

@interface PieChartViewController ()<ZFPieChartDataSource,ZFPieChartDelegate>

@property(nonatomic,strong)ZFPieChart *pieChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation PieChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    [self setUp];

    self.pieChart=[[ZFPieChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height)];
    self.pieChart.dataSource=self;
    self.pieChart.delegate=self;
    self.pieChart.isAnimated=YES;
    [self.pieChart strokePath];
    [self.view addSubview:self.pieChart];

}

-(NSArray *)valueArrayInPieChart:(ZFPieChart *)pieChart
{
     return @[@"300", @"256", @"300", @"483", @"490", @"236"];
}

- (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart{
    return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1), ZFColor(214, 205, 153, 1), ZFColor(78, 250, 188, 1), ZFColor(16, 140, 39, 1), ZFColor(45, 92, 34, 1)];
}

#pragma mark - ZFPieChartDelegate

- (void)pieChart:(ZFPieChart *)pieChart didSelectPathAtIndex:(NSInteger)index{
    NSLog(@"第%ld个",(long)index);
}

- (CGFloat)radiusForPieChart:(ZFPieChart *)pieChart{
    return 150.f;
}

/** 此方法只对圆环类型(kPieChartPatternTypeForCirque)有效 */
- (CGFloat)radiusAverageNumberOfSegments:(ZFPieChart *)pieChart{
    return 2.f;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
        self.pieChart.frame=CGRectMake(0,0,size.width,size.height-NAVIGATIONBAR_HEIGHT*.5);
    }
    else
    {
        self.pieChart.frame=CGRectMake(0,0,size.width,size.height+NAVIGATIONBAR_HEIGHT*.5);
    }

    [self.pieChart strokePath];
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
