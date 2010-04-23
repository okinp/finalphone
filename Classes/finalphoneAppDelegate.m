//
//  finalphoneAppDelegate.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "finalphoneAppDelegate.h"
#import "ButtonController.h"
@implementation finalphoneAppDelegate

@synthesize window;
@synthesize buttonViewer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
	[window addSubview:buttonViewer.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
	[buttonViewer release];
    [super dealloc];
}


@end
