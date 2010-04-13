//
//  finalphoneAppDelegate.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "finalphoneAppDelegate.h"
#import "switchEditController.h"
@implementation finalphoneAppDelegate

@synthesize window;
@synthesize switchViewer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
	[window addSubview:switchViewer.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
	[switchViewer release];
    [super dealloc];
}


@end
