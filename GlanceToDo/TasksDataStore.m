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
        _tasksList = [[NSMutableArray alloc] init];
        _categoriesList = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
