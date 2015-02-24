//
//  TDBaseTabbarViewController.h
//  Tabbar
//
//  Created by thuydd on 2/6/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCPathButton.h"

@interface TDBaseTabbarViewController : UITabBarController <DCPathButtonDelegate>


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
                                 viewController:(UIViewController *)viewController;


/**
 *  addCenterButtonWithImage
 *
 *  Create a custom UIButton and add it to the center of our tab bar
 *  @param buttonImage    UIImage
 *  @param highlightImage UIImage
 */
- (void)addCenterButtonWithImage:(UIImage*)buttonImage
                  highlightImage:(UIImage*)highlightImage;


#pragma mark - DCPathButtonCenter
/**
 *  addCenterDCPathButtonWithImage
 *
 *  Create a custom UIButton and add it to the center of our tab bar
 *  @param buttonImage    UIImage
 *  @param highlightImage UIImage
 */
- (void)addCenterDCPathButtonWithImage:(UIImage*)buttonImage
                        highlightImage:(UIImage*)highlightImage;


@end
