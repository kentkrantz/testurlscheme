# testurlscheme

## How do I define URL Scheme?

1. Add this to Info.plist
```xml
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLName</key>
		<string>com.yourcompany.testurlscheme</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>testus</string>
		</array>
	</dict>
</array>
```

2. Add these to AppDelegate.m
```objective-c
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    //    if (!url) {
    //        return NO;
    //    }
    NSLog(@">>>>>>>>>>>> 11111");
    NSLog(@"url recieved: %@", url);
    NSLog(@"query string: %@", [url query]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"url path: %@", [url path]);
    NSDictionary *dict = [self parseQueryString:[url query]];
    NSLog(@"query dict: %@", dict);
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    NSLog(@">>>>>>>>>>>> 22222");
    NSLog(@"url recieved: %@", url);
    NSLog(@"query string: %@", [url query]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"url path: %@", [url path]);
    NSDictionary *dict = [self parseQueryString:[url query]];
    NSLog(@"query dict: %@", dict);
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@">>>>>>>>>>>> 33333");
    NSLog(@"url recieved: %@", url);
    NSLog(@"query string: %@", [url query]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"url path: %@", [url path]);
    NSDictionary *dict = [self parseQueryString:[url query]];
    NSLog(@"query dict: %@", dict);
    return YES;
}

- (NSDictionary *)parseQueryString:(NSString *)query
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}
```