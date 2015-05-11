//
//  EUExClipBoard.m
//  AppCan
//
//  Created by AppCan on 12-5-16.
//  Copyright 2012 AppCan. All rights reserved.
//

#import "EUExClipboard.h"
#import "EUExBaseDefine.h"

@implementation EUExClipboard

-(id)initWithBrwView:(EBrowserView *) eInBrwView{	
	if (self = [super initWithBrwView:eInBrwView]) {
	}
	return self;
}
-(void)copy:(NSMutableArray *)inArguments {
	NSString * content = [inArguments objectAtIndex:0];
	if (content == 0) {
		return;
	}
	UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
	[pasteBoard setString:content];
}
-(void)getContent:(NSMutableArray *)inArguments {
	UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
	NSString * content = [pasteBoard string];
	if (content) {
		[self jsSuccessWithName:@"uexClipboard.cbGetContent" opId:0 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:content];
	} else {
		[self jsSuccessWithName:@"uexClipboard.cbGetContent" opId:0 dataType:UEX_CALLBACK_DATATYPE_TEXT strData:@""];
    }
}

-(void)clean {
 	
}
@end
