//
//  PageThirteenViewController.h
//  WickedWalksNewOrleans
//
//  Created by Diane on 8/23/17.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PageThirteenViewController : UIViewController <AVAudioPlayerDelegate>
{
    IBOutlet UIScrollView *scrollView;
    UIColor *defaultTintColor;
    
    UIView *slideUpView;
    
    AVAudioPlayer *player;
    UIButton *playButton;
    UISlider *progressBar;
    UILabel *currentTime;
    UILabel *duration;
    NSTimer	*updateTimer;
    
    BOOL stopAudioOverride;
}

@property (nonatomic, retain) AVAudioPlayer	*player;
@property (nonatomic, retain) UIButton *playButton;
@property (nonatomic, retain) UISlider *progressBar;
@property (nonatomic, retain) UILabel *currentTime;
@property (nonatomic, retain) UILabel *duration;

- (IBAction)photoTapped:(id)sender;

@end


