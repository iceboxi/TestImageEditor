#import "ImageEditorViewController.h"

@interface ImageEditorViewController (Private)

@property (nonatomic,retain) IBOutlet UIView<ImageEditorFrame> *frameView;

- (void)startTransformHook;
- (void)endTransformHook;
- (IBAction)doneAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end


