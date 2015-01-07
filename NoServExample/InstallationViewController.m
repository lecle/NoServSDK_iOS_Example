//
//  InstallationViewController.m
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import "InstallationViewController.h"
#import <NoServSDK/NoServSDK.h>

@interface InstallationViewController ()

@end

@implementation InstallationViewController

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

- (IBAction)createTouched:(id)sender {
    
    [self clearLog];
    
    NSString *deviceToken = [NSString stringWithFormat:@"c%d", (int)[[NSDate date] timeIntervalSince1970]];
    
    [NoServInstallation createWithDeviceToken:deviceToken withJSONObject:nil onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
        
    }];
}

- (IBAction)retrieveTouched:(id)sender {
    
    [self clearLog];
    
    [NoServInstallation retrieveWithObjectId:@"54ab4d1d362ffe104d633228" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
        
    }];
    
}

- (IBAction)updateTouched:(id)sender {
    
    [self clearLog];
    
    JSONObject *updateJsonObject = [[JSONObject alloc] init];
    [updateJsonObject putValue:@"deviceToken" forKey:@"deviceToken"];
    
    [NoServInstallation updateWithObjectId:@"54ab4d1d362ffe104d633228" withJSONObject:updateJsonObject onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
        
    }];
    
    
}

- (IBAction)queryTouched:(id)sender {
    
    [self clearLog];
    
    NSString *masterKey = @"mX0mOUFYTyt93ErSMvOMsaMgsZ8zHulH";
    
    [NoServInstallation queryListWithConditionObject:nil withMasterKey:masterKey onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NSArray *jsonObjectList) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObjectList.description];
        
    }];
    
    
}

- (IBAction)deleteTouched:(id)sender {
    
    [self clearLog];
    
    NSString *masterKey = @"mX0mOUFYTyt93ErSMvOMsaMgsZ8zHulH";
    
    [NoServInstallation deleteWithObjectId:@"54ab4d1d362ffe104d6332281"  withMasterKey:masterKey onError:^(NSError *error2) {
        [self appendLog:@"Error"];
        [self appendLog:error2.userInfo.description];
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
