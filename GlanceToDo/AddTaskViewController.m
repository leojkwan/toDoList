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
@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.addTaskButton setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(id)sender {
//    self.passedTypeName = @"Start
}

- (IBAction)beginButtonPressed:(id)sender {
}

- (IBAction)continueButtonPressed:(id)sender {
}

- (IBAction)rememberButtonPressed:(id)sender {
}





- (IBAction)addTaskButtonPressed:(id)sender {
    
    
}
//
//-(void) isHidden {
//    
//    [self is
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
