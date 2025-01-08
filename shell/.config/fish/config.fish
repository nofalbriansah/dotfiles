#Config
set -g fish_greeting ''
starship init fish | source

#My Path
set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -x PATH $PATH $JAVA_HOME/bin

set -x ANDROID_HOME /home/nbs/dev/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/platform-tools
# flutter config --jdk-dir
set -x PATH $PATH /home/nbs/dev/flutter/bin

set -x PATH $PATH /home/nbs/dev/bun/bin

