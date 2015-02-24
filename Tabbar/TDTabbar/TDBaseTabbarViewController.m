//
//  TDBaseTabbarViewController.m
//  Tabbar
//
//  Created by thuydd on 2/6/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import "TDBaseTabbarViewController.h"


@interface TDBaseTabbarViewController ()
{
    DCPathButton* btnPathTabbar;
}
@end

@implementation TDBaseTabbarViewController

/**
 *  viewControllerWithTabTitle
 *
 *  Create a view controller and setup it's tab bar item with a title and image
 *  @param title          NSString
 *  @param image          UIImage
 *  @param viewController UIViewController
 *
 *  @return UIViewController
 */
- (UIViewController*)viewControllerWithTabTitle:(NSString*) title
                                          image:(UIImage*)image
                                 viewController:(UIViewController *)viewController
{
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    return viewController;
}

/**
 *  addCenterButtonWithImage
 *
 *  Create a custom UIButton and add it to the center of our tab bar
 *  @param buttonImage    UIImage
 *  @param highlightImage UIImage
 */
- (void)addCenterButtonWithImage:(UIImage*)buttonImage
                  highlightImage:(UIImage*)highlightImage
{
    UIButton* btnTabbar = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTabbar.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    btnTabbar.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [btnTabbar setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [btnTabbar setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [btnTabbar addTarget:self action:@selector(clickCenter:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        btnTabbar.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        btnTabbar.center = center;
    }
    
    [self.view addSubview:btnTabbar];
}


- (void)clickCenter:(id)sender
{
    self.selectedIndex = self.viewControllers.count/2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - DCPathButtonCenter
/**
 *  addCenterDCPathButtonWithImage
 *
 *  Create a custom UIButton and add it to the center of our tab bar
 *  @param buttonImage    UIImage
 *  @param highlightImage UIImage
 */
- (void)addCenterDCPathButtonWithImage:(UIImage*)buttonImage
                        highlightImage:(UIImage*)highlightImage
{
    btnPathTabbar = [self pathButtonWithImage:buttonImage highlightImage:highlightImage];

    btnPathTabbar.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:btnPathTabbar];
}

/**
 *  pathButtonWithImage
 *
 *  @param buttonImage    UIImage
 *  @param highlightImage UIImage
 *
 *  @return DCPathButton
 */
- (DCPathButton *)pathButtonWithImage:(UIImage *)buttonImage
                      highlightImage:(UIImage *)highlightImage
{
    // Configure center button
    //
    CGPoint centerPoint;
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        centerPoint = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        centerPoint = center;
    }
    DCPathButton *dcPathButton = [[DCPathButton alloc] initWithButtonFrame:CGRectMake(centerPoint.x, centerPoint.y, buttonImage.size.width, buttonImage.size.height) CenterImage:buttonImage hilightedImage:highlightImage];
    
    dcPathButton.delegate = (id)self;
    
    // Configure item buttons

    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [dcPathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    
    // Change the bloom radius
    //
    dcPathButton.bloomRadius = 120.0f;
    dcPathButton.bloomDirection = DCPathButtonBloomTop;
    
    return dcPathButton;
}

#pragma mark - DCPathButtonDelegate

- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    NSLog(@"You tap at index : %zd", index);
}

- (void)tapTocenterButton
{
    if (self.selectedIndex == self.viewControllers.count/2) {
        [btnPathTabbar pathCenterButtonBloom];
    }
    else
    {
        self.selectedIndex = self.viewControllers.count/2;
    }
    
}

@end
