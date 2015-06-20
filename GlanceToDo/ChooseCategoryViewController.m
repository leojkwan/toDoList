//
//  CategoryViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "ChooseCategoryViewController.h"

@interface ChooseCategoryViewController ()

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AddTaskViewController *destinationVC = segue.destinationViewController;
    
    taskCategory *chores = [[taskCategory alloc] initWithTitle:@"Chores"];
    taskCategory *freeTime = [[taskCategory alloc] initWithTitle:@"Free Time"];
    taskCategory *work = [[taskCategory alloc] initWithTitle:@"Work"];
    taskCategory *social = [[taskCategory alloc] initWithTitle:@"Social"];

    if ([segue.identifier isEqualToString:@"choresSegue"]){
        destinationVC.passedCategoryName = chores;
        NSLog(@"Passing Chores string");
    } else if ([segue.identifier isEqualToString:@"freeTimeSegue"]){
        destinationVC.passedCategoryName = freeTime;
        NSLog(@"Passing Free Time string");
    } else if ([segue.identifier isEqualToString:@"workSegue"]){
        destinationVC.passedCategoryName = work;
        NSLog(@"Passing Work string");
    } else if ([segue.identifier isEqualToString:@"socialSegue"]){
        destinationVC.passedCategoryName = social;
        NSLog(@"Passing Social string");
    }

}


@end
