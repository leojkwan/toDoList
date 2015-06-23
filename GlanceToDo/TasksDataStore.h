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

@property (nonatomic, strong) NSMutableArray *listOfSections;
@property (nonatomic, strong) NSMutableArray *listOfTypes;
@property (nonatomic, strong) NSMutableArray *startList;
@property (nonatomic, strong) NSMutableArray *continueList;
@property (nonatomic, strong) NSMutableArray *finishList;
@property (nonatomic, strong) NSMutableArray *reminderList;


@property (nonatomic, strong) taskType *startTask;
@property (nonatomic, strong) taskType *continueTask;
@property (nonatomic, strong) taskType *finishTask;
@property (nonatomic, strong) taskType *reminderTask;

@property (nonatomic, strong) taskCategory *chores;
@property (nonatomic, strong) taskCategory *freeTime;
@property (nonatomic, strong) taskCategory *work;
@property (nonatomic, strong) taskCategory *social;






@end
