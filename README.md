# cordova-enyo

A toolset for generating Cordova (PhoneGap) apps that work with the Enyo app development framework.

[Apache Cordova](http://cordova.io) is the engine behind [Adobe PhoneGap](http://phonegap.com) - it enables you to create native mobile applications using HTML, CSS, and JavaScript. 

[Enyo](http://enyojs.com) is an open-source, component-based JavaScript framework for building mobile or web-based apps. 

cordova-enyo is an integration of [Cordova's command-line interface (CLI)](https://github.com/apache/cordova-cli) and [Enyo's Bootplate template app](https://github.com/enyojs/bootplate), making it easy to jumpstart a Cordova-enabled Enyo app.


# Requirements

* [git](http://git-scm.com/)
* [cordova-cli:](https://github.com/apache/cordova-cli) The README provides a good overview of the installation procedure. A more detailed description, including information on how to set up all the platform-specific toolsets you might need is available [here](http://photokandy.tumblr.com/post/46289610781/getting-started-with-cordova-cli)

cordova-enyo has been tested on Mac OS X, using the iOS and Android SDKs.


# Quick Start

    git clone https://github.com/linkmediainc/cordova-enyo
    cd cordova-enyo
    ./bin/ce-create ./MyApp com.mydomain.myapp MyApp
    cd MyApp  
    cordova platform add ios
    cordova build
    cordova emulate
    
**NOTE**: To continue developing, edit the CSS and JavaScript files in the `MyApp/enyo/source` directory, rather than the `www` directory - this follows the conventions for Enyo development and is different than most Cordova apps. For more details, see "Developing Your App" below.


# Details

## ce-create

`ce-create` is the script that generates the Cordova-enabled Enyo application. To run it, make sure `cordova-enyo/bin` is in your `$PATH`, or else just specify the path (per the Quick Start example above).

`ce-create` takes the exact same arguments as the `cordova create` command; in fact, the arguments are passed in directly.

    ce-create <directory> [<id> [<name>]]
  
If you omit the `id` and `name` arguments, the create command will generate workable defaults based on the directory name.

`ce-create` runs `cordova create` to generate the new application, then fetches the latest version of the Enyo bootplate template and places it into the `enyo` directory at the top of your new app directory. 

## Developing Your App

Once `ce-create` has been successfully run, you will use the standard `cordova-cli` commands to build and run your app, as well as to manage which platforms you want to build for. The [cordova-cli page](https://github.com/apache/cordova-cli) provides documentation for these commands.

**IMPORTANT NOTE:** Unlike most Cordova apps, you will do most of your development in the `enyo/source` directory. If you've done Cordova or PhoneGap development before, you're probably used to working in the `www` directory. This difference is due to the way that Enyo apps are built. 

Enyo's bootplate template is set up to minify all of the JavaScript assets before deployment - this is a useful step as Enyo is a fairly large project, and the minification step keeps the package size small and speeds up the app's startup time. `cordova-enyo` takes advantages of hooks in the `cordova-cli` build commands, so that Enyo's build commands are run whenever `cordova build` is invoked. The output of the Enyo build process is then transferred to the `www` directory where it's picked up by Cordova's build command and transferred to the platform-specific build directory.


# Resources

* [Enyo Home](http://enyojs.com) - includes documentation and tutorials
* [Apache Cordova Home]
* [How PhoneGap Relates To Cordova](http://phonegap.com/2012/03/19/phonegap-cordova-and-what%E2%80%99s-in-a-name/) - a guide for the confused 