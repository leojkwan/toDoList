//
//  taskCustomTableViewCell.h
//  GlanceToDo
//
//  Created by Leo Kwan on 6/22/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import <SWTableViewCell.h>

@interface MyCustomTableViewCell : SWTableViewCell

@property (weak, nonatomic) UILabel *customLabel;
@property (weak, nonatomic) UIImageView *customImageView;

@end
