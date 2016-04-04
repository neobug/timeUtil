//
//  ViewController.m
//  timeFotmatter
//
//  Created by neobug on 16/4/4.
//  Copyright © 2016年 neobug. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    //设定时间格式,这里可以设置成自己需要的格式
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //    //输出格式为：2010-10-27 10:22:13
    //    NSLog(@"%@",currentDateStr);
    
    
    NSDate *datenow = [NSDate date];
    NSString *s2 = [NSString stringWithFormat:@"%.f",[datenow timeIntervalSince1970] - 60*60*48];
    NSLog(@"~~~~%@",s2);
    
    NSString *s =  [self timeContrast:s2];//@"1459406857"];
    NSLog(@"s = %@",s);
}


//输入时间戳 对应的字符串 如:1459406857; 返回对应格式的时间(跟当前时间做对比)
- (NSString *)timeContrast:(NSString *)update_at {
    
    //获取当前时间
    NSDate *dateNow = [NSDate date];
    NSString *timeStampNow = [NSString stringWithFormat:@"%.f",[dateNow timeIntervalSince1970]];
    
    
    float time = (float)([timeStampNow intValue] - [update_at intValue]);
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"HH:mm"];
    
    
    NSString *s = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[update_at intValue]]]];
    
    if (time/3600 <24.0) {
        if (time/60 < 1.0){
            s = [NSString stringWithFormat:@"刚刚"];
            
        }else if (time/60<60 && time/60 >= 1.0) {
            float minute = time/60;
            s = [NSString stringWithFormat:@"%.f分钟前",minute];
        }else if (time/60 >=60) {
            float hour = time/3600;
            s = [NSString stringWithFormat:@"%.f小时前",hour];
            
            
        }
        
        
    }else if (time/3600>=24.0 && time/3600<48.0) {
        
        s = [NSString stringWithFormat:@"昨天 %@",s];
        
        
    }else if (time/3600 >=48.0 && time/3600 <72) {
        s = [NSString stringWithFormat:@"前天 %@",s];
        
        
    }else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        s = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[update_at intValue]]]];
        
    }
    return s;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
