# NSWindow crash when immediately closed after allocation

This app demonstrates a bug in which closing an NSWindow immediately after
allocation will cause a crash when the containing autorelease pool is flushed.

This crash can be avoided by either:
* Setting `releasedWhenClosed` to `NO`.
* Not closing the window.

Radar: http://www.openradar.me/FB13291861

### Expected behaviour
Closing an NSWindow immediately after allocation should succeed.

### Actual behaviour
Closing an NSWindow immediately after allocation, followed by being flushed from
the autorelease pool causes a crash with the following stack trace.

```
Thread 0 Crashed::  Dispatch queue: com.apple.main-thread
0   libobjc.A.dylib               	       0x18d8f7ed8 objc_release + 16
1   libobjc.A.dylib               	       0x18d8ff418 AutoreleasePoolPage::releaseUntil(objc_object**) + 196
2   libobjc.A.dylib               	       0x18d8fbaf0 objc_autoreleasePoolPop + 260
3   NSWindowCrash                 	       0x102213f40 main + 96 (main.m:12)
4   dyld                          	       0x18d945058 start + 2224
```

## Reproduction steps
1. From Xcode, build and launch the app.
