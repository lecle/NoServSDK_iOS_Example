//
//  NoServInstallation.h
//  NoServSDK
//
//  Created by JinWoo Lee on 2014. 11. 30..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ConditionalJSONObject.h"
#import "ResultBlock.h"

/**
 NoServInstallation 클래스
 
 Installation 생성
 Installation 가져오기
 Installation 변경
 Installation 검색
 갯수 검색
 Installation 삭제
 */
@interface NoServInstallation : NSObject

/**
 Installation 생성
 
 @param deviceToken  Device Token
 @param jsonObject   정보 오브젝트
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)createWithDeviceToken:(NSString*)deviceToken withJSONObject:(JSONObject*)jsonObject onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;


/**
 Installation 가져오기
 
 @param objectId     Object ID
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)retrieveWithObjectId:(NSString*)objectId onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 Installation 변경
 
 @param objectId     Object ID
 @param jsonObject   변경할 오브젝트
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)updateWithObjectId:(NSString*)objectId withJSONObject:(JSONObject*)jsonObject onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 Installation 검색
 
 @param conditionalJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param masterKey           Master Key
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)queryListWithConditionObject:(ConditionalJSONObject*)conditionalJsonObject withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(JSONObjectListFetched)successBlock;

/**
 갯수 검색
 
 @param conditionalJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param masterKey           Master Key
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)getCountWithConditionObject:(ConditionalJSONObject*)conditionalJsonObject withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(CountFetched)successBlock;

/**
 Installation 삭제
 
 @param objectId     Object ID
 @param masterKey    Master Key
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)deleteWithObjectId:(NSString*)objectId withMasterKey:(NSString*)masterKey onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;


@end
