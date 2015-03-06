//
//  PushViewController.m
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import "PushViewController.h"
#import <NoServSDK/NoServSDK.h>

@interface PushViewController ()

@end

@implementation PushViewController

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

- (IBAction)pushTouched:(id)sender {
    [self clearLog];
    
    
    NoServPushInfo *pushInfo = [[NoServPushInfo alloc] init];
    [pushInfo addChannel:@"Giants"];
    [pushInfo addWhereValue:YES forKey:@"scores"];
    [pushInfo addWhereValue:YES forKey:@"gameResults"];
    [pushInfo addWhereValue:YES forKey:@"injuryReports"];
    [pushInfo setAlert:@"The Giants won against the Mets 2-3."];
    
    [NoServPush sendWithPushInfo:pushInfo onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
    
    
}

- (IBAction)retrieveTouched:(id)sender {
    [self clearLog];
    
    NSString *objectId = @"54f9437dfccca1df54a6e0ed";
    
    NSString *masterKey = @"danhjjsa1k3p7gb9k2emsc0pe3ik9oty";
    
    [NoServPush retrieveWithObjectId:objectId withMasterKey:masterKey onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
        
    }];
    
    
}

- (IBAction)queryTouched:(id)sender {
    [self clearLog];
    
    NSString *masterKey = @"danhjjsa1k3p7gb9k2emsc0pe3ik9oty";
    
    [NoServPush queryListWithConditionObject:nil withMasterKey:masterKey onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NSArray *jsonObjectList) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObjectList.description];
        
    }];
    
}

- (IBAction)backTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
