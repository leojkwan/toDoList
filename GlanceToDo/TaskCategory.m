//
//  TaskCategory.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "TaskCategory.h"

@implementation TaskCategory

-(instancetype) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        _title = title;
    }
    
    return self;
}

-(instancetype) init {
    self = [self initWithTitle:@""];
    return self;
}


@end
