//
//  ViewController.m
//  Tabbar
//
//  Created by thuydd on 2/6/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewControllers = [NSArray arrayWithObjects:
                            [self viewControllerWithTabTitle:@"Home" image:[UIImage imageNamed:@"tab_feed.png"] viewController:[[UIViewController alloc] init]] ,
                            [self viewControllerWithTabTitle:@"Live" image:[UIImage imageNamed:@"tab_live"] viewController:[[UIViewController alloc] init]],
                            [self viewControllerWithTabTitle:@"" image:nil viewController:[[UIViewController alloc] init]],
                            [self viewControllerWithTabTitle:@"Profile" image:[UIImage imageNamed:@"tab_feed_profile.png"] viewController:[[UIViewController alloc] init]],
                            [self viewControllerWithTabTitle:@"Messages" image:[UIImage imageNamed:@"tab_messages.png"] viewController:[[UIViewController alloc] init]], nil];
    
     [self addCenterDCPathButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.selectedIndex = 2;
}


@end
