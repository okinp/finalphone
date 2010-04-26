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
@synthesize userInteractionEnabled;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setUserInteractionEnabled:YES];
        UIButton *btn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        btn.frame = frame;
        //btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:[self.button currentTitle] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.center = self.center;
		[self setButton:btn];
        [self addSubview:button];
		
    }
    return self;
}
-(void)assignTitle:(NSString *)title withShortcut:(NSString *)srtcut {
	
	[self.button setTitle:title forState:UIControlStateNormal];
	[self setShortcut:srtcut];
	
}
-(IBAction)buttonClick:(id)sender{
	NSString *txt =self.shortcut;
	NSLog(@"%@",txt);	
}

@end
