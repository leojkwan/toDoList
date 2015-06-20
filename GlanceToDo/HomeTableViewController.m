//
//  HomeTableViewController.m
//  GlanceToDo
//
//  Created by Leo Kwan on 6/18/15.
//  Copyright (c) 2015 Leo Kwan. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    
    taskCategory *chores = [[taskCategory alloc] initWithTitle:@"Chores"];
    taskCategory *freeTime = [[taskCategory alloc] initWithTitle:@"Free Time"];
    taskCategory *work = [[taskCategory alloc] initWithTitle:@"Work"];
    taskCategory *social = [[taskCategory alloc] initWithTitle:@"Social"];
    
    taskType *startTask = [[taskType alloc] initWithName:@"Start"]; 
    taskType *continueTask = [[taskType alloc] initWithName:@"Continue"];
    taskType *finishTask = [[taskType alloc] initWithName:@"Finish"];
    taskType *reminderTask = [[taskType alloc] initWithName:@"Reminder"];
 
 
    
    self.dataStore = [TasksDataStore sharedTasksDataStore];
    
    self.tasksOfACertainType = [[NSMutableArray alloc] init];
    
    
//    Task *task1 = [[Task alloc] initWithName:@"s1" category:chores type:startTask];
//    Task *task2 = [[Task alloc] initWithName:@"s2" category:chores type:startTask];
//    Task *task3 = [[Task alloc] initWithName:@"c1" category:chores type:continueTask];
//    Task *task4 = [[Task alloc] initWithName:@"c2" category:chores type:continueTask];
//
//    
//    self.dataStore.tasksList = @[task1,task2,task3, task4];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Cells

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataStore.tasksList removeObjectAtIndex:indexPath.row];

        
        [self.tableView reloadData]; // tell table to refresh now
        
        NSLog(@"%@", self.dataStore.tasksList);
    }
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    

//    if (reusableTasks.count == 0) {
//        [self tableView:tableView titleForHeaderInSection:indexPath.section];
//        return nil;
//    }
    
    
    return self.tasksOfACertainType[section];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    

    for (Task *task in self.dataStore.tasksList) {
        if (![self.tasksOfACertainType containsObject:task.type.name] ) {
            [self.tasksOfACertainType addObject:task.type.name];
        }
        
    }
    return self.tasksOfACertainType.count;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    
    
    
    
    NSMutableArray *reusableTasksOfACerTainType = [[NSMutableArray alloc] init];

    for (Task *task in self.dataStore.tasksList) {
        
        if ([task.type.name isEqualToString:self.tasksOfACertainType[section]]) {
            [reusableTasksOfACerTainType addObject:task];
        }
    }

    return reusableTasksOfACerTainType.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
   

    NSMutableArray *reusableTasks = [[NSMutableArray alloc] init];
    

    
    for (Task *task in self.dataStore.tasksList) {
        
        if ([task.type.name isEqualToString:self.tasksOfACertainType[indexPath.section]]) {
            [reusableTasks addObject:task.name];
        }
    }
    
    
    cell.textLabel.text = reusableTasks[indexPath.row];


    return cell;
}






-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



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
