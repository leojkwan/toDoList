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

    self.dataStore = [TasksDataStore sharedTasksDataStore];
    
    self.dataStore.categoriesList = [NSMutableArray arrayWithObjects:chores, freeTime, work, social, nil];

    Task *task1 = [[Task alloc] initWithName:@"clean stuff" category:chores];
    Task *task2 = [[Task alloc] initWithName:@"clean more stuff" category:freeTime];
    
   
    self.dataStore.tasksList = [NSMutableArray arrayWithObjects:task1, task2, nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.dataStore.categoriesList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataStore.tasksList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataStore.tasksList[indexPath.row] name];
    
    return cell;
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    taskCategory *category = self.dataStore.categoriesList[section];
    
    return category.title;
    
}


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
