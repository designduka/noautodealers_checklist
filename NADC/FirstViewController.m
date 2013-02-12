//
//  FirstViewController.m
//  NADC
//
//  Created by Nick Ruta on 6/11/11.
//  Copyright 2011 Ruta Enterprises. All rights reserved.
//

#import "FirstViewController.h"
#import "GeneralQuestions.h"
#import "Exterior.h"
#import "Interior.h"
#import "Engine.h"
#import "TestDrive.h"


@implementation FirstViewController

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
    }



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Car Checklist";
    
    array = [[NSMutableArray alloc] init];
    [array addObject:@"General Questions"];
     [array addObject:@"Exterior"];
    [array addObject:@"Interior"];
    [array addObject:@"Engine/Trans"];
    [array addObject:@"Test Drive"];
    
    //load from subtitle fslist file
    NSString *myfsfile = [[NSBundle mainBundle] pathForResource:@"fslist" ofType: @"plist"];
    fslist = [[NSArray alloc] initWithContentsOfFile:myfsfile];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //retrieve an image
    NSString *imagefile = [[NSBundle mainBundle] pathForResource:@"cellimage" ofType:@"png"];
    UIImage *ui = [[UIImage alloc] initWithContentsOfFile:imagefile];
    //set the image on the table cell
    cell.imageView.image =ui;
    
    
    //custom gradient code
    UIImage *image = [UIImage imageNamed:@"cell_gradient.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleToFill;
    cell.backgroundView = imageView;
    [imageView release];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:23.0];
    label.text = [array objectAtIndex:indexPath.row];
    label.frame = cell.bounds;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    
    [cell addSubview:label];
    
    //set color of selected cell
    UIView *v = [[[UIView alloc] init] autorelease];
    v.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = v;
    
    //end custom gradient code
    
    // Configure the cell.
    //cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    // set the subtitle text
    //label.detailText = [UIColor clearColor];
    //cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    //cell.detailTextLabel.textColor = [UIColor whiteColor];
    //cell.detailTextLabel.text = [fslist objectAtIndex:indexPath.row];
    
    
    // accessory type
    //custom accessory code gradient code
    UIImageView *dimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure.png"]];
    cell.accessoryView = dimageView;
    return cell;
    [label release];
    [dimageView release];
    //end custom accessory code
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([[array objectAtIndex:indexPath.row] isEqual:@"General Questions"])
    {
        GeneralQuestions *generalQuestions = [[GeneralQuestions alloc] initWithNibName:@"GeneralQuestions" bundle:nil];
        [self.navigationController pushViewController:generalQuestions animated:YES];
        [generalQuestions release];
    }
    
     if ([[array objectAtIndex:indexPath.row] isEqual:@"Exterior"])
    {
        Exterior *exterior = [[Exterior alloc] initWithNibName:@"Exterior" bundle:nil];
        [self.navigationController pushViewController:exterior animated:YES];
        [exterior release];
    }
    if ([[array objectAtIndex:indexPath.row] isEqual:@"Interior"])
    {
        Interior *interior = [[Interior alloc] initWithNibName:@"Interior" bundle:nil];
        [self.navigationController pushViewController:interior animated:YES];
        [interior release];
    }
    
  
    
     if ([[array objectAtIndex:indexPath.row] isEqual:@"Engine/Trans"])
    {
        Engine *engine = [[Engine alloc] initWithNibName:@"Engine" bundle:nil];
        [self.navigationController pushViewController:engine animated:YES];
        [engine release];  
    }
    
    
    if ([[array objectAtIndex:indexPath.row] isEqual:@"Test Drive"])
    {
        TestDrive *testDrive = [[TestDrive alloc] initWithNibName:@"TestDrive" bundle:nil];
        [self.navigationController pushViewController:testDrive animated:YES];
        [testDrive release];
    }
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}









        

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [array release];
    [super dealloc];
}

@end
