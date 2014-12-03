//
//  NoServPushInfo.h
//  NoServSDK
//
//  Created by JinWoo Lee on 2014. 12. 1..
//  Copyright (c) 2014년 JinWoo Lee. All rights reserved.
//

/**
 Push Notification Info 클래스
 */
#import <Foundation/Foundation.h>
#import "JSONObject.h"

@interface NoServPushInfo : JSONObject

/**
 Channel 목록에 값 추가
 
 @param channel Channel 값
 */
-(void)addChannel:(NSString*)channel;

/**
 Where Condition에 값 추가
 
 @param value 검색할 값
 @param key   검색할 키
 */
-(void)addConditionValue:(NSString*)value forKey:(NSString*)key;

/**
 Alert 값 설정(iOS, Android)
 
 @param alert Alert 값
 */
-(void)setAlert:(NSString*)alert;

/**
 Badge 값 설정(iOS)
 
 @param badgeCount Badge 수
 */
-(void)setBadge:(NSInteger)badgeCount;

/**
 Sound 값 설정(iOS)
 
 @param soundName Sound 파일 이름
 */
-(void)setSound:(NSString*)soundName;

/**
 Content Available 여부 설정(iOS)
 
 @param contentAvailable Content Available 여부 설정
 */
-(void)setContentAvailable:(BOOL)contentAvailable;


/**
 Category 값 설정(iOS)
 
 @param category Category 값
 */
-(void)setCategory:(NSString*)category;
/**
 Action 값 설정(Android)
 
 @param action Action 이름
 */
-(void)setAction:(NSString*)action;

/**
 Title 값 설정(Android)
 
 @param title Title 값 설정
 */
-(void)setTitle:(NSString*)title;

@end
