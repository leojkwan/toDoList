//
//  AddTaskViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "AddTaskViewController.h"
#import <UIKit/UIKit.h>

@interface AddTaskViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *reminderButton;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (weak, nonatomic) IBOutlet UITextView *taskTextField;
@property (nonatomic, strong) CWStatusBarNotification *notification;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;





@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    self.dataStore = [TasksDataStore sharedTasksDataStore];
    [super viewDidLoad];
    self.taskTextField.delegate = self;
    self.taskTextField.hidden = YES;
    [self.taskTextField setEditable:NO];
    [self hideKeyboardOnTouch];
    [self.view setNeedsDisplay];
    [self setButtonProperties];
}







#pragma mark - Buttons


- (IBAction)saveButtonPressed:(id)sender {

    Task *newTaskCreated = [[Task alloc] initWithName:self.taskTextField.text category:self.passedCategoryName type:self.passedTypeName];
    
    
    if (self.passedTypeName.name == self.dataStore.listOfTypes[0]) {
        [[TasksDataStore sharedTasksDataStore].startList   addObject:newTaskCreated];
        
        
    } else if (self.passedTypeName.name == self.dataStore.listOfTypes[1]) {
        [[TasksDataStore sharedTasksDataStore].continueList   addObject:newTaskCreated];
        
    }  else if (self.passedTypeName.name == self.dataStore.listOfTypes[2]) {
        [[TasksDataStore sharedTasksDataStore].finishList   addObject:newTaskCreated];
        
    }  else if (self.passedTypeName.name == self.dataStore.listOfTypes[3]) {
        [[TasksDataStore sharedTasksDataStore].reminderList   addObject:newTaskCreated];
    }
    
    [self vibratePhone];
    [self taskAddedNotificationOfCategory];
    
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}



-(void) setButtonProperties {
    [self.taskTextField setTextContainerInset:UIEdgeInsetsMake(20,12,10,10)];
    self.taskTextField.layer.cornerRadius = 10;
    self.startButton.layer.cornerRadius = 10;
    self.continueButton.layer.cornerRadius = 10;
    self.finishButton.layer.cornerRadius = 10;
    self.reminderButton.layer.cornerRadius = 10;
}



- (IBAction)startButtonPressed:(id)sender {
    self.passedTypeName = self.dataStore.startTask;
    [self hideAndShowObjectsOnPress:sender];

}

- (IBAction)continueButtonPressed:(id)sender {
    self.passedTypeName = self.dataStore.continueTask;
    [self hideAndShowObjectsOnPress:sender];


}

- (IBAction)finishButtonPressed:(id)sender {
    self.passedTypeName = self.dataStore.finishTask;
    [self hideAndShowObjectsOnPress:sender];


}

- (IBAction)reminderButttonPressed:(id)sender {
    self.passedTypeName = self.dataStore.reminderTask;
    [self hideAndShowObjectsOnPress:sender];
}


-(void) hideAndShowObjectsOnPress:(id)sender {
    [self toggleKeyboardAndColor:sender];
    self.taskTextField.hidden = NO;
    self.promptLabel.hidden = YES;
}

- (void)vibratePhone;
{
    if([[UIDevice currentDevice].model isEqualToString:@"iPhone"])
    {
        AudioServicesPlaySystemSound (1352); //works ALWAYS as of this post
    }
    else
    {
        // Not an iPhone, so doesn't have vibrate
        // play the less annoying tick noise or one of your own
        AudioServicesPlayAlertSound (1105);
    }
}


#pragma mark - Notifications


-(void) taskAddedNotificationOfCategory {
    
    self.notification = [CWStatusBarNotification new];
    self.notification.notificationLabelBackgroundColor = [UIColor greenColor];
    self.notification.notificationLabelFont = [UIFont boldSystemFontOfSize:25];
    self.notification.notificationAnimationInStyle = CWNotificationAnimationStyleLeft;
    self.notification.notificationStyle = CWNotificationStyleNavigationBarNotification;
    [self.notification displayNotificationWithMessage:@"New Task Added!"
                                          forDuration:1.0f];
    
}


#pragma mark - Keyboard

-(void) toggleKeyboardAndColor:(id)sender {
    [self toggleOtherButtonColorsOffExcept:sender];
    [self.taskTextField setEditable:YES];
    [self.taskTextField becomeFirstResponder];
}

-(void) hideKeyboardOnTouch {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
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





//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
