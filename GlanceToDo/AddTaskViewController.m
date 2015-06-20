//
//  AddTaskViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "AddTaskViewController.h"
#import <UIKit/UIKit.h>

@interface AddTaskViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *reminderButton;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (weak, nonatomic) IBOutlet UITextView *taskTextField;


-(void) toggleOtherButtonColorsOffExcept:(UIButton*)button;
-(void) toggleKeyboardAndColor:(id)sender;
-(void) hideKeyboardOnTouch;
-(void) setButtonProperties;


@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.taskTextField setEditable:NO];
    [self.taskTextField setDelegate:self];
    [self hideKeyboardOnTouch];
    [self.view setNeedsDisplay];
    [self setButtonProperties];

}


- (IBAction)saveButtonPressed:(id)sender {

    Task *newTaskCreated = [[Task alloc] initWithName:self.taskTextField.text category:self.passedCategoryName type:self.passedTypeName];
    
    [[TasksDataStore sharedTasksDataStore].tasksList addObject:newTaskCreated];
    [self.navigationController popViewControllerAnimated:YES];
}







-(void) hideKeyboardOnTouch {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

-(void) setButtonProperties {
    [self.taskTextField setTextContainerInset:UIEdgeInsetsMake(20,12,10,10)];
    self.taskTextField.layer.cornerRadius = 10;
    self.startButton.layer.cornerRadius = 3;
    self.continueButton.layer.cornerRadius = 3;
    self.finishButton.layer.cornerRadius = 3;
    self.reminderButton.layer.cornerRadius = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(id)sender {
    self.passedTypeName = @"Start";
    [self toggleKeyboardAndColor:sender];

}

- (IBAction)continueButtonPressed:(id)sender {
    self.passedTypeName = @"Continue";
    [self toggleKeyboardAndColor:sender];

}

- (IBAction)finishButtonPressed:(id)sender {
    self.passedTypeName = @"Finish";
    [self toggleKeyboardAndColor:sender];
}

- (IBAction)reminderButttonPressed:(id)sender {
    self.passedTypeName = @"Reminder";
    [self toggleKeyboardAndColor:sender];
}





-(void) toggleKeyboardAndColor:(id)sender {
    [self toggleOtherButtonColorsOffExcept:sender];
    [self.taskTextField setEditable:YES];
    [self.taskTextField becomeFirstResponder];
}




-(void)dismissKeyboard {
    [self.taskTextField resignFirstResponder];
}


-(void) toggleOtherButtonColorsOffExcept:(UIButton*)button {
    
    self.startButton.backgroundColor = [UIColor grayColor];
    self.continueButton.backgroundColor = [UIColor grayColor];
    self.finishButton.backgroundColor = [UIColor grayColor];
    self.reminderButton.backgroundColor = [UIColor grayColor];
    
    button.backgroundColor =  [UIColor greenColor];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
