//
//  NoServInstallation.h
//  NoServSDK
//
//  Created by JinWoo Lee on 2014. 11. 30..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

/**
 NoServInstallation 클래스
 
 Installation 생성
 Installation 가져오기
 Installation 변경
 Installation 검색
 갯수 검색
 Installation 삭제
 */
#import <Foundation/Foundation.h>
#import "JSONObject.h"
#import "ConditionalJSONObject.h"

typedef void (^JSONObjectFetched) (JSONObject *jsonObject);
typedef void (^JSONObjectListFetched) (NSArray *jsonObjectList);
typedef void (^CountFetched) (NSInteger count);
typedef void (^Error) (NSError *error);

@interface NoServInstallation : NSObject

/**
 Installation 생성
 
 @param deviceToken  Device Token
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)createWithDeviceToken:(NSString*)deviceToken onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;


/**
 Installation 가져오기
 
 @param objectId     Object Id
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)retrieveWithObjectId:(NSString*)objectId onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 Installation 변경
 
 @param objectId     Object Id
 @param jsonObject   변경할 오브젝트
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)updateWithObjectId:(NSString*)objectId withJSONObject:(JSONObject*)jsonObject onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 Installation 검색
 
 @param conditionJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param masterKey           Master Key
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)queryListWithConditionObject:(ConditionalJSONObject*)conditionalJsonObject withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(JSONObjectListFetched)successBlock;

/**
 갯수 검색
 
 @param conditionJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param masterKey           Master Key
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)getCountWithConditionObject:(ConditionalJSONObject*)conditionalJsonObject withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(CountFetched)successBlock;

/**
 Installation 삭제
 
 @param objectId     Object Id
 @param masterKey    Master Key
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)deleteWithObjectId:(NSString*)objectId withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;


@end
