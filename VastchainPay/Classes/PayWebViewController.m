//
//  PayWebViewController.m
//  VastchainPay
//
//  Created by cxd on 2022/5/5.
//

#import <Foundation/Foundation.h>
#import "PayWebViewController.h"
#import "JsApi.h"
#import "IJsBridge.h"
#import "WXApi.h"


@interface PayWebViewController () {
    
}

@property(nonatomic,strong)IJsBridge *jsBridge;

@end

@implementation PayWebViewController

- (void)viewDidLoad {
    NSLog(@"HELLO");
    
    [self initWebView];
    [self initWx];
    [self pay:@"11" prepareId:@"22" nonceStr:@"11" timeStamp:@"22" sign:@"11"];
}

- (id)initWithUrl:(NSString *)url {
    self = [super init];
    if (self){
        self.mUrl = url;
    }
    return self;
}


- (void)initWebView {
    NSLog(@"height:%f",self.view.bounds.size.height);
    CGFloat height = [[UIApplication sharedApplication] statusBarFrame].size.height;
    self.myWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, height+44, self.view.bounds.size.width, self.view.bounds.size.height - (height+44))];
    //    NSString *url = @"http://10.159.179.214:8000";
    //    NSString *url = @"http://10.150.229.13:8000";
    //    NSString *url = @"http://10.155.87.121:10086/#/subPackage/warehouseManage/pages/wareHouseOperation/index?token=MmoXuOXOnvy8_r0Qstk4al1pHgdq-mmH&orgID=139723245184659456";
    //    NSString *url = @"http://www.baidu.com";
    NSString *url = self.mUrl;
    NSLog(@"url:%@", url);
//    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
//                                stringByAppendingPathComponent:@"/VastchainPlugin.bundle"];
//    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
//    NSString *jspath = [resource_bundle pathForResource:@"log.js" ofType:nil];
//    NSLog(@"jspath:%@", jspath);
//    NSString *javaScriptSource = [NSString stringWithContentsOfFile:jspath encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"ScriptSource:%@", javaScriptSource);
//    
//    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:javaScriptSource injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    [self.myWebView.configuration.userContentController addUserScript:userScript];
//    NSString *tmpUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
//    NSLog(@"url:%@", tmpUrl);
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:self.myWebView];
    [self.myWebView.configuration.userContentController addScriptMessageHandler:self name:@"nativeBridge"];
//    [self.myWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];
}

- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
    NSLog(@"111");
    NSLog(@"name:%@", message.name);
    NSLog(@"body:%@", message.body);
    if (![message.name isEqual:@"nativeBridge"]) {
        NSLog(@"2222:%@", message.body);
        return;
    }
    
    if ([message.body hasPrefix:@"log:"]) {
        NSLog(@"h5日志:%@", message.body);
        return;
    }
    
    NSDictionary *body = [self dictionaryWithJsonString:message.body];
    NSString *method = [body objectForKey:@"method"];
    NSLog(@"method:%@", method);
    NSDictionary *params = [body objectForKey:@"params"];
    NSLog(@"params:%@", params);
    if([method isEqualToString:JS_GET_APP_INFO]) {
//        [self.jsBridge getAppInfo:_appData];
    } else if([method isEqualToString:JS_PAY]) {
        [self pay:params];
    }
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void) initWx {
    [WXApi registerApp:@"11" universalLink:@"11"];
}

- (void) pay: (NSDictionary*)dict {
    
}

- (void) pay:(NSString*) partnerId prepareId:(NSString*) prepayId nonceStr:(NSString*) nonceStr timeStamp:(NSString*) timeStamp sign: (NSString*)sign {
    PayReq *request = [[PayReq alloc] init];

    request.partnerId = partnerId;

    request.prepayId= prepayId;

    request.package = @"Sign=WXPay";

    request.nonceStr= nonceStr;

//    request.timeStamp= timeStamp;

    request.sign= sign;

    [WXApi sendReq:request completion:^(BOOL success) {
        NSLog(@"发起支付");
    }];

}


@end


