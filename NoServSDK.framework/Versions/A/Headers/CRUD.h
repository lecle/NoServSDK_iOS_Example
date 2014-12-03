//
//  CRUD.h
//  NoServSDK
//
//  Created by JinWoo Lee on 2014. 11. 22..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "JSONObject.h"
typedef void (^Error) (NSError *error);
typedef void (^JSONObjectFetched) (JSONObject* jsonObject);
typedef void (^UrlError) (NSString *error);

/** Create(Post), Read(Get), Update(Put), Delete 형식 정의 인터페이스
 */
@interface CRUD : NSObject

/** Read(Get) 형식 정의
 
 @param url 접속 URL
 @param urlErrorBlock 접속 오류시 호출되는 블럭
 @param errorBlock 일반 오류시 호출되는 블럭
 @param fetchedBlock 결과를 가져왔을 때 호출되는 블럭
 */
+(void)get:(NSString*)url onError:(Error)errorBlock onFetched:(JSONObjectFetched)fetchedBlock;

/** Create(Post) 형식 정의
 
 @param url 접속 URL
 @param json 전송할 JSON
 @param urlErrorBlock 접속 오류시 호출되는 블럭
 @param errorBlock 일반 오류시 호출되는 블럭
 @param fetchedBlock 결과를 가져왔을 때 호출되는 블럭
 */
+(void)post:(NSString*)url json:(NSString*)json onError:(Error)errorBlock onFetched:(JSONObjectFetched)fetchedBlock;

/** Update(Put) 형식 정의
 
 @param url 접속 URL
 @param json 업데이트할 JSON
 @param urlErrorBlock 접속 오류시 호출되는 블럭
 @param errorBlock 일반 오류시 호출되는 블럭
 @param fetchedBlock 결과를 가져왔을 때 호출되는 블럭
 */
+(void)put:(NSString*)url json:(NSString*)json onError:(Error)errorBlock onFetched:(JSONObjectFetched)fetchedBlock;


/** Delete 형식 정의
 
 @param url 접속 URL
 @param urlErrorBlock 접속 오류시 호출되는 블럭
 @param errorBlock 일반 오류시 호출되는 블럭
 @param fetchedBlock 결과를 가져왔을 때 호출되는 블럭
 */
+(void)delete:(NSString*)url onError:(Error)errorBlock onFetched:(JSONObjectFetched)fetchedBlock;

@end
