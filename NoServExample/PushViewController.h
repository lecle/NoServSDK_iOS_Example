//
//  PushViewController.h
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *logView;
- (IBAction)pushTouched:(id)sender;
- (IBAction)retrieveTouched:(id)sender;
- (IBAction)queryTouched:(id)sender;
- (IBAction)backTouched:(id)sender;


@end
