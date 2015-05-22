#import <UIKit/UIKit.h>

@protocol ImageEditorFrame
@required
@property(nonatomic,assign) CGRect cropRect;
@end

@class  ImageEditorViewController;

typedef void(^ImageEditorDoneCallback)(ImageEditorViewController *controller, UIImage *image, BOOL canceled);

@interface ImageEditorViewController : UIViewController<UIGestureRecognizerDelegate>

@property(nonatomic,copy) ImageEditorDoneCallback doneCallback;
@property(nonatomic,copy) UIImage *sourceImage;
@property(nonatomic,copy) UIImage *previewImage;
@property(nonatomic,assign) CGSize cropSize;
@property(nonatomic,assign) CGRect cropRect;
@property(nonatomic,assign) CGFloat outputWidth;
@property(nonatomic,assign) CGFloat minimumScale;
@property(nonatomic,assign) CGFloat maximumScale;

@property(nonatomic,assign) BOOL panEnabled;
@property(nonatomic,assign) BOOL rotateEnabled;
@property(nonatomic,assign) BOOL scaleEnabled;
@property(nonatomic,assign) BOOL tapToResetEnabled;
@property(nonatomic,assign) BOOL checkBounds;

@property(nonatomic,readonly) CGRect cropBoundsInSourceImage;

- (void)reset:(BOOL)animated;

@end


