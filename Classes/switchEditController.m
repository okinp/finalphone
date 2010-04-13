    //
//  switchEditController.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "switchEditController.h"
#import "buttonEditViewController.h"
#import	"buttonDetailViewController.h"

@implementation switchEditController
@synthesize	editViewController;
@synthesize detailViewController;

-(void)viewDidLoad
{
	buttonEditViewController *editController = [[buttonEditViewController alloc] initWithNibName:@"editView" bundle:nil];
	self.editViewController = editController;
	[self.view insertSubview:editController.view atIndex:0];
	[editController release];
	[super viewDidLoad];
  
}
-(void)switchEdit:(id)sender
{
	
	
	
	
}
-(void)showEditView:(id)sender
{
	buttonEditViewController *editController = [[buttonEditViewController alloc] init];
	[editController editViewPressed:sender];
	[editController release];
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
