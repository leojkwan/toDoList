//
//  HomeTableViewController.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "taskCategory.h" 
#import "TasksDataStore.h"
#import "taskType.h"
#import <SWTableViewCell.h>
#import <AudioToolbox/AudioToolbox.h>




@interface HomeTableViewController : UITableViewController
@property (nonatomic, strong) TasksDataStore *dataStore;
//@property (nonatomic, strong) NSMutableArray *tasksOfACertainType;


@end
