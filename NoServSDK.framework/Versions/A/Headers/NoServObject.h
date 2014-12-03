//
//  NoServObject.h
//  NoServSDK
//
//  Created by JinWoo Lee on 2014. 11. 25..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

/** NoServObject 클래스
 
 오브잭트 생성
 오브젝트 가져오기
 오브젝트 변경
 오브젝트 검색
 갯수 검색 
 오브젝트 삭제
 
 */

#import <Foundation/Foundation.h>
#import "JSONObject.h"
#import "ConditionalJSONObject.h"

typedef void (^JSONObjectFetched) (JSONObject *jsonObject);
typedef void (^JSONObjectListFetched) (NSArray *jsonObjectList);
typedef void (^CountFetched) (NSInteger count);
typedef void (^Error) (NSError *error);

@interface NoServObject : NSObject

/**
 오브젝트 생성
 
 @param className    클래스 이름
 @param jsonObject   생성할 오브젝트
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)createWithClassName:(NSString*)className withJSONObject:(JSONObject*)jsonObject onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 오브젝트 가져오기
 
 @param className    클래스 이름
 @param objectId     Object Id
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)retrieveWithClassName:(NSString*)className withObjectId:(NSString*)objectId onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 오브젝트 변경
 
 @param className    클래스 이름
 @param objectId     Object Id
 @param jsonObject   변경할 오브젝트
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)updateWithClassName:(NSString*)className withObjectId:(NSString*)objectId withJSONObject:(JSONObject*)jsonObject onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;

/**
 오브젝트 검색
 
 @param className           클래스 이름
 @param conditionJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)queryListWithClassName:(NSString*)className withConditionObject:(ConditionalJSONObject*)conditionalJsonObject onError:(Error)errorBlock onSuccess:(JSONObjectListFetched)successBlock;

/**
 갯수 검색
 
 @param className           클래스 이름
 @param conditionJsonObject 검색 조건 오브젝트(And 조건으로 묶임)
 @param errorBlock          오류시 호출되는 블럭
 @param successBlock        성공시 호출되는 블럭
 */
+(void)getCountWithClassName:(NSString*)className withConditionObject:(ConditionalJSONObject*)conditionalJsonObject  onError:(Error)errorBlock onSuccess:(CountFetched)successBlock;

/**
 오브젝트 삭제
 
 @param className    클래스 이름
 @param objectId     Object Id
 @param errorBlock   오류시 호출되는 블럭
 @param successBlock 성공시 호출되는 블럭
 */
+(void)deleteWithClassName:(NSString*)className withObjectId:(NSString*)objectId onError:(Error)errorBlock onSuccess:(JSONObjectFetched)successBlock;


@end
