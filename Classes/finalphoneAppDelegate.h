//
//  finalphoneAppDelegate.h
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonController;
@interface finalphoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	ButtonController *buttonViewer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonController *buttonViewer;
@end

