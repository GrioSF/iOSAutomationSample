//
//  Place.m
//  Autoamtion101
//
//  Created by Eric McConkie on 11/3/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize title = _title;
@synthesize subtitle = _subtitle;
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coord = newCoordinate;
}
-(CLLocationCoordinate2D)coordinate
{
    return _coord;
}

- (id)initWithTitle:(NSString*)aTitle subTitle:(NSString*)aSub
{
    self = [super init];
    if (self) {
        _title = [aTitle copy];
        _subtitle = [aSub copy];
    }
    return self;
}
@end
