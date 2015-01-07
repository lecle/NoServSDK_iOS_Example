//
//  UserViewController.h
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *logView;
- (IBAction)backTouched:(id)sender;
- (IBAction)createTouched:(id)sender;
- (IBAction)logInTouched:(id)sender;
- (IBAction)retrieveTouched:(id)sender;
- (IBAction)validateTouched:(id)sender;
- (IBAction)updateTouched:(id)sender;
- (IBAction)queryTouched:(id)sender;
- (IBAction)deleteTouched:(id)sender;

@end
