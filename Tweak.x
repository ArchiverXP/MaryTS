#include  <Foundation/NSObjCRuntime.h> 
#include <Foundation/NSURL.h>
#import <Foundation/NSNull.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSPathUtilities.h>

#ifdef THEOS_PACKAGE_SCHEME_ROOTFUL
#import <rootless.h>
#endif




%hook TFSAPIRequest

-(NSString*)endpointURLString{
	#ifdef THEOS_PACKAGE_SCHEME_ROOTFUL
	NSString *pathFile = ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.archiverxp.stchanger.plist");
	#else
	NSString *pathFile = @"/var/mobile/Library/Preferences/com.archiverxp.stchanger.plist";
	#endif

	if(pathFile == nil){
		NSLog(@"NULL");
	}
	NSMutableDictionary* plist = [[NSMutableDictionary alloc] initWithContentsOfFile:pathFile];
	NSString *patrick;
	NSString *urlString = patrick;
	NSString *serverURLF = [[NSBundle mainBundle] bundleIdentifier];
    serverURLF = [serverURLF stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	NSString *serverURL = [plist objectForKey:@"serverURL"];
	if([%orig containsString:@"https://api.twitter.com"]){
		NSLog(@"Patching base API path...");
		
		urlString = [%orig stringByReplacingOccurrencesOfString:@"https://api.twitter.com" withString:serverURL];
		if(urlString != nil){
			NSLog(@"Patched at: %@", urlString);
		}
		else{
			NSLog(@":( failed... ");
		}

		return urlString;
	}
	else if(%orig == nil || [%orig isEqual:[NSNull null]]){
		NSLog(@"STRING IS NULL");
	}

	return %orig;

}
// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end

%hook TFNTwitterAPI

+ (id)defaultApiRoot{
	#ifdef THEOS_PACKAGE_SCHEME_ROOTFUL
	NSString *pathFile = ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.archiverxp.stchanger.plist");
	#else
	NSString *pathFile = @"/var/mobile/Library/Preferences/com.archiverxp.stchanger.plist";
	#endif

	if(pathFile == nil){
		NSLog(@"NULL");
	}
	NSMutableDictionary* plist = [[NSMutableDictionary alloc] initWithContentsOfFile:pathFile];
	NSString *patrick;
	NSString *urlString = patrick;
	NSString *serverURLF = [[NSBundle mainBundle] bundleIdentifier];
    serverURLF = [serverURLF stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	NSString *serverURL = [plist objectForKey:@"serverURL"];
	if([%orig containsString:@"https://api.twitter.com"]){
		NSLog(@"Patching base API path...");
		
		urlString = [%orig stringByReplacingOccurrencesOfString:@"https://api.twitter.com" withString:serverURL];
		if(urlString != nil){
			NSLog(@"Patched at: %@", urlString);
		}
		else{
			NSLog(@":( failed... ");
		}

		return urlString;
	}
	else if(%orig == nil || [%orig isEqual:[NSNull null]]){
		NSLog(@"STRING IS NULL");
	}

	return %orig;

}
// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end



%hook TNLRequestConfiguration

+ (id)configurationWithSessionConfiguration:(id)arg1{
	%log;
	return %orig;
}

%end