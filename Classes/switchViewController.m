    //
//  switchViewController.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "switchViewController.h"
#import "ListButtonViewController.h"
#import "EditButtonViewController.h"
#import "customButton.h"



@implementation switchViewController
@synthesize listView;
@synthesize editView;
@synthesize toolbar;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
-(void)viewDidLoad{
	
	[self displayListToolbar];
	ListButtonViewController *listB = [[ListButtonViewController alloc] initWithNibName:@"listView" bundle:nil];
	self.listView=listB;
	[self.view insertSubview:listB.view atIndex:0];
	[listB release];
	EditButtonViewController *editB = [[EditButtonViewController alloc] initWithNibName:@"editView" bundle:nil];
	self.editView=editB;
	[super viewDidLoad];
	[editB release];
	enable=YES;
	
	
}
-(void)switchViews{
	NSLog(@"switchViews");
	if (self.editView.view.superview==nil) {
		[listView.view removeFromSuperview];
		[self.view insertSubview:editView.view atIndex:0];
	} else {
		[editView.view removeFromSuperview];
		[self.view insertSubview:listView.view atIndex:0];
		[self.listView viewDidLoad];
	}
}
-(IBAction)newButton:(id)sender{
	[self switchViews];
	[self displayEditToolbar];
	
	
	
}

-(IBAction)editButton:(id)sender{
	for (int i=0; i<[[self.listView buttons] count];i++){
		BOOL en=[[[self.listView buttons] objectAtIndex:i] button].enabled;
		[[[[self.listView buttons] objectAtIndex:i] button] setEnabled:!en];
	
		
	}
	
	[self.listView viewDidLoad];
	
	
	
	
	
}
-(IBAction)trushButton:(id)sender{
	
	
	
	
	
}

-(IBAction)cancelButton:(id)sender{
	[self switchViews];
	[self displayListToolbar];
	
	
}
-(IBAction)doneButton:(id)sender{
	CGRect rect =CGRectMake(20, 20, 60, 20);
	customButton *btn = [[customButton alloc] initWithFrame:rect];
	NSString *theShortcut= [[editView secondTextField] text];
	NSString *theTitle =[[editView firstTextField] text];
	[btn assignTitle:theTitle andShortcut:theShortcut];
	[listView.buttons addObject:btn];
	[self switchViews];
	[self displayListToolbar];
	

	
	
}
-(void)displayListToolbar{
	[self.toolbar removeFromSuperview];
	//Add buttons
	UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																			   target:self
																			   action:@selector(newButton:)];
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
																			   target:self
																			   action:@selector(editButton:)];
	
	UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
																				  target:self
																				  action:@selector(trushButton:)];
	
	
	
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																			  target:nil
																			  action:nil];
	
	
	NSArray *items = [NSArray arrayWithObjects: newButton, flexItem,deleteButton, editButton, nil];
	
	//release buttons
	[newButton release];
	[editButton release];
	[deleteButton release];
	[flexItem release];
	
	
	toolbar=[UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	[toolbar sizeToFit];
	toolbar.frame = CGRectMake(0, 410, 320, 50);
	self.toolbar=toolbar;
	//add array of buttons to toolbar
	[self.toolbar setItems:items animated:NO];
	[self.view addSubview:toolbar];
	
	
}
-(void)displayEditToolbar{
	[self.toolbar removeFromSuperview];
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
																				  target:self
																				  action:@selector(cancelButton:)];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																				target:self
																				action:@selector(doneButton:)];
	
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																			  target:nil
																			  action:nil];
	
	//Add buttons to the array
	NSArray *items = [NSArray arrayWithObjects: cancelButton, flexItem, doneButton, nil];	
	//release buttons
	[cancelButton release];
	[doneButton release];
	[flexItem release];
	toolbar=[UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	[toolbar sizeToFit];
	toolbar.frame = CGRectMake(0, 410, 320, 50);
	self.toolbar=toolbar;
	//add array of buttons to toolbar
	[self.toolbar setItems:items animated:NO];
	[self.view addSubview:self.toolbar];
	
	
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	if (self.listView.view.superview==nil) {
		self.listView=nil;
	} else {
		self.editView=nil;
	}
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
