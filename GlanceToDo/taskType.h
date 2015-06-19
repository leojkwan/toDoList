//
//  taskType.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/19/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface taskType : NSObject

@property (nonatomic, strong) NSString *name;

-(instancetype)initWithName:(NSString *)name;

@end
