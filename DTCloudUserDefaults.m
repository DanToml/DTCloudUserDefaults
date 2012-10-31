//
//  DTCloudUserDefaults.m
//
//  Created by Danielle Lancashire on 20/01/2012.
//  Copyright (c) 2012 Danielle Lancashire. All rights reserved.
//

#import "DTCloudUserDefaults.h"

@implementation DTCloudUserDefaults

+(void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserverForName:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotification"
                                                      object:[NSUbiquitousKeyValueStore defaultStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification* notification) {
                                                      NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                                                      NSUbiquitousKeyValueStore* cloud = [NSUbiquitousKeyValueStore defaultStore];
                                                      NSDictionary* changedKeys = [notification.userInfo objectForKey:@"NSUbiquitousKeyValueStoreChangedKeysKey"];
                                                      for (NSString* a in changedKeys) {
                                                          [defaults setObject:[cloud objectForKey:a] forKey:a];
                                                      }
                                                }];
    
}
+(void)removeNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:[NSUbiquitousKeyValueStore defaultStore]];
}

+(NSArray*)arrayForKey:(NSString*)aKey {
    NSMutableArray *returnArray = [DTCloudUserDefaults decodeArrayFromData:(NSData *)[DTCloudUserDefaults objectForKey:aKey]];
    return returnArray;
}

+(void)setArray:(NSArray*)anArray forKey:(NSString*)aKey {
    NSData *myData = [DTCloudUserDefaults encodeArrayForStorage:anArray];
    [DTCloudUserDefaults setObject:myData forKey:aKey];
}


+(NSString*)stringForKey:(NSString*)aKey {
    return [DTCloudUserDefaults objectForKey:aKey];
}

+(BOOL)boolForKey:(NSString*)aKey {
    return [[DTCloudUserDefaults objectForKey:aKey] boolValue];
}

+(id)objectForKey:(NSString*)aKey {
    NSUbiquitousKeyValueStore* cloud = [NSUbiquitousKeyValueStore defaultStore];
    id ret = [cloud objectForKey:aKey];
    if (!ret) {
        ret = [[NSUserDefaults standardUserDefaults] objectForKey:aKey];
        [cloud setObject:ret forKey:aKey];
    }
    return ret;
}

+(void)setString:(NSString*)aString forKey:(NSString*)aKey {
    [DTCloudUserDefaults setObject:aString forKey:aKey];
}

+(void)setBool:(BOOL)aBool forKey:(NSString*)aKey {
    [DTCloudUserDefaults setObject:[NSNumber numberWithBool:aBool] forKey:aKey];
}

+(void)setObject:(id)anObject forKey:(NSString*)aKey {
    [[NSUbiquitousKeyValueStore defaultStore] setObject:anObject forKey:aKey];
    [[NSUserDefaults standardUserDefaults] setObject:anObject forKey:aKey];
}

+(void)removeObjectForKey:(NSString*)aKey {
    [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:aKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:aKey];
}

+(void)synchronize {
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSData *)encodeArrayForStorage:(NSArray *)ArrayToEncode {
    NSData *encodedArray = [NSKeyedArchiver archivedDataWithRootObject:ArrayToEncode];
    return encodedArray;
}
+(NSMutableArray *)decodeArrayFromData:(NSData *)DataToDecode {
    NSMutableArray *decodedArray = [NSKeyedUnarchiver unarchiveObjectWithData:DataToDecode];
    return decodedArray;
}




@end
