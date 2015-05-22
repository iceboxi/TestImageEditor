//
//  ImageEditView.m
//  TestImageEditor
//
//  Created by iceboxi on 2015/5/22.
//  Copyright (c) 2015年 iceboxi. All rights reserved.
//

#import "ImageEditView.h"
#import "ImageEditorViewController+Private.h"

#define FRAAMEWIDTH self.frameView.frame.size.width

@interface ImageEditView ()

@end

@implementation ImageEditView

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.cropRect = CGRectMake(0,0,FRAAMEWIDTH,FRAAMEWIDTH);
        self.minimumScale = 0.2;
        self.maximumScale = 10;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * confirmButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"OK", nil) style:UIBarButtonItemStyleBordered target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem = confirmButton;
    
    UIBarButtonItem * cancel = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil) style:UIBarButtonItemStyleBordered target:self action:@selector(cancelAction:)];
    self.navigationItem.leftBarButtonItem = cancel;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setSquareAction:nil];
}

- (void)setSquareAction:(id)sender
{
    self.cropRect = CGRectMake((self.frameView.frame.size.width-FRAAMEWIDTH)/2.0f, (self.frameView.frame.size.height-FRAAMEWIDTH)/2.0f, FRAAMEWIDTH, FRAAMEWIDTH);
    [self reset:YES];
}

@end
