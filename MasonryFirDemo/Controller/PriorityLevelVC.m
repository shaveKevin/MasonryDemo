//
//  PriorityLevelVC.m
//  MasonryFirDemo
//
//  Created by shavekevin on 16/5/20.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "PriorityLevelVC.h"

@interface PriorityLevelVC ()

@end

@implementation PriorityLevelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)separatedString{
    
    NSString *str = @"言承旭:累了不要见外\n把我挖起来\n吐个痛快\n看不惯朋友有难\n谁还冷冷的围观\n我的手心\n为你握起来\n朱孝天:烦了不要见外\n把我找出来\n陪你负担\n吴建豪:续杯咖啡的温暖\n一直暖到你想开\n你心情的坑洞让我来填满\n朱孝天:昨天会被今天明天来取代\n动心的感情不会淘汰\n关心常在\n全体:就算你我再热闹喧哗中走散\n友情会在第一时间赶来\n让跳乱的心情平躺下来\n重新的呼吸简单\n深深的\n满满的\n朋友只要你被孤单压的叫不出来\n我第一时间送出关怀\n热热的眼神陪你看开\n找回那片大自然\n为着你抱紧你相信你\n朱孝天:我确定\n周渝民:累了不要见外\n把我挖起来\n吐个痛快\n看不惯朋友有难\n谁还冷冷的围观\n我的手心\n为你握起来\n珠孝天:烦了不要见外\n把我找出来\n陪你负担\n续杯咖啡的温暖\n一直暖到你想开\n你心情的坑洞让我来填满\n吴建豪:昨天会被今天明天来取代\n动心的感情不会淘汰\n关心常在\n全体:就算你我再热闹喧哗中走散\n友情会在第一时间赶来\n让跳乱的心情平躺下来\n重新的呼吸简单\n深深的\n满满的\n朋友只要你被孤单压的叫不出来\n我第一时间送出关怀\n热热的眼神陪你看开\n找回那片大自然\n为着你抱紧你相信你\n吴建豪:我确定";
    NSArray *array = [str componentsSeparatedByString:@"\n"];
    return array[arc4random()%array.count];
}

@end
