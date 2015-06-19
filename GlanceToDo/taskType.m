//
//  taskType.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/19/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "taskType.h"

@implementation taskType

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}


@end
