//
//  TestJSViewController.m
//  TestJS
//
//  Created by Forrest on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestJSViewController.h"

@implementation TestJSViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_webView) {
        NSLog(@"%s",__PRETTY_FUNCTION__);
        _webView.delegate = self;
        
        //NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"HTML5VideoEventFlow"];

        NSURLRequest *localReq = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path ]];
        [_webView loadRequest:localReq];
        
        
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"%s",__PRETTY_FUNCTION__);

    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSData *jsData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"script" ofType:@"js"]];
    NSString *scripts = [[NSMutableString alloc] initWithData:jsData encoding:NSUTF8StringEncoding];
    if (scripts) {
        NSLog(@"%@",scripts);
    }
    [_webView stringByEvaluatingJavaScriptFromString:scripts];
    //[scripts release];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
