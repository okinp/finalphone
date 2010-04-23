//
//  customButton.m
//  finalphone
//
//  Created by Nikolas Psaroudakis on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "customButton.h"


@implementation customButton
-(NSString*)getShortcut{
	return shortcut;
}
-(void)assignShortcut:(NSString *)string{
	shortcut=string;
	
	
}
-(UIButton*)getButton{
	return button;
	
}
-(void)assignButton:(UIButton *)btn{
	
	button=btn;
}
@end
