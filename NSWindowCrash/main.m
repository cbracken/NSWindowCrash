#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSWindow* window = [[NSWindow alloc] init];

    // With this line uncommented, the crash is avoided.
    // window.releasedWhenClosed = NO;

    // With this line, crashes during autorelease pool pop.
    [window close];
  }
  // Crash on autorelease pool pop.
  return 0;
}
