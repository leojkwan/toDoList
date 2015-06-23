//
//  HomeTableViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController () <SWTableViewCellDelegate>

@end

@implementation HomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataStore = [TasksDataStore sharedTasksDataStore];



}




#pragma mark - SWTableViewDelegate

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.57 green:0.75f blue:0.76f alpha:.8]
                                                icon:[UIImage imageNamed:@"check.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:.7f green:5.0f blue:0.35f alpha:.5]
                                                icon:[UIImage imageNamed:@"clock.png"]];
    
    
    return leftUtilityButtons;
}



- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
       
        
        {case 0:
            NSLog(@"check button was pressed");
            NSIndexPath *currentIndexPath = [self.tableView indexPathForCell:cell];

            // grab the current index path
            
            if (currentIndexPath.section < 3) {
                // grab the appropriate section arrays, then the task from that
                NSMutableArray *thisSectionArray = self.dataStore.listOfSections[currentIndexPath.section];
                NSMutableArray *nextSectionArray = self.dataStore.listOfSections[currentIndexPath.section + 1];
                Task *taskToMove = thisSectionArray[currentIndexPath.row];
                
                // remove the task from the original array, and add it to the new one
                [thisSectionArray removeObject: taskToMove];
                [nextSectionArray addObject: taskToMove];
    
                // create new index path using count of nextSectionArray and next section (currentIP.section +1)
                NSIndexPath *desiredIndexPath = [NSIndexPath indexPathForRow: (nextSectionArray.count -1) inSection:(currentIndexPath.section +1)];
                taskToMove.typeObject = self.dataStore.listOfTypes[desiredIndexPath.section];
                [self.tableView reloadData];
            } else {
                
                // grab the appropriate section arrays, then the task from that
                NSMutableArray *thisSectionArray = self.dataStore.listOfSections[currentIndexPath.section];
                NSMutableArray *nextSectionArray = self.dataStore.listOfSections[currentIndexPath.section - 3];
                Task *taskToMove = thisSectionArray[currentIndexPath.row];
                
                // remove the task from the original array, and add it to the new one
                [thisSectionArray removeObject: taskToMove];
                [nextSectionArray addObject: taskToMove];
                //
                // create new index path using count of nextSectionArray and next section (currentIP.section +1)
                NSIndexPath *desiredIndexPath = [NSIndexPath indexPathForRow: (nextSectionArray.count -1) inSection:(currentIndexPath.section -3)];
                taskToMove.typeObject = self.dataStore.listOfTypes[desiredIndexPath.section];
                [self.tableView reloadData];

            }

        break;}
        {case 1:
            
            NSLog(@"check button was pressed");
            NSIndexPath *currentIndexPath = [self.tableView indexPathForCell:cell];
            
            // grab the current index path
            
            if (currentIndexPath.section > 0) {
                // grab the appropriate section arrays, then the task from that
                NSMutableArray *thisSectionArray = self.dataStore.listOfSections[currentIndexPath.section];
                NSMutableArray *nextSectionArray = self.dataStore.listOfSections[currentIndexPath.section - 1];
                Task *taskToMove = thisSectionArray[currentIndexPath.row];
                
                // remove the task from the original array, and add it to the new one
                [thisSectionArray removeObject: taskToMove];
                [nextSectionArray addObject: taskToMove];
                
                // create new index path using count of nextSectionArray and next section (currentIP.section +1)
                NSIndexPath *desiredIndexPath = [NSIndexPath indexPathForRow: (nextSectionArray.count -1) inSection:(currentIndexPath.section - 1)];
                taskToMove.typeObject = self.dataStore.listOfTypes[desiredIndexPath.section];
                [self.tableView reloadData];
            }
            
            else {
                
                // grab the appropriate section arrays, then the task from that
                NSMutableArray *thisSectionArray = self.dataStore.listOfSections[currentIndexPath.section];
                NSMutableArray *nextSectionArray = self.dataStore.listOfSections[currentIndexPath.section +3];
                Task *taskToMove = thisSectionArray[currentIndexPath.row];
                
                // remove the task from the original array, and add it to the new one
                [thisSectionArray removeObject: taskToMove];
                [nextSectionArray addObject: taskToMove];
                //
                // create new index path using count of nextSectionArray and next section (currentIP.section +1)
                NSIndexPath *desiredIndexPath = [NSIndexPath indexPathForRow: (nextSectionArray.count -1) inSection:(currentIndexPath.section +3)];
                taskToMove.typeObject = self.dataStore.listOfTypes[desiredIndexPath.section];
                [self.tableView reloadData];

            
                break;}
            
            
            
            
        }
            
        default:
            break;
            }
            }

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataStore.listOfSections[indexPath.section] removeObjectAtIndex:indexPath.row];

        [self.tableView reloadData]; // tell table to refresh now
        
        NSLog(@"%@", self.dataStore.listOfSections);
    }
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

    return [self.dataStore.listOfSections[section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCustomCell" forIndexPath:indexPath];
    
    
    cell.leftUtilityButtons = [self leftButtons];
        cell.delegate = self;




    cell.textLabel.text = [self.dataStore.listOfSections[indexPath.section][indexPath.row] name];

    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if ([self.dataStore.listOfSections[section] count] != 0) {
//        taskType *typeAtThisIndex = [self.dataStore.listOfSections[section][0] typeObject];
        return self.dataStore.listOfTypes[section];
    }
    return nil;
}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



#pragma mark - Notifications

//-(void) WarningNotificationOfCategory {
//    
//    self.notification = [CWStatusBarNotification new];
//    self.notification.notificationLabelBackgroundColor = [UIColor greenColor];
//    self.notification.notificationLabelFont = [UIFont boldSystemFontOfSize:25];
//    //    self.notification.notificationLabel.font = [UIFont boldSystemFontOfSize:25];
//    self.notification.notificationAnimationInStyle = CWNotificationAnimationStyleLeft;
//    self.notification.notificationStyle = CWNotificationStyleNavigationBarNotification;
//    [self.notification displayNotificationWithMessage:@"New Task Added!"
//                                          forDuration:1.0f];
//    
//}


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
