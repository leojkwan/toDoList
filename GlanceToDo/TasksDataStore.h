//
//  TasksDataStore.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "taskType.h"
#import "taskCategory.h"
@interface TasksDataStore : NSObject

+ (instancetype)sharedTasksDataStore;

@property (nonatomic, strong) NSMutableArray *tasksList;

@end
