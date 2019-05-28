#import "DemoPlugin.h"
#import <demo_plugin/demo_plugin-Swift.h>

@implementation DemoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDemoPlugin registerWithRegistrar:registrar];
}
@end
