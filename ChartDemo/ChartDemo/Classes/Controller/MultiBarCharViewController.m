//
//  MultiBarCharViewController.m
//  ChartDemo
//
//  Created by yhj on 2017/3/6.
//  Copyright © 2017年 cdnunion. All rights reserved.
//

#import "MultiBarCharViewController.h"
#import "ZFChart.h"

@interface MultiBarCharViewController ()<ZFGenericChartDataSource,ZFBarChartDelegate>

@property(nonatomic,strong)ZFBarChart *barChart;

@property(nonatomic,assign)CGFloat height;

@end

@implementation MultiBarCharViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;

    [self setUp];

    self.barChart=[[ZFBarChart alloc]initWithFrame:CGRectMake(0,64,APPW,_height)];
    self.barChart.dataSource=self;
    self.barChart.delegate=self;
    self.barChart.topicLabel.text=@"xx小学各年级男女人数";
    self.barChart.topicLabel.textColor=ZFWhite;
    self.barChart.unit=@"人";
    self.barChart.isAnimated=YES;
    self.barChart.isShowSeparate=NO;
    self.barChart.unitColor=ZFWhite;
    self.barChart.backgroundColor=ZFPurple;
    self.barChart.axisColor=ZFWhite;
    self.barChart.axisLineNameColor=ZFWhite;
    self.barChart.axisLineValueColor=ZFWhite;

     [self.barChart strokePath];

    [self.view addSubview:self.barChart];

}

-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
      return @[   @[@"123", @"300", @"490", @"380", @"167", @"235"],
                  @[@"256", @"283", @"236", @"240", @"183", @"200"],
                  @[@"256", @"256", @"256", @"256", @"256", @"256"],
                  @[@"156", @"356", @"256", @"456", @"206", @"356"]
                  ];
}

-(NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级"];
}

-(NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[ZFColor(71, 204, 255, 1),
             ZFColor(253, 203, 76, 1),
             ZFColor(16, 140, 39, 1),
             ZFColor(216, 140, 39, 1)];
}


-(CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart
{
    return 500;
}

-(NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart
{
    return kmargin;
}

-(id)valueTextColorArrayInBarChart:(ZFBarChart *)barChart
{
    return ZFBlue;
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
