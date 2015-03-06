//
//  UserViewController.m
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import "UserViewController.h"
#import <NoServSDK/NoServSDK.h>
@interface UserViewController ()

@end

@implementation UserViewController

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
    
    NoServUserInfo *userInfo = [[NoServUserInfo alloc] init];
    [userInfo setUsername:@"user1"];
    [userInfo setPassword:@"pass1"];
    [userInfo putValue:@"01011111111" forKey:@"phone"];
    
    [self appendLog:@"UserInfo"];
    [self appendLog:userInfo.description];
    
    
    [NoServUser signUpWithUserInfo:userInfo onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
    }];
}

- (IBAction)logInTouched:(id)sender {
    
    [self clearLog];
    
    NoServUserInfo *userInfo = [[NoServUserInfo alloc] init];
    [userInfo setUsername:@"user1"];
    [userInfo setPassword:@"pass1"];
    
    [self appendLog:@"UserInfo"];
    [self appendLog:userInfo.description];
    
    
    [NoServUser logInWithUserInfo:userInfo onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
    }];
}

- (IBAction)retrieveTouched:(id)sender {
    [self clearLog];
    
    [NoServUser retrieveWithObjectId:@"54f9378a5a28dc57548de6be" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
    }];
    
}

- (IBAction)validateTouched:(id)sender {
    [self clearLog];
    
    [NoServUser validateMeWithSessionToken:@"izXd17p348MdlOun" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
    }];
    
}

- (IBAction)updateTouched:(id)sender {
    
    [self clearLog];
    
    NSString *newPhone = [NSString stringWithFormat:@"phone%d", (int)[[NSDate date] timeIntervalSince1970]];
    
    NoServUserInfo *newUserInfo = [[NoServUserInfo alloc] init];
    [newUserInfo putValue:newPhone forKey:@"phone"];
    
    [NoServUser updateWithObjectId:@"54f6bfae996a0fd11bee7d92" withSessionToken:@"izXd17p348MdlOun" withUserInfo:newUserInfo onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
    }];
}

- (IBAction)queryTouched:(id)sender {
    
    [self clearLog];
    
    [NoServUser queryListWithConditionObject:nil onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NSArray *userInfoList) {
        [self appendLog:@"Success"];
        [self appendLog:userInfoList.description];
        
    }];
    
}

- (IBAction)deleteTouched:(id)sender {
    [self clearLog];
    
    [NoServUser deleteWithObjectId:@"54756c3dd4da9f163a4edf3b1" withSessionToken:@"izXd17p348MdlOun" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NoServUserInfo *userInfo) {
        [self appendLog:@"Success"];
        [self appendLog:userInfo.description];
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
