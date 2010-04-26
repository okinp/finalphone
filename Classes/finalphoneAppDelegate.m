//
//  finalphoneAppDelegate.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "finalphoneAppDelegate.h"
#import "switchViewController.h"
@implementation finalphoneAppDelegate
@synthesize window;
@synthesize switcher;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	 
	//[application setStatusBarHidden:YES animated:NO];
	switchViewController * switchView = [[switchViewController alloc] init];
	[self setSwitcher:switchView];
	[window addSubview:switcher.view];
    [window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
    [window release];
	[switcher release];
    [super dealloc];
}


@end
