//
//  Exterior.m
//  NADC
//
//  Created by Nick Ruta on 6/15/11.
//  Copyright 2011 Ruta Enterprises. All rights reserved.
//

#import "Exterior.h"


@implementation Exterior

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
    [super viewDidLoad];
    self.title = @"Exterior";
    
    //load from elist file
    NSString *myefile = [[NSBundle mainBundle] pathForResource:@"elist" ofType:@"plist"];
    elist = [[NSArray alloc] initWithContentsOfFile:myefile];
    
    
    //load from subtitle eslist file
    NSString *myesfile = [[NSBundle mainBundle] pathForResource:@"eslist" ofType: @"plist"];
    eslist = [[NSArray alloc] initWithContentsOfFile:myesfile];
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
    return elist.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create a cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    //fill it with contents
    cell.textLabel.text = [elist objectAtIndex:indexPath.row];
    
    //set the color of a selected cell
    UIView *v = [[[UIView alloc] init] autorelease];
    v.backgroundColor = [UIColor blackColor];
    cell.selectedBackgroundView = v;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // set the subtitle text
    cell.detailTextLabel.text = [eslist objectAtIndex:indexPath.row];
    //return it
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






@end