//
//  FirstViewController.m
//  Autoamtion101
//
//  Created by Eric McConkie on 11/3/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    int curUserIndex;
}
@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"List";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *array = [NSArray arrayWithObjects:
                      @"Eric",
                      @"Giuseppe",
                      @"Brad",
                      @"Doug",
                      @"Santo",
                      @"Meg",
                      @"Martin"
                      , nil];
    
    self.data = array;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
#pragma mark -
#pragma mark alert delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://yes
        {
            
        }
            break;
            
        default:
            break;
    }
    curUserIndex = -1;
}
#pragma mark -
#pragma mark tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}
-(UITableViewCell*)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"DefaultCell";
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    curUserIndex = indexPath.row;
    NSString *name = [self.data objectAtIndex:indexPath.row];
    NSString *msg =[NSString stringWithFormat:@"Will you buy %@ a beer?",name];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Buy Beer?" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes",@"No", nil];
    alert.accessibilityLabel=@"BeerAlert";
    [alert show];
    [alert release];
}
@end
