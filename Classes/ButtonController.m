//
//  ButtonController.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ButtonController.h"
#import "EditButtonViewController.h"
#import	"listButtonViewController.h"
#import "customButton.h"

@implementation ButtonController
@synthesize	listButtonViewController;
@synthesize editButtonViewController;
@synthesize toolbar;
@synthesize buttons;
-(void)setupListView
{
	//Add buttons
	UIBarButtonItem *newButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																				 target:self
																				 action:@selector(newButton:)];
	
	UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
																				 target:self
																				 action:@selector(deleteButton:)];
	
	
	
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																			  target:nil
																			  action:nil];
	

	NSArray *items = [NSArray arrayWithObjects: newButton, flexItem, deleteButton, nil];
	
	//release buttons
	[newButton release];
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
	ListButtonViewController *listController = [[ListButtonViewController alloc] initWithNibName:@"listView" bundle:nil];
	self.listButtonViewController = listController;
	
	
	//Add buttons to view
	for (int i=0; i<[buttons count]; i++) {
		UIButton *button = [[buttons objectAtIndex:(NSUInteger) i] getButton] ;
		button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
		[listController.view addSubview:button];
	}
	[self.view insertSubview:listController.view atIndex:0];
	[toolbar release];
	[listController release];
	
	
}
-(void)setupDetailView
{

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
	[self.view addSubview:toolbar];
	
	EditButtonViewController *editController = [[EditButtonViewController alloc] initWithNibName:@"editView" bundle:nil];
	self.editButtonViewController = editController;
	[self.view insertSubview:editController.view atIndex:0];
	[toolbar release];
	[editController release];
	
	
	
}
-(void)viewDidLoad
{	self.buttons=[[NSMutableArray alloc] init];
	[self setupListView];
	[super viewDidLoad];
  
}
-(void)newButton:(id)sender
{
	[listButtonViewController.view removeFromSuperview];
	listButtonViewController=nil;
	[self setupDetailView];
	[super viewDidLoad];
	

}
-(void)cancelButton:(id)sender
{
	[editButtonViewController.view removeFromSuperview];
	editButtonViewController=nil;
	[self setupListView];
	[super viewDidLoad];
}
-(void)editButton:(id)sender
{
	[listButtonViewController.view removeFromSuperview];
	listButtonViewController=nil;
	[self setupDetailView];
	[super viewDidLoad];
}

-(void)doneButton:(id)sender
{
	//There are two cases here
	//In one case we are adding a  new button and on the other we are editing an existing one
	//1st Case: New
	

	NSString *text = [[NSString alloc] init];
	text=[[self.editButtonViewController secondTextField] text];
	NSLog(@"%@",text);
	customButton *cBtn= [[customButton alloc] init];
	UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btn addTarget:self 
			   action:@selector(deleteButton:)
	 forControlEvents:UIControlEventTouchDown];
	
	[cBtn assignShortcut:text];
	//[btn setTitle:[[editButtonViewController firstTextField] text] forState:UIControlStateNormal];
	
	[btn setTitle:[[editButtonViewController firstTextField] text] forState:UIControlStateNormal];
	//Set position
	[cBtn assignButton:btn];
	[buttons addObject:cBtn];
	NSLog(@"%d",[buttons count]);
	
	[editButtonViewController.view removeFromSuperview];
	editButtonViewController=nil;
	[self setupListView];
	[super viewDidLoad];

	
}
-(void)deleteButton:(id)sender
{
	
	
	
}
-(void)toggleButton:(id)sender
{	BOOL pressed;
	UIButton *button;
	button.selected = ! pressed;
    pressed = ! pressed;

	
	
	
	
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    if (self.editButtonViewController.view.superview == nil)
		self.editButtonViewController = nil;
	else
		self.listButtonViewController = nil;
}
    


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[toolbar release];
	[editButtonViewController release];
	[listButtonViewController release];
    [super dealloc];
}


@end
