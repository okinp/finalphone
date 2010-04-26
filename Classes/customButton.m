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

-(void)drawRect:(CGRect)frame{
	
	
	NSLog(@"Draw Rect Called");	
	
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		[self setUserInteractionEnabled:YES];
		self.frame=frame;
        UIButton *btn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
        //CGPoint o =frame.origin;
		//CGSize sz =frame.size;
		//int x=o.x;
		//int y=o.y;
		//int wd=sz.width;
		//int ht=sz.height;
		//CGRect rec= CGRectMake(x-10, y-30, wd, ht);
		btn.frame = frame;
        //btn.frame=rec;
		//btn.backgroundColor = [UIColor clearColor];
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

@end
