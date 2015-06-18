//
//  HomeTableViewController.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskCategory.h" 
@interface HomeTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *tasks;

@end
