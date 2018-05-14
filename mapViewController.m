//
//  mapViewController.m
//  Wicked Walks
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "mapViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageThreeViewController.h"
#import "PageFourViewController.h"
#import "PageFiveViewController.h"
#import "PageSixViewController.h"
#import "PageSevenViewController.h"
#import "PageEightViewController.h"
#import "PageNineViewController.h"
#import "PageTenViewController.h"
#import "PageElevenViewController.h"
#import "PageTwelveViewController.h"
#import "PageThirteenViewController.h"
#import "PageFourteenViewController.h"
#import "PageFifteenViewController.h"
#import "PageSixteenViewController.h"
#import "PageSeventeenViewController.h"
#import "PageEighteenViewController.h"
#import <CoreLocation/CoreLocation.h>


#define MAPSETTINGSSTARTHEIGHT			-50.0
#define MAPSETTINGSSHOWHEIGHT			0.0
#define MAPSETTINGSCONTAINERHEIGHT		50.0

@interface mapViewController (ViewHandlingMethods)
- (void)toggleMapSettingsView;
- (void)createSlideUpMapSettingsView;
//- (void)loadStartScreen;
@end

@implementation mapViewController

@synthesize mapView;
@synthesize locationManager;

-(void)viewWillAppear:(BOOL)animated {
	NSLog (@"mapview viewwillappear executed");
	[[self navigationController] setNavigationBarHidden:NO animated:NO];
	[super viewWillAppear:animated];
	
}


- (void)viewDidLoad {
	[super viewDidLoad];
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7) {
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    
    
    else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }
    {
        // Create the location manager
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 10; //meters
        
        
        [self.locationManager startUpdatingLocation];
        
    }
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	
	MKCoordinateRegion region;
	
	region.center.latitude = 29.96013;
	region.center.longitude = -90.06295;
	region.span.longitudeDelta = 0.025;
	region.span.latitudeDelta = 0.026;
	[mapView setRegion:region animated:YES];
	[mapView setDelegate:self];
	
	mapView.showsUserLocation=TRUE;
	mapView.mapType=MKMapTypeStandard;
	
	CLLocationCoordinate2D c;
	
	//LOAD THE SITE LOCATIONS
	//SITE 1
	NSString *latitude =  @"29.9616";
	NSString *longitude = @" -90.0576";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	wwAnnotation *annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:1];
	annotation.mTitle=@"1. Old U.S. Mint";
	annotation.mSubTitle=@"400 Esplanade";
	annotation.annotationType = wwPin1;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 2
	latitude =  @"29.96183";
	longitude = @"-90.05968";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:2];
	annotation.mTitle=@"2. Le Richelieu";
	annotation.mSubTitle=@"1234 Chartres Street";
	annotation.annotationType = wwPin2;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 3
	latitude =  @"29.96188";
	longitude = @"-90.0612";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:3];
	annotation.mTitle=@"3. LaLaurie Mansion";
	annotation.mSubTitle=@"1140 Royal Street";
	annotation.annotationType = wwPin3;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 4
	latitude =  @"29.9609";
	longitude = @"-90.06045";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:4];
	annotation.mTitle=@"4. Old Ursuline Convent";
	annotation.mSubTitle=@"1100 Chartres Street";
	annotation.annotationType = wwPin4;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 5
	latitude =  @"29.96083";
	longitude = @"-90.06088";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:5];
	annotation.mTitle=@"5. Beauregard-Keyes House";
	annotation.mSubTitle=@"1113 Chartres Street";
	annotation.annotationType = wwPin5;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 6
	latitude =  @"29.9602";
	longitude = @"-90.06125";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:6];
	annotation.mTitle=@"6. Hotel Provincial";
	annotation.mSubTitle=@"1024 Chartres Street";
	annotation.annotationType = wwPin6;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 7
	latitude =  @"29.960984";
	longitude = @"-90.063553";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:7];
	annotation.mTitle=@"7. Lafitte's Blacksmith Shop";
	annotation.mSubTitle=@"941 Bourbon Street";
	annotation.annotationType = wwPin7;
	[mapView addAnnotation:annotation];
	[annotation release];
	//[mapView release];
	
	//SITE 8
	latitude =  @"29.96013";
	longitude = @"-90.06295";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:8];
	annotation.mTitle=@"8. Andrew Jackson Hotel";
	annotation.mSubTitle=@"919 Royal Street";
	annotation.annotationType = wwPin8;
	[mapView addAnnotation:annotation];
	[annotation release];
	//[mapView release];

	//SITE 9
	latitude =  @"29.958247";
	longitude = @"-90.063048";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:9];
	annotation.mTitle=@"9. Muriel's";
	annotation.mSubTitle=@"801 Chartres Street";
	annotation.annotationType = wwPin9;
	[mapView addAnnotation:annotation];
	[annotation release];
	//[mapView release];
    
    //SITE 10
	latitude =  @" 29.9586";
	longitude = @"-90.0635";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:10];
	annotation.mTitle=@"10. Place d'Armes Hotel";
	annotation.mSubTitle=@"625 St. Ann Street";
	annotation.annotationType = wwPin10;
	[mapView addAnnotation:annotation];
	[annotation release];
	//[mapView release];
    
    //SITE 11
    latitude =  @"29.95826";
    longitude = @"-90.06444";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:11];
    annotation.mTitle=@"11. Pirate Alley";
    annotation.mSubTitle=@"Pirate Alley and Royal Street";
    annotation.annotationType = wwPin11;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 12
    latitude =  @"29.95889";
    longitude = @"-90.06494";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:12];
    annotation.mTitle=@"12. Bourbon Orleans Hotel";
    annotation.mSubTitle=@"717 Orleans Street";
    annotation.annotationType = wwPin12;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 13
    latitude =  @"29.95978";
    longitude = @"-90.06761";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:13];
    annotation.mTitle=@"13. Old St. Peter St Cemetery";
    annotation.mSubTitle=@"St. Peter and Burgundy streets";
    annotation.annotationType = wwPin13;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 14
    latitude =  @"29.958200";
    longitude = @"-90.065350 ";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:14];
    annotation.mTitle=@"14. Pat O'Brien's";
    annotation.mSubTitle=@"718 St. Peter Street";
    annotation.annotationType = wwPin14;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 15
    latitude =  @"29.957580";
    longitude = @"-90.065302";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:15];
    annotation.mTitle=@"15. Court of Two Sisters";
    annotation.mSubTitle=@"613 Royal Street";
    annotation.annotationType = wwPin15;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 16
    latitude =  @"29.954293";
    longitude = @"-90.067980";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:16];
    annotation.mTitle=@"16. Hotel Monteleone";
    annotation.mSubTitle=@"214 Royal Street";
    annotation.annotationType = wwPin16;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 17
    latitude =  @"29.955383";
    longitude = @"-90.068361";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:17];
    annotation.mTitle=@"17. Old Absinthe House";
    annotation.mSubTitle=@"240 Bourbon Street";
    annotation.annotationType = wwPin17;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];
    
    //SITE 18
    latitude =  @"29.95909";
    longitude = @"-90.07105";
    c.latitude = [latitude doubleValue];
    c.longitude = [longitude doubleValue];
    annotation = [[wwAnnotation alloc] initWithCoordinate:c];
    annotation.currentPoint = [NSNumber numberWithInt:18];
    annotation.mTitle=@"18. St. Louis Cemetery No. 1";
    annotation.mSubTitle=@"425 Basin Street";
    annotation.annotationType = wwPin18;
    [mapView addAnnotation:annotation];
    [annotation release];
    //[mapView release];

	
	[self createSlideUpMapSettingsView];
	
	/*
	 [self loadStartScreen];
	 */
}
// Delegate method from the CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
}

- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
	int postag = 0;
	wwAnnotationView *annotationView = nil;
	wwAnnotation* myAnnotation = (wwAnnotation *)annotation;
	if (annotation == mapView.userLocation) return nil;
	else if(myAnnotation.annotationType == wwPin1)
		
	{
		NSString* identifier = @"Pin1";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin2)
	{
		NSString* identifier = @"Pin2";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin3)
	{
		NSString* identifier = @"Pin3";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin4)
	{
		NSString* identifier = @"Pin4";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin5)
	{
		NSString* identifier = @"Pin5";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin6)
	{
		NSString* identifier = @"Pin6";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin7)
	{
		NSString* identifier = @"Pin7";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin8)
	{
		NSString* identifier = @"Pin8";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin9)
	{
		NSString* identifier = @"Pin9";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
    }
        else if(myAnnotation.annotationType == wwPin10)
        {
            NSString* identifier = @"Pin10";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
	}
        else if(myAnnotation.annotationType == wwPin11)
        {
            NSString* identifier = @"Pin11";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin12)
        {
            NSString* identifier = @"Pin12";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin13)
        {
            NSString* identifier = @"Pin13";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin14)
        {
            NSString* identifier = @"Pin14";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin15)
        {
            NSString* identifier = @"Pin15";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin16)
        {
            NSString* identifier = @"Pin16";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin17)
        {
            NSString* identifier = @"Pin17";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
        else if(myAnnotation.annotationType == wwPin18)
        {
            NSString* identifier = @"Pin18";
            wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
            if(nil == newAnnotationView)
            {
                newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
            }
            annotationView = newAnnotationView;
        }
	
	
	NSLog(@"postag value in mkannotation method: %i",postag);
	//	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	//	annView.pinColor = MKPinAnnotationColorGreen;
	UIButton *myDetailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	//TO SET A CUSTOM BUTTON CHANGE ABOVE TO UIButtonTypeCustom and include the below code, change imageNamed to the file needed
	//myDetailButton.frame = CGRectMake(0, 0, 23, 23);
	//myDetailButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	//myDetailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	// Set the image for the button
	//[myDetailButton setImage:[UIImage imageNamed:@"button_right.png"] forState:UIControlStateNormal];
	[myDetailButton addTarget:self action:@selector(showLinks:) forControlEvents:UIControlEventTouchUpInside];
		
	if ([[annotation title] isEqualToString:@"Current Location"]) {
		postag = 99999;
	} else {
		postag = [myAnnotation.currentPoint intValue];
	} 
	
	
	myDetailButton.tag  = postag;
	NSLog(@"myDetailButton.tag value in mkannotation method: %li",(long)myDetailButton.tag);
	
	// Set the button as the callout view
	annotationView.rightCalloutAccessoryView = myDetailButton;
	
	//annotationView.animatesDrop=TRUE;
	annotationView.canShowCallout = YES;
	annotationView.calloutOffset = CGPointMake(-7,5);
	return annotationView;
}


