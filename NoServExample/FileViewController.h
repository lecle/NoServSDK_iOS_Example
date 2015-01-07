//
//  FileViewController.h
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *logView;
- (IBAction)backTouched:(id)sender;
- (IBAction)uploadTouched:(id)sender;
- (IBAction)deleteTouched:(id)sender;


@end
