#import "ImageEditorViewController+Private.h"
#import "ImageEditorPreview.h"

@interface ImageEditorPreview ()

@end

@implementation ImageEditorPreview

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.cropRect = CGRectMake(0,0,320,320);
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
    self.cropRect = CGRectMake((self.frameView.frame.size.width-320)/2.0f, (self.frameView.frame.size.height-320)/2.0f, 320, 320);
    [self reset:YES];
}

@end
