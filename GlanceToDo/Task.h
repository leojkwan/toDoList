//
//  Task.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "taskCategory.h"
#import "taskType.h"


@interface Task : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) taskCategory *category;
@property (nonatomic, strong) taskType *type;

-(instancetype) initWithName:(NSString *)name category:(taskCategory *)category type:(taskType *)type;


@end
