//
//  SecondViewController.m
//  Autoamtion101
//
//  Created by Eric McConkie on 11/3/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Map";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mapView release];
    [_txtInput release];
    [super dealloc];
}

-(void)search:(NSString*)strng
{
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder geocodeAddressString:strng completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count]>=1) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            Place *p =[[Place alloc] initWithTitle:placemark.name subTitle:placemark.locality];
            [p setCoordinate:placemark.location.coordinate];
            [self.mapView addAnnotation:p];
            [self.mapView setCenterCoordinate:p.coordinate animated:YES];
            
            
            MKCoordinateRegion reg = MKCoordinateRegionMake(p.coordinate, MKCoordinateSpanMake(0.1, 0.1));
            
            [self.mapView setRegion:reg animated:YES];
            [p release];
            [geoCoder release];
        }
    }];
    
}

#pragma mark -
#pragma mark textfield
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self search:textField.text];
    return YES;
}
@end
