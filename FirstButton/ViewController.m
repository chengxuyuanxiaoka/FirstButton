//
//  ViewController.m
//  FirstButton
//
//  Created by 一米阳光 on 16/12/30.
//  Copyright © 2016年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButton];
    
    [self addImageForButton];
    
    [self addTargetBtn];
}

//创建按钮
- (void)createButton {
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //1.设置显示位置
    button1.frame = CGRectMake(150, 30, 100, 20);
    //2.默认为白色,设置为绿色
    button1.backgroundColor = [UIColor greenColor];
    /**
     *  3.为按钮添加标题
     *  UIControlStateNormal 常态 就是不做任何点击操作的时候的状态
     *  UIControlStateHighlighted 高亮 长按按钮不抬起的时候的状态
     *  UIControlStateSelected 被选择 一直处于按下的状态
     */
    [button1 setTitle:@"点我" forState:UIControlStateNormal];
    //4.点击改变按钮文字颜色
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button1];
}

//两种为按钮添加背景图的方式
- (void)addImageForButton {
    /**
     *  如果图片的大小大于按钮的大小 图片就会压缩(不是等比例压缩 是按照按钮的宽高进行拉伸)
     *  如果图片的大小小于按钮的大小图片就会按照按钮的大小(宽高)进行扩展
     */
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100, 70, 200, 50);
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    /**
     *  使用图片类UIImage,为按钮添加背景图片
     *  图片的名称必须带有后缀 --- png图片的后缀是可以省略的,但是jpg等其他类型的图片后缀不可省略，否则添加的图片不成功
     */
    UIImage * image = [UIImage imageNamed:@"background_image"];
    [button2 setBackgroundImage:image forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    
    
    /**
     *  获取的图片大小后，按获取的尺寸为按钮添加背景图，能确保添加的图片不失真 所以经常使用该方法定义图片按钮。
     */
    UIImage * image2 = [UIImage imageNamed:@"background_image"];
    //先获取这张图有多大
    CGSize size_image = image2.size;
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(50, 130, size_image.width, size_image.height);
    [button3 setTitle:@"图片尺寸" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button3 setBackgroundImage:image2 forState:UIControlStateNormal];
    [button3 setImage:[UIImage imageNamed:@"background_highlighted_image"] forState:UIControlStateHighlighted];
    [self.view addSubview:button3];
}

//触发按钮点击事件
- (void)addTargetBtn {
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setImage:[UIImage imageNamed:@"background_image"] forState:UIControlStateNormal];
    button4.frame = CGRectMake(100, 310, 200, 30);
    /**
     *  第一个参数：添加的是对象指针,action后面的方法在哪个类中实现 此处就添加哪个类的对象指针（一般情况下 此处添加的都是self）
     *  第二个参数：按钮的触发事件,方法的名称
     *  第三个参数：触发方法的事件,添加的是以什么形式触发按钮从而调用action后面的方法(最常用到的方法   UIControlEventTouchUpInside)
     */
    [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    /**
     *  设置控件的唯一标识
     *  tag:所有的控件都具有的属性,所有的控件的tag值,系统默认都为0
     */
    button4.tag = 101;
    [self.view addSubview:button4];
    
    
    UIButton * button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(100, 360, 200, 30);
    [button5 setImage:[UIImage imageNamed:@"background_image"] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button5 addTarget:self action:@selector(buttonClickWithDown:) forControlEvents:UIControlEventTouchDown];
    button5.tag = 102;
    [self.view addSubview:button5];
}

- (void)buttonClick:(UIButton *)button {
    if (button.tag == 101) {
        self.view.backgroundColor = [UIColor redColor];
    } else if (button.tag == 102) {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

- (void)buttonClickWithDown:(UIButton *)button {
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
