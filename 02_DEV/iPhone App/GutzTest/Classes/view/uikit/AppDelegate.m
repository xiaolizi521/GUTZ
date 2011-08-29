//
//  AppDelegate.m
//  GutzTest
//
//  Created by Gullinbursti on 06/15/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//



//
//  AppDelegate.m
//  MultiTouchObjectiveChipmunk
//
//  Created by Scott Lembcke on 7/24/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "GameConfig.h"
#import "ScreenManager.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
	
	//	CC_ENABLE_DEFAULT_GL_STATES();
	//	CCDirector *director = [CCDirector sharedDirector];
	//	CGSize size = [director winSize];
	//	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
	//	sprite.position = ccp(size.width/2, size.height/2);
	//	sprite.rotation = -90;
	//	[sprite visit];
	//	[[director openGLView] swapBuffers];
	//	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	
	/*
	 // CC_DIRECTOR_INIT()
	 //
	 // 1. Initializes an EAGLView with 0-bit depth format, and RGB565 render buffer
	 // 2. EAGLView multiple touches: disabled
	 // 3. creates a UIWindow, and assign it to the "window" var (it must already be declared)
	 // 4. Parents EAGLView to the newly created window
	 // 5. Creates Display Link Director
	 // 5a. If it fails, it will use an NSTimer director
	 // 6. It will try to run at 60 FPS
	 // 7. Display FPS: NO
	 // 8. Device orientation: Portrait
	 // 9. Connects the director to the EAGLView
	 //
	 CC_DIRECTOR_INIT();
	 
	 // Obtain the shared director in order to...
	 CCDirector *director = [CCDirector sharedDirector];
	 
	 // Sets landscape mode
	 //[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
	 
	 // Turn on display FPS
	 [director setDisplayFPS:YES];
	 
	 // Turn on multiple touches
	 EAGLView *view = [director openGLView];
	 [view setMultipleTouchEnabled:YES];
	 
	 // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	 // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	 // You can change anytime.
	 [CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];	
	 
	 
	 // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	 if( ! [director enableRetinaDisplay:YES] )
	 CCLOG(@"Retina Display Not supported");
	 
	 */
	
	
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Try to use CADisplayLink director
	// if it fails (SDK < 3.1) use the default director
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	
	CCDirector *director = [CCDirector sharedDirector];
	
	// Init the View Controller
	viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	viewController.wantsFullScreenLayout = YES;
	
	//
	// Create the EAGLView manually
	//  1. Create a RGB565 format. Alternative: RGBA8
	//	2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
	//
	//
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
								   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
						];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];
	[glView setMultipleTouchEnabled:TRUE];
	
	//	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	//	if( ! [director enableRetinaDisplay:YES] )
	//		CCLOG(@"Retina Display Not supported");
	
	//
	// VERY IMPORTANT:
	// If the rotation is going to be controlled by a UIViewController
	// then the device orientation should be "Portrait".
	//
	// IMPORTANT:
	// By default, this template only supports Landscape orientations.
	// Edit the RootViewController.m file to edit the supported orientations.
	//
	//>>#if GAME_AUTOROTATION == kGameAutorotationUIViewController
	[director setDeviceOrientation:kCCDeviceOrientationPortrait];
	//>>#else
	//[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
	//>>#endif
	
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:YES];
	
	
	// make the OpenGLView a child of the view controller
	[viewController setView:glView];
	
	// make the View Controller a child of the main window
	[window addSubview: viewController.view];
	
	[window makeKeyAndVisible];
	
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
	
	// Removes the startup flicker
	[self removeStartupFlicker];
	
	if (![director enableRetinaDisplay:YES])
		CCLOG(@"Retina Display Not supported");
	
	// Run the intro Scene
	[ScreenManager goMenu];
	//[[CCDirector sharedDirector] runWithScene: [HelloWorldLayer scene]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
	[viewController release];
	
	[window release];
	
	[director end];	
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	[[CCDirector sharedDirector] end];
	[window release];
	[super dealloc];
}

@end
