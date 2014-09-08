//
//  AKViewController.m
//  AKCircularProgressBar
//
//  Created by Aikong on 8/31/2557 BE.
//  Copyright (c) 2557 Mongkol Munglarkthum. All rights reserved.
//

#import "AKViewController.h"
#import "AKCircularProgressBar.h"

@interface AKViewController ()
{
    NSTimer* m_timer;
}
@property AKCircularProgressBar * progressBar;
@end

@implementation AKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _progressBar = [[AKCircularProgressBar alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _progressBar.center = self.view.center;
    [self.view addSubview:_progressBar];
    _progressBar.progress = 0;
    _progressBar.tintColor = [UIColor colorWithRed:255.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin
{

    if (_progressBar.progress <1) {
        _progressBar.progress = _progressBar.progress + 0.01;
        _progressBar.text = [NSString stringWithFormat:@"%d%%",(int)(_progressBar.progress*100) ];
        [_progressBar setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}

@end
