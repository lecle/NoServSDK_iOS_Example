//
//  ObjectViewController.m
//  NoServExample
//
//  Created by JinWoo Lee on 2014. 12. 3..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

#import "ObjectViewController.h"
#import <NoServSDK/NoServSDK.h>

@interface ObjectViewController ()
@end

@implementation ObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createTouched:(id)sender {
    
    [self clearLog];
    
    NSString *className = @"test_class";
    
    JSONObject *jsonObject = [[JSONObject alloc] init];
    [jsonObject putValue:@"value" forKey:@"key"];
    
    [NoServObject createWithClassName:className withJSONObject:jsonObject onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
    
    
}

- (IBAction)retrieveTouched:(id)sender {
    
    [self clearLog];
    
    NSString *className = @"test_class";
    
    JSONObject *jsonObject = [[JSONObject alloc] init];
    [jsonObject putValue:@"value" forKey:@"key"];
    
    [NoServObject retrieveWithClassName:className withObjectId:@"54f942e2fccca1df54a6e0e2" onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
}

- (IBAction)updateTouched:(id)sender {
    
    [self clearLog];
    
    NSString *className = @"test_class";
    
    JSONObject *updateJsonObject = [[JSONObject alloc] init];
    [updateJsonObject putValue:@"value2" forKey:@"key2"];
    
    [NoServObject updateWithClassName:className withObjectId:@"54f942e2fccca1df54a6e0e2" withJSONObject:updateJsonObject onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(JSONObject *jsonObject) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObject.description];
    }];
    
}

- (IBAction)queryTouched:(id)sender {
    
    [self clearLog];
    
    NSString *className = @"test_class";
    
    
    [NoServObject queryListWithClassName:className withConditionObject:nil onError:^(NSError *error) {
        [self appendLog:@"Error"];
        [self appendLog:error.userInfo.description];
    } onSuccess:^(NSArray *jsonObjectList) {
        [self appendLog:@"Success"];
        [self appendLog:jsonObjectList.description];
        
    }];
    
    
}

- (IBAction)deleteTouched:(id)sender {

    [self clearLog];
    
    NSString *className = @"test_class";
    
    [NoServObject deleteWithClassName:className withObjectId:@"54aa5257362ffe104d6332251" onError:^(NSError *error) {
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
