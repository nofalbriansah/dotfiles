{ config, pkgs, androidSdk, ... }:

{ 
  environment.systemPackages = with pkgs; [
    androidSdk
    flutter
    openjdk
    clang
    cmake
    ninja
    pkg-config-unwrapped

    android-studio
    google-chrome
  ];
  
  environment.variables = {
    ANDROID_HOME = "${androidSdk}/share/android-sdk";
    ANDROID_STUDIO_HOME = "${pkgs.android-studio}/lib/android-studio";
    FLUTTER_HOME = "${pkgs.flutter}/bin";
    JAVA_HOME = "${pkgs.openjdk}/lib/openjdk";
    CHROME_EXECUTABLE = "/etc/profiles/per-user/nbs/bin/google-chrome-stable"; 
  };
  
  environment.pathsToLink = [ 
    "/bin"
    "${androidSdk}/bin"
    "${androidSdk}/share/android-sdk/platform-tools" 
    "${pkgs.flutter}/bin"
    "${pkgs.vscode}/bin"
    "${pkgs.android-studio}/bin"
  ];
}
