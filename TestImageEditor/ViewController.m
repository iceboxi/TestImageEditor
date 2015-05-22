//
//  ViewController.m
//  TestImageEditor
//
//  Created by iceboxi on 2015/5/21.
//  Copyright (c) 2015年 iceboxi. All rights reserved.
//
#import <AssetsLibrary/AssetsLibrary.h>
#import "ViewController.h"
#import "ImageEditorPreview.h"
#import "ImageEditView.h"

@interface ViewController () {
    IBOutlet UIImageView *previewView;
}
//@property (nonatomic, strong) ImageEditorPreview *imageEditor;
@property (nonatomic, strong) ImageEditView *testEditor;
@property (nonatomic, strong) UINavigationController *nav;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageEditor = [[ImageEditorPreview alloc] initWithNibName:@"ImageEditorPreview" bundle:nil];
    __weak UIImageView *weakPreview = previewView;
//    self.imageEditor.doneCallback = ^(ImageEditorViewController *controller, UIImage *editedImage, BOOL canceled){
//        if(!canceled) {
//            [weakPreview setImage:editedImage];
//        }
//        
//        [controller dismissViewControllerAnimated:YES completion:^{
//            ;
//        }];
//    };
    
    self.testEditor = [[ImageEditView alloc] initWithNibName:@"ImageEditorPreview" bundle:nil];
    self.testEditor.doneCallback = ^(ImageEditorViewController *controller, UIImage *editedImage, BOOL canceled){
        if(!canceled) {
            [weakPreview setImage:editedImage];
        }
        
        [controller dismissViewControllerAnimated:YES completion:^{
            ;
        }];
    };
    
    self.nav = [[UINavigationController alloc] initWithRootViewController:self.testEditor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)enterLibrary:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:^{
        ;
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image =  [info objectForKey:UIImagePickerControllerOriginalImage];
    NSURL *assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        UIImage *preview = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
        
        self.testEditor.sourceImage = image;
        self.testEditor.previewImage = preview;
        [self.testEditor reset:NO];
        [picker dismissViewControllerAnimated:YES completion:^{
            [self presentViewController:self.nav animated:YES completion:^{
                ;
            }];
        }];
    } failureBlock:^(NSError *error) {
        NSLog(@"Failed to get asset from library");
    }];
}

- (IBAction)testImage:(id)sender {
    UIImage *image =  previewView.image;
    
    self.testEditor.sourceImage = image;
    self.testEditor.previewImage = image;
    [self.testEditor reset:NO];
    [self presentViewController:self.nav animated:YES completion:^{
        ;
    }];
}

@end
