//
//  AddTaskViewController.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TasksDataStore.h"
#import "HomeTableViewController.h"


@interface AddTaskViewController : UIViewController


@property (nonatomic, strong) taskCategory *passedCategoryName;
@property (nonatomic, strong) taskType *passedTypeName;
@property (nonatomic, strong) TasksDataStore *dataStore;

@end
