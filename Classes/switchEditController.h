//
//  switchEditController.h
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class buttonEditViewController;
@class buttonDetailViewController;

@interface switchEditController : UIViewController {
	buttonEditViewController *editViewController;
	buttonDetailViewController *detailViewController;
}
@property (nonatomic, retain) buttonEditViewController *editViewController;
@property (nonatomic, retain) buttonDetailViewController *detailViewController;
-(IBAction)switchEdit:(id)sender;
@end
