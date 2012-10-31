//
//  DTCloudUserDefaults.h
//
//  Created by Danielle Lancashire on 20/01/2012.
//  Copyright (c) 2012 Danielle Lancashire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCloudUserDefaults : NSObject

+(NSString*)stringForKey:(NSString*)aKey;
+(BOOL)boolForKey:(NSString*)aKey;
+(id)objectForKey:(NSString*)aKey;
+(NSArray*)arrayForKey:(NSArray*)aKey;

+(void)setString:(NSString*)aString forKey:(NSString*)aKey;
+(void)setBool:(BOOL)aBool forKey:(NSString*)aKey;
+(void)setObject:(id)anObject forKey:(NSString*)aKey;
+(void)setArray:(NSArray*)anArray forKey:(NSString*)aKey;

+(void)removeObjectForKey:(NSString*)aKey;

+(void)synchronize;

+(void)registerForNotifications;
+(void)removeNotifications;

+(NSData *)encodeArrayForStorage:(NSArray *)ArrayToEncode;
+(NSMutableArray *)decodeArrayFromData:(NSData *)DataToDecode;

@end
