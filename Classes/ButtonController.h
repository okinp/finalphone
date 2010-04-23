//
//  ButtonController.h
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListButtonViewController;
@class EditButtonViewController;
@class customButton;

@interface ButtonController : UIViewController {
	ListButtonViewController *listButtonViewController;
	EditButtonViewController *editButtonViewController;
	NSMutableArray *buttons;
	UIToolbar *toolbar;
}
@property (nonatomic, retain) EditButtonViewController *editButtonViewController;
@property (nonatomic, retain) ListButtonViewController *listButtonViewController;
@property (nonatomic, retain) UIToolbar *toolbar;
-(IBAction)newButton:(id)sender;
-(IBAction)editButton:(id)sender;
-(IBAction)doneButton:(id)sender;
-(IBAction)toggleButton:(id)sender;
-(void)setupListView;
-(void)setupDetailView;
-(void)deleteButton:(id)sender;
-(void)cancelButton:(id)sender;
@end
