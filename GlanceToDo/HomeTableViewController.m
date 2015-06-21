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
    
    
//    taskCategory *chores = [[taskCategory alloc] initWithTitle:@"Chores"];
//    taskCategory *freeTime = [[taskCategory alloc] initWithTitle:@"Free Time"];
//    taskCategory *work = [[taskCategory alloc] initWithTitle:@"Work"];
//    taskCategory *social = [[taskCategory alloc] initWithTitle:@"Social"];
//    
//    taskType *startTask = [[taskType alloc] initWithName:@"Start"]; 
//    taskType *continueTask = [[taskType alloc] initWithName:@"Continue"];
//    taskType *finishTask = [[taskType alloc] initWithName:@"Finish"];
//    taskType *reminderTask = [[taskType alloc] initWithName:@"Reminder"];
 
 
    
    self.dataStore = [TasksDataStore sharedTasksDataStore];
    
    
    
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



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
   

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
