//
//  TestJSAppDelegate.h
//  TestJS
//
//  Created by Forrest on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestJSViewController;

@interface TestJSAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TestJSViewController *viewController;

@end
