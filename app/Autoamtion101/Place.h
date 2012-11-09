//
//  Place.h
//  Autoamtion101
//
//  Created by Eric McConkie on 11/3/12.
//  Copyright (c) 2012 Grio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Place : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coord;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


// Title and subtitle for use by selection UI.
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

// Called as a result of dragging an annotation view.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate NS_AVAILABLE(NA, 4_0);
- (id)initWithTitle:(NSString*)title subTitle:(NSString*)sub;
@end
