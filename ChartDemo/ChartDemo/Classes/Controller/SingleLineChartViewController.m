//
//  SingleLineChartViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "SingleLineChartViewController.h"

#import "ZFChart.h"

@interface SingleLineChartViewController ()<ZFGenericChartDataSource,ZFLineChartDelegate>

@property(nonatomic,strong)ZFLineChart *lineChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation SingleLineChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    [self setUp];

    self.lineChart=[[ZFLineChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height)];
    self.lineChart.dataSource=self;
    self.lineChart.delegate=self;
    self.lineChart.topicLabel.text=@"xx小学各年级男女人数";
    self.lineChart.topicLabel.textColor=ZFPurple;
    self.lineChart.isResetAxisLineMinValue=YES;
    self.lineChart.unit=@"人";
    self.lineChart.isAnimated=YES;
    self.lineChart.isShowSeparate=NO;
    self.lineChart.unitColor=ZFWhite;
    self.lineChart.backgroundColor=ZFPurple;
    self.lineChart.axisColor=ZFWhite;
    self.lineChart.axisLineNameColor=ZFWhite;
    self.lineChart.axisLineValueColor=ZFWhite;

    [self.lineChart strokePath];

    [self.view addSubview:self.lineChart];

}

-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
    return  @[@"123", @"256", @"-157", @"350", @"490", @"236"];
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

-(CGFloat)axisLineMinValueInGenericChart:(ZFGenericChart *)chart
{
    return -200;
}

-(NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart
{
    return kmargin;
}



-(void)lineChart:(ZFLineChart *)lineChart didSelectCircleAtLineIndex:(NSInteger)lineIndex circleIndex:(NSInteger)circleIndex
{
    NSLog(@"第%ld组--第%ld个",(long)lineIndex,(long)circleIndex);
}

-(void)lineChart:(ZFLineChart *)lineChart didSelectPopoverLabelAtLineIndex:(NSInteger)lineIndex circleIndex:(NSInteger)circleIndex
{
    NSLog(@"第%ld组--第%ld个",(long)lineIndex,(long)circleIndex);
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    if (self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
    {
        self.lineChart.frame=CGRectMake(0,0,size.width,size.height-NAVIGATIONBAR_HEIGHT*.5);
    }
    else
    {
        self.lineChart.frame=CGRectMake(0,0,size.width,size.height+NAVIGATIONBAR_HEIGHT*.5);
    }

    [self.lineChart strokePath];
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
