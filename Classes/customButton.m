//
//  customButton.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "customButton.h"
@implementation customButton
@synthesize button;
@synthesize shortcut;
@synthesize title;
@synthesize userInteractionEnabled;


/*
-(void)drawRect:(CGRect)frame{
	
	
	NSLog(@"Draw Rect Called");	
	
}
 */
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setUserInteractionEnabled:YES];
		self.frame=frame;
		self.bounds=frame;
        UIButton *btn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
		btn.frame = frame;
        [btn setTitle:[self.button currentTitle] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.center = self.center;
		[self setButton:btn];
        [self addSubview:button];
		
    }
    return self;
}
-(void)assignTitle:(NSString *)ttl andShortcut:(NSString *)srtcut {
	
		
	[self setTitle:ttl];
	[self setShortcut:srtcut];
	[self.button setTitle:self.title forState:UIControlStateNormal];

	
}
-(IBAction)buttonClick:(id)sender{
	NSString *txt =self.shortcut;
	NSLog(@"%@",txt);	
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	// We only support single touches, so anyObject retrieves just that touch from touches
	//UITouch *touch = [touches anyObject];
	
	/*
	// Only move the placard view if the touch was in the placard view
	if ([touch view] != button) {
		// In case of a double tap outside the placard view, update the placard's display string
		if ([touch tapCount] == 2) {
			[placardView setupNextDisplayString];
		}
		return;
	}
	// Animate the first touch
	CGPoint touchPoint = [touch locationInView:self];
	[self animateFirstTouchAtPoint:touchPoint];
	 */
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	
	// If the touch was in the placardView, move the placardView to its location
	if ([touch view] == button) {
		CGPoint location = [touch locationInView:self];
		button.center = location;		
		return;
	}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	
	// If the touch was in the placardView, bounce it back to the center
	if ([touch view] == button) {
		// Disable user interaction so subsequent touches don't interfere with animation
		self.userInteractionEnabled = NO;
		//[self animatePlacardViewToCenter];
		return;
	}		
}
@end
