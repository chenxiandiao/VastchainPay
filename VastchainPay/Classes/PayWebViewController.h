//
//  PayWebViewController.h
//  Pods
//
//  Created by cxd on 2022/5/5.
//
//
//#ifndef PayWebViewController_h
//#define PayWebViewController_h
//
//
//#endif /* PayWebViewController_h */

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface PayWebViewController : UIViewController<WKScriptMessageHandler,UIGestureRecognizerDelegate>{
}

@property WKWebView *myWebView;
@property NSString *mUrl;
- (id)initWithUrl:(NSString *)url;
@end