- (IBAction)showLinks:(id)sender {
	NSInteger nrbuttonPressed = ((UIButton *)sender).tag;
    NSLog(@"nrbuttonpressed value: %li",(long)nrbuttonPressed);
	if (nrbuttonPressed < 99999) {
		
		if (nrbuttonPressed == 1){
			NSLog(@"nrbuttonpressed if = 1 executed");
			NSString *viewControllerName = @"PageOneViewController";
			childController = [[PageOneViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 2){
			NSLog(@"nrbuttonpressed if = 2 executed");
			NSString *viewControllerName = @"PageTwoViewController";
			childController = (PageOneViewController *)[[PageTwoViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 3){
			NSLog(@"nrbuttonpressed if = 3 executed");
			NSString *viewControllerName = @"PageThreeViewController";
			childController = (PageOneViewController *)[[PageThreeViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 4){
			NSLog(@"nrbuttonpressed if = 4 executed");
			NSString *viewControllerName = @"PageFourViewController";
			childController = (PageOneViewController *)[[PageFourViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 5){
			NSLog(@"nrbuttonpressed if = 5 executed");
			NSString *viewControllerName = @"PageFiveViewController";
			childController = (PageOneViewController *)[[PageFiveViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 6){
			NSLog(@"nrbuttonpressed if = 6 executed");
			NSString *viewControllerName = @"PageSixViewController";
			childController = (PageOneViewController *)[[PageSixViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 7){
			NSLog(@"nrbuttonpressed if = 7 executed");
			NSString *viewControllerName = @"PageSevenViewController";
			childController = (PageOneViewController *)[[PageSevenViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 8){
			NSLog(@"nrbuttonpressed if = 8 executed");
			NSString *viewControllerName = @"PageEightViewController";
			childController = (PageOneViewController *)[[PageEightViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 9){
			NSLog(@"nrbuttonpressed if = 9 executed");
			NSString *viewControllerName = @"PageNineViewController";
			childController = (PageOneViewController *)[[PageNineViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
		if (nrbuttonPressed == 10){
			NSLog(@"nrbuttonpressed if = 10 executed");
			NSString *viewControllerName = @"PageTenViewController";
			childController = (PageOneViewController *)[[PageTenViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
        if (nrbuttonPressed == 11){
            NSLog(@"nrbuttonpressed if = 11 executed");
            NSString *viewControllerName = @"PageElevenViewController";
            childController = (PageOneViewController *)[[PageElevenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 12){
            NSLog(@"nrbuttonpressed if = 12 executed");
            NSString *viewControllerName = @"PageTwelveViewController";
            childController = (PageOneViewController *)[[PageTwelveViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 13){
            NSLog(@"nrbuttonpressed if = 13 executed");
            NSString *viewControllerName = @"PageThirteenViewController";
            childController = (PageOneViewController *)[[PageThirteenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 14){
            NSLog(@"nrbuttonpressed if = 14 executed");
            NSString *viewControllerName = @"PageFourteenViewController";
            childController = (PageOneViewController *)[[PageFourteenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 15){
            NSLog(@"nrbuttonpressed if = 15 executed");
            NSString *viewControllerName = @"PageFifteenViewController";
            childController = (PageOneViewController *)[[PageFifteenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 16){
            NSLog(@"nrbuttonpressed if = 16 executed");
            NSString *viewControllerName = @"PageSixteenViewController";
            childController = (PageOneViewController *)[[PageSixteenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 17){
            NSLog(@"nrbuttonpressed if = 17 executed");
            NSString *viewControllerName = @"PageSeventeenViewController";
            childController = (PageOneViewController *)[[PageSeventeenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }
        if (nrbuttonPressed == 18){
            NSLog(@"nrbuttonpressed if = 18 executed");
            NSString *viewControllerName = @"PageEighteenViewController";
            childController = (PageOneViewController *)[[PageEighteenViewController alloc] initWithNibName:viewControllerName bundle:nil];
        }





			
		childController.hidesBottomBarWhenPushed = YES;
		//childController.backButtonName = @"Map";
		[self.navigationController pushViewController:childController animated:YES];	
		
		//Deselect the selected annotation when the disclosure button is selected
		wwAnnotation * annotation;
		for (annotation in mapView.selectedAnnotations) {
			[mapView deselectAnnotation:annotation animated:NO];
		}
		
		[annotation release];
		[childController release]; //THIS IS NEW
	}
}



-(IBAction)mapType:(UISegmentedControl *)segmentPick {
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			mapView.mapType = MKMapTypeStandard; //plain mapview
			break;
		case 1:
			mapView.mapType = MKMapTypeSatellite; //satellite
			break;
		default:
			break;
	}
}


- (void)createSlideUpMapSettingsView {
	CGRect bounds = [[self view] bounds];
	CGRect frame = CGRectMake(CGRectGetMinX(bounds), -MAPSETTINGSCONTAINERHEIGHT, bounds.size.width, MAPSETTINGSCONTAINERHEIGHT);
	mapSettingsView = [[UIView alloc] initWithFrame:frame];
	[mapSettingsView setBackgroundColor:[UIColor blackColor]];
	[mapSettingsView setOpaque:NO];
	[mapSettingsView setAlpha:0.75];
	UISegmentedControl *locationControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"GPS On",@"GPS Off",nil]];
	locationControl.frame = CGRectMake(25, 7, 120, 30);
	[locationControl addTarget:self action:@selector(toggleUserLocation:) forControlEvents:UIControlEventValueChanged];
	locationControl.momentary = NO;
	//locationControl.tintColor = [UIColor blackColor];
	[mapSettingsView addSubview:locationControl];
	[locationControl release];
	
	UISegmentedControl *mapTypeControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"Satellite",nil]];
	mapTypeControl.frame = CGRectMake(175, 7, 120, 30);
	[mapTypeControl addTarget:self action:@selector(mapType:) forControlEvents:UIControlEventValueChanged];
	mapTypeControl.momentary = NO;
	[mapSettingsView addSubview:mapTypeControl];
	[mapTypeControl release];
	
	[[self view] addSubview:mapSettingsView];
	[mapSettingsView release];
}


- (IBAction)toggleMapSettingsView {
	 
    CGRect frame = [mapSettingsView frame];
	NSLog(@"The value of mapsettingsshowing - toggle1 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
	
    if (mapSettingsShowing) 
	{
		frame.origin.y = -MAPSETTINGSCONTAINERHEIGHT;
	} 
	else {
		frame.origin.y = MAPSETTINGSSHOWHEIGHT;
	}
    
	[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [mapSettingsView setFrame:frame];
    [UIView commitAnimations];
	NSLog(@"The value of mapSettingsShowing - toggle2 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
    mapSettingsShowing = !mapSettingsShowing;
	NSLog(@"The value of mapSettingsShowing - toggle3 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
}

/*
- (void)loadStartScreen {
	introView *childController2 = [[introView alloc] init];
	childController2.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:childController2 animated:NO];
	[childController2 release];
}
*/
-(IBAction)toggleUserLocation:(UISegmentedControl *)segmentPick    {
    NSLog (@"mapview toggleuserlocation executed");
    switch (segmentPick.selectedSegmentIndex)
    {
        case 0:
            mapView.showsUserLocation = TRUE; //plain mapview
            UIAlertView *alertON = [[UIAlertView alloc] initWithTitle:@"Your Location" message:@"GPS location is turned ON"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertON show];
            [alertON release];
            break;
        case 1:
            
            mapView.showsUserLocation = FALSE; //satellite
            UIAlertView *alertOFF = [[UIAlertView alloc] initWithTitle:@"Your Location" message:@"GPS location is turned OFF" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertOFF show];
            [alertOFF release];
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
	NSLog (@"mapviewcontroller didreceive memory warning");
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
NSLog (@"mapviewcontroller viewdidunload");

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
//	[showDetailView release];
//	[startScreenButton release];
	NSLog (@"mapview dealloc");
	[mapView release];
    [super dealloc];
}

@end
