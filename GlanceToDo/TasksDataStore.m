//
//  TasksDataStore.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "TasksDataStore.h"


@implementation TasksDataStore
+ (instancetype)sharedTasksDataStore {
    static TasksDataStore *_sharedTasksDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedTasksDataStore = [[TasksDataStore alloc] init];
    });
    
    return _sharedTasksDataStore;
}



-(instancetype)init {
    self = [super init];
    if (self) {
        _startList = [[NSMutableArray alloc] init];
        _continueList = [[NSMutableArray alloc] init];
        _finishList = [[NSMutableArray alloc] init];
        _reminderList = [[NSMutableArray alloc] init];
        _listOfSections = [[NSMutableArray alloc] initWithObjects:self.startList,self.continueList,self.finishList,self.reminderList, nil];
        _listOfTypes = [[NSMutableArray alloc] initWithObjects:@"Start",@"Continue",@"Finish",@"Reminder", nil];
        _chores = [[taskCategory alloc] initWithTitle:@"Chores"];
        _freeTime = [[taskCategory alloc] initWithTitle:@"Free Time"];
        _work = [[taskCategory alloc] initWithTitle:@"Work"];
        _social = [[taskCategory alloc] initWithTitle:@"Social"];
        _startTask = [[taskType alloc] initWithName:@"Start"];
        _continueTask = [[taskType alloc] initWithName:@"Continue"];
        _finishTask = [[taskType alloc] initWithName:@"Finish"];
        _reminderTask = [[taskType alloc] initWithName:@"Reminder"];
        
        
        
        Task *startTask = [[Task alloc] initWithName:@"Clean" category:self.chores type:self.startTask];
        
        [self.finishList addObject:startTask];

    }
    return self;
}

@end
