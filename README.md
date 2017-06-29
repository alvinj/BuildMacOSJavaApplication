# Building a MacOS application from a Java Jar file

This project contains an Ant build script that can be used to convert
a Java application into a MacOS application. It won’t create a “perfect”
Mac/Java application where you’ll have menu items like Preferences and Quit
under the application name in the menu bar, but it will at least let you
create an application that in many ways looks like a MacOS application,
including having an icon you can click on.


## Requirements

The requirements I’m aware of for building a Mac/Java application using this build
process are:

1. You’ll need Java. I tested this with Java 1.8 on MacOS 10.12.5.
1. You’ll need Ant. I tested this with Ant 1.10.1, which I installed with Homebrew.
1. Make sure JAVA_HOME is set. (You may get an error if it isn’t set.)
1. Your Java application needs to be in one Jar file (i.e., like *hello.jar*).
1. I think the application needs a *META-INF/MANIFEST.MF* file in that Jar file.

The biggest assumption is that your application completely exists in one
Jar file such that you can run it with the `java -jar` command. If you have
that, this build process should work.


## Building your application

To build your application:

1. Put your Jar file in the current directory.
1. Change the variables at the top of the *build.xml* file.
1. In the MacOS Terminal (or similar app), type `ant` to build the application.
1. Assuming you named your application “HellWorld”, type `open release/HellWorld.app` to run your application.

If all goes well, your application will be shown in a few moments. (I assume your
application is a Java Swing or JavaFX GUI app.)


### Font smoothing

Java applications built like this seem to have non-smooth fonts on MacOS. This is usually
immediately apparent in the title bar of your application. To get a smooth
font with your application, follow this build process:

- Edit the *_addHiResKeyToPlistFile.sh*
- Set the APP_NAME variable in that file to the same app_name you use in the
  *build.xml* file
- Run the script named *_build.sh* to build your application. If you look at
  that script you’ll see that it (a) runs `ant`, then (b) runs the
  *_addHiResKeyToPlistFile.sh* script. That script adds the 
  `NSHighResolutionCapable` key to the application’s *Info.plist*
  file.



### Setting the “application category”

If you’re going to build an application that you want to distribute to
other users, such as through the Apple/Mac store, you’ll want to be sure
to set the `app_category` variable in the *build.xml* file properly. This 
variable is used to set the `LSApplicationCategoryType` key in the
*Info.plist* file in your application.

See [this apple.com url](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/LaunchServicesKeys.html#//apple_ref/doc/uid/TP40009250-SW8) for more information. In case
that URL ever goes away, I also included those value names in the file in
this project named *LSApplicationCategoryType.txt*.



## Notes

This build process uses the Sun/Oracle AppBundler Jar file, which is 
documented [here](http://docs.oracle.com/javase/7/docs/technotes/guides/jweb/packagingAppsForMac.html).



## More information

For more information, see this article on my website:

- [How to build a macOS application from a Java Jar file](http://alvinalexander.com/java/how-build-macos-application-from-java-jar-file-jarbundler)


Alvin Alexander    
[alvinalexander.com](http://alvinalexander.com)












