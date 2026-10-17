#import <Cocoa/Cocoa.h>
#include <cstdio>
int main(){@autoreleasepool{NSArray*apps=[NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.tencent.inputmethod.wetype"];if(apps.count!=1){fprintf(stderr,"expected one main WeType app; got%lu\n",(unsigned long)apps.count);return 2;}NSRunningApplication*a=apps[0];if(![a.executableURL.path isEqualToString:@"/Library/Input Methods/WeType.app/Contents/MacOS/WeType"]){fprintf(stderr,"unexpected executable\n");return 3;}printf("quitting_pid=%d\n",a.processIdentifier);return [a terminate]?0:4;}}
