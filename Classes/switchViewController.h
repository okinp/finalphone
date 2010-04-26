//
//  switchViewController.h
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListButtonViewController;
@class EditButtonViewController;
@class customButton;


@interface switchViewController : UIViewController {
	ListButtonViewController *listView;
	EditButtonViewController *editView;
	UIToolbar *toolbar;
	
}
@property (retain, nonatomic) ListButtonViewController *listView;
@property (retain, nonatomic) EditButtonViewController *editView;
@property (nonatomic, retain) UIToolbar *toolbar;
-(void)switchViews;
-(IBAction)newButton:(id)sender;
-(IBAction)trushButton:(id)sender;
-(IBAction)cancelButton:(id)sender;
-(IBAction)doneButton:(id)sender;
-(void)displayListToolbar;
-(void)displayEditToolbar;
@end
