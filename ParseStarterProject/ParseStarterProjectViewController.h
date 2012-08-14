// Copyright 2011 Ping Labs, Inc. All rights reserved.

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

@interface ParseStarterProjectViewController : UIViewController <UITextFieldDelegate> {
    
}
@property (strong, nonatomic) IBOutlet UITextField *questionField;
- (IBAction)submitPressed:(UIButton *)sender;

@end
