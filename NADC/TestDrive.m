//
//  TestDrive.m
//  NADC
//
//  Created by Nick Ruta on 6/15/11.
//  Copyright 2011 Ruta Enterprises. All rights reserved.
//

#import "TestDrive.h"


@implementation TestDrive

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = @"Test Drive";
    
    [super viewDidLoad];
    
    //load from tlist file
    NSString *mytfile = [[NSBundle mainBundle] pathForResource:@"tlist" ofType:@"plist"];
    tlist = [[NSArray alloc] initWithContentsOfFile:mytfile];
    
    //load from subtitle tslist file
    NSString *mytsfile = [[NSBundle mainBundle] pathForResource:@"tslist" ofType: @"plist"];
    tslist = [[NSArray alloc] initWithContentsOfFile:mytsfile];
}
                          
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}








// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tlist.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cells = 
    //[tableView dequeueReusableCellWithIdentifier:@"cells"];
    
    
    //create a cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    //fill it with contents
    cell.textLabel.text = [tlist objectAtIndex:indexPath.row];
    
    //set the color of a selected cell
    UIView *v = [[[UIView alloc] init] autorelease];
    v.backgroundColor = [UIColor blackColor];
    cell.selectedBackgroundView = v;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // set the subtitle text
    cell.detailTextLabel.text = [tslist objectAtIndex:indexPath.row];
    
    
    //return it
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}






@end