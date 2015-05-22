#import "ImageEditorFrameView.h"
#import "QuartzCore/QuartzCore.h"


@interface ImageEditorFrameView ()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ImageEditorFrameView

@synthesize cropRect = _cropRect;
@synthesize imageView  = _imageView;


- (void) initialize
{
    self.opaque = NO;
    self.layer.opacity = 0.7;
    self.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initialize];
    }
    return self;
}



- (void)setCropRect:(CGRect)cropRect
{
    if(!CGRectEqualToRect(_cropRect,cropRect)){
        _cropRect = CGRectOffset(cropRect, self.frame.origin.x, self.frame.origin.y);
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.f);
        
        [[UIColor blackColor] setFill];
        UIRectFill(self.bounds);
        
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:cropRect];
        [[UIColor colorWithWhite:1 alpha:0.5] setStroke];
        [circlePath fillWithBlendMode:kCGBlendModeClear alpha:1];
        [circlePath stroke];
        
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

//        _cropRect = CGRectOffset(cropRect, self.frame.origin.x, self.frame.origin.y);
//        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.f);
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        [[UIColor blackColor] setFill];
//        UIRectFill(self.bounds);
//        CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor);
//        CGContextStrokeRect(context, cropRect);
//        [[UIColor clearColor] setFill];
//        UIRectFill(CGRectInset(cropRect, 1, 1));
//        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//        
//        UIGraphicsEndImageContext();
    }
}

@end
