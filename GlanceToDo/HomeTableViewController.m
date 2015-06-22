//
//  HomeTableViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "HomeTableViewController.h"
#import "MyCustomTableViewCell.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.dataStore = [TasksDataStore sharedTasksDataStore];
    
    
    
}




#pragma mark - Left Swipe Utility



#pragma mark - Cells

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataStore.listOfSections[indexPath.section] removeObjectAtIndex:indexPath.row];

        
        [self.tableView reloadData]; // tell table to refresh now
        
        NSLog(@"%@", self.dataStore.listOfSections);
    }
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if ([self.dataStore.listOfSections[section] count] != 0) {
        taskType *typeAtThisIndex = [self.dataStore.listOfSections[section][0] typeObject];
        return [typeAtThisIndex name];
    }
    return nil;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    NSInteger numberOfFilledSections = 0;
    
    for (taskType *tasksOfACertainType in self.dataStore.listOfSections) {
        if (tasksOfACertainType > 0) {
            numberOfFilledSections++;
        }
    }
    return self.dataStore.listOfSections.count;
    }



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
//    NSMutableArray *reusableTasksOfACerTainType = [[NSMutableArray alloc] init];

//    for (NSInteger i = 0; i < [self.dataStore.listOfSections count]; i++) {
//        return [self.dataStore.listOfSections[section] count];
//        }
//
//        if ([type.name isEqualToString:self.tasksOfACertainType[section]]) {
//            [reusableTasksOfACerTainType addObject:task];
//        }
//    }
//
//    return reusableTasksOfACerTainType.count;
    return [self.dataStore.listOfSections[section] count];
}



//
//- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
//{
//    static NSString *cellIdentifier = @"MyCustomCell";
//    
//    TestTableViewCell *cell = (TestTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier
//                                                                                   forIndexPath:indexPath];
//    
//    cell.leftUtilityButtons = [self leftButtons];
//    cell.rightUtilityButtons = [self rightButtons];
//    cell.delegate = self;
//    
//    cell.customLabel.text = @"Some Text";
//    cell.customImageView.image = [UIImage imageNamed:@"MyAwesomeTableCellImage"];
//    //        [cell set:cell.frame.size.height];
//    return cell;
//}


-(UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCustomCell" forIndexPath:indexPath];
    
    
    cell.leftUtilityButtons = [self leftButtons];
        cell.delegate = self;


//    NSMutableArray *reusableTasks = [[NSMutableArray alloc] init];
//    
//
//    
//    for (NSMutableArray *tasksOfACertainType  in self.dataStore.listOfSections) {
//        
//        for (NSInteger i = 0; i < tasksOfACertainType.count; i++) {
            cell.textLabel.text = [self.dataStore.listOfSections[indexPath.section][indexPath.row] name];
//        }
    
//        if ([task.type.name isEqualToString:self.tasksOfACertainType[indexPath.section]]) {
//            [reusableTasks addObject:task.name];
//        }
//    }
    
    


    return cell;
}



- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"logo"]];
    
    return leftUtilityButtons;
}


#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"check button was pressed");
            break;
        case 1:
            NSLog(@"clock button was pressed");
            break;
        case 2:
            NSLog(@"cross button was pressed");
            break;
        case 3:
            NSLog(@"list button was pressed");
        default:
            break;
    }
}








-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
