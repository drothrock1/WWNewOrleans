//
//  wwAnnotation.h
//  Wicked Walks
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum {
	wwPin1 = 0,
	wwPin2 = 1,
	wwPin3 = 2,
	wwPin4 = 3,
	wwPin5 = 4,
	wwPin6 = 5,
	wwPin7 = 6,
	wwPin8 = 7,
	wwPin9 = 8,
    wwPin10 = 9,
    wwPin11 = 10,
    wwPin12 = 11,
    wwPin13 = 12,
    wwPin14 = 13,
    wwPin15 = 14,
    wwPin16 = 15,
    wwPin17 = 16,
    wwPin18 = 17,
	
} wwAnnotationType;

@interface wwAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *mTitle;
	NSString *mSubTitle;
	wwAnnotationType annotationType;
	NSNumber *currentPoint;
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *mTitle;
@property (nonatomic, retain) NSString *mSubTitle;
@property (nonatomic) wwAnnotationType annotationType;
@property(nonatomic, retain) NSNumber *currentPoint;

@end

