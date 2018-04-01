//
//  ViewController.m
//  UIWebView
//
//  Created by HanYong on 2018/4/1.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    _webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    [self loadRequestWithURL:@"https://www.baidu.com"];
}


//加载网页内容
-(void)loadRequestWithURL:(NSString *)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];////创建URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url];////创建NSURLRequest
    [_webView loadRequest:request];
}

//加载本地资源
-(void)loadURLWithPath:(NSString *)path{
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

//UIWebView 还支持将一个NSString对象作为源来加载
-(void)loadHTMLString:(NSString *)html{
    [_webView loadHTMLString:html baseURL:[NSURL URLWithString:@""]];
}

#pragma mark -- UIWebViewDelegate

//即将加载某个请求的时候调用
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"即将加载");
    return YES;
}

//1.开始加载网页的时候调用
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"开始");
}

//2.加载完成的时候调用
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"结束");
    
//    CGRect rect = webView.frame;
//    NSString *fitHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"];
//
//    rect.size.height = [fitHeight floatValue];
//    webView.frame = rect;
}

//3.加载失败的时候调用
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSLog(@"失败");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
