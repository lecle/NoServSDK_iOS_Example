//
//  FileViewController.m
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import "FileViewController.h"
#import <NoServSDK/NoServSDK.h>

@interface FileViewController ()

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)backTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)uploadTouched:(id)sender {
    
    [self clearLog];
    
    
    UIImage *yourImage = [UIImage imageNamed:@"game.jpg"];
    if(yourImage == nil)
    {
        [self appendLog:@"Error"];
        [self appendLog:@"File error"];
    }
    
    NSData *imageData = UIImagePNGRepresentation(yourImage);
    
    [NoServFile uploadData:imageData withName:@"game.jpg" withContentType:@"image/jpg" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
    
}

- (IBAction)deleteTouched:(id)sender {
    
    [self clearLog];
    
    NSString *masterKey = @"mX0mOUFYTyt93ErSMvOMsaMgsZ8zHulH";
    
    [NoServFile deleteFromName:@"game.jpg" withMasterKey:masterKey onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
    
}


-(void)appendLog:(NSString*)log
{
    self.logView.text = [self.logView.text stringByAppendingFormat:@"\n%@", log];
}

-(void)clearLog
{
    self.logView.text = @"";
}

@end
