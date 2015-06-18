//
//  Task.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskCategory.h"

@interface Task : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) TaskCategory *category;

-(instancetype) initWithName:(NSString *)name category:(TaskCategory *) category;

@end
