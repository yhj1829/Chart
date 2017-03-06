//
//  WaveChartViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "WaveChartViewController.h"

@interface WaveChartViewController ()<ZFGenericChartDataSource,ZFWaveChartDelegate>

@property(nonatomic,strong)ZFWaveChart *waveChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation WaveChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    [self setUp];

    self.waveChart=[[ZFWaveChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height)];
    self.waveChart.dataSource=self;
    self.waveChart.delegate=self;
    self.waveChart.topicLabel.text=@"xx小学各年级人数";
    self.waveChart.unit=@"人";
    self.waveChart.topicLabel.textColor=ZFPurple;
    self.waveChart.isAnimated=YES;
    [self.waveChart strokePath];
    [self.view addSubview:self.waveChart];

}

-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
     return @[@"123", @"256", @"300", @"283", @"490", @"236", @"401", @"356", @"270", @"369", @"463", @"399"];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart
{
     return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级", @"初一", @"初二", @"初三", @"高一", @"高二", @"高三"];
}

-(CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart
{
    return 500;
}

-(NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart
{
    return kmargin;
}

-(UIColor *)pathColorInWaveChart:(ZFWaveChart *)waveChart
{
    return ZFGrassGreen;
}

-(void)waveChart:(ZFWaveChart *)waveChart popoverLabelAtIndex:(NSInteger)index
{
    NSLog(@"第%ld个label",(long)index);
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
        self.waveChart.frame=CGRectMake(0,0,size.width,size.height-NAVIGATIONBAR_HEIGHT*.5);
    }
    else
    {
        self.waveChart.frame=CGRectMake(0,0,size.width,size.height+NAVIGATIONBAR_HEIGHT*.5);
    }

    [self.waveChart strokePath];
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
