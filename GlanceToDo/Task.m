//
//  Task.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "Task.h"

@implementation Task

-(instancetype) initWithName:(NSString *)name category:(taskCategory *)category {

    self = [super init];
    
    if (self) {
        _name = name;
        _category = category;
    }
    return self;
}

-(instancetype) init {
    self = [self initWithName:@"" category:[[taskCategory alloc] initWithTitle:@""]];
    return self;
}

@end
