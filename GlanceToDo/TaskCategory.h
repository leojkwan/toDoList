//
//  TaskCategory.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskCategory : NSObject


@property (nonatomic, strong) NSString *title;

-(instancetype) initWithTitle:(NSString *)title;




@end
