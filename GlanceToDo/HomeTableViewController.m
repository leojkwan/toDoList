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


    Task *task1 = [[Task alloc] initWithName:@"clean stuff" category:chores type:continueTask];
    Task *task2 = [[Task alloc] initWithName:@"play guitar" category:freeTime type:reminderTask];
    Task *task3 = [[Task alloc] initWithName:@"cookin in the kitchen" category:freeTime type:startTask];
     Task *task4 = [[Task alloc] initWithName:@"chi llin with the homies" category:freeTime type:startTask];
    Task *task5 = [[Task alloc] initWithName:@"chillin with the homies" category:work type:finishTask];
   
    self.dataStore.tasksList = [NSMutableArray arrayWithObjects:task3, task2, task1, task4, task5, nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
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










-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    
    return self.tasksOfACertainType[section];
    
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
