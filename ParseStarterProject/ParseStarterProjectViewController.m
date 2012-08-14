// Copyright 2011 Ping Labs, Inc. All rights reserved.

#import "ParseStarterProjectViewController.h"

@implementation ParseStarterProjectViewController
@synthesize questionField = _questionField;


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)submitPressed:(UIButton *)sender {
    if (!self.questionField.text) {
        return;
    }
    PFObject *question = [PFObject objectWithClassName:@"Question"];
    [question setObject:self.questionField.text forKey:@"text"];
    [question save];
    self.questionField.text = nil;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"q1" forKey:@"why is the sky blue?"];
    [testObject save];
    [self.questionField setDelegate:self];
}


- (void)viewDidUnload
{
    [self setQuestionField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
