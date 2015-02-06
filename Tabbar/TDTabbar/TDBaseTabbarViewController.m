//
//  TDBaseTabbarViewController.m
//  Tabbar
//
//  Created by thuydd on 2/6/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import "TDBaseTabbarViewController.h"

@interface TDBaseTabbarViewController ()

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


@end
