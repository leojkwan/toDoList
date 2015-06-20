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
@property (weak, nonatomic) IBOutlet UITextField *addTaskTextField;
@property (weak, nonatomic) IBOutlet UIButton *addTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *reminderButton;
@property (nonatomic, strong) UITapGestureRecognizer *tap;


-(void) toggleOtherButtonColorsOffExcept:(UIButton*)button;
-(void) toggleKeyboardAndColor:(id)sender;


@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.addTaskButton setHidden:YES];
    [self.addTaskTextField setEnabled:NO];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    
    
//    if (keyb) {
//        <#statements#>
//    }
    
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


- (IBAction)addTaskButtonPressed:(id)sender {
}






-(void) toggleKeyboardAndColor:(id)sender {
    [self toggleOtherButtonColorsOffExcept:sender];
    [self.addTaskTextField setEnabled:YES];
    [self.addTaskTextField becomeFirstResponder];
}




-(void)dismissKeyboard {
    [self.addTaskTextField resignFirstResponder];
}


-(void) toggleOtherButtonColorsOffExcept:(UIButton*)button {
    
    self.startButton.backgroundColor = [UIColor grayColor];
    self.continueButton.backgroundColor = [UIColor grayColor];
    self.finishButton.backgroundColor = [UIColor grayColor];
    self.reminderButton.backgroundColor = [UIColor grayColor];
    
    button.backgroundColor =  [UIColor greenColor];
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
