#!/bin/sh

##############################################################################
# Gradle start up script for POSIX - Self-bootstrapping version
##############################################################################

# Attempt to set APP_HOME
app_path=$0
while
    APP_HOME=${app_path%"${app_path##*/}"}
    [ -h "$app_path" ]
do
    ls=$( ls -ld "$app_path" )
    link=${ls#*' -> '}
    case $link in
      /*)   app_path=$link ;;
      *)    app_path=$APP_HOME$link ;;
    esac
done

APP_BASE_NAME=${0##*/}
APP_HOME=$( cd "${APP_HOME:-./}" > /dev/null && pwd -P ) || exit

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD=$JAVA_HOME/jre/sh/java
    else
        JAVACMD=$JAVA_HOME/bin/java
    fi
    if [ ! -x "$JAVACMD" ] ; then
        echo "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
        exit 1
    fi
else
    JAVACMD=java
    if ! command -v java >/dev/null 2>&1 ; then
        echo "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
        exit 1
    fi
fi

# Check if wrapper jar exists
if [ ! -f "$CLASSPATH" ]; then
    echo "Gradle wrapper jar not found. Bootstrapping..."
    
    GRADLE_VERSION=8.2
    GRADLE_DIST_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
    GRADLE_HOME="$HOME/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
    
    if [ ! -d "$GRADLE_HOME/gradle-${GRADLE_VERSION}" ]; then
        echo "Downloading Gradle ${GRADLE_VERSION}..."
        mkdir -p "$GRADLE_HOME"
        TEMP_ZIP=$(mktemp)
        
        if command -v wget >/dev/null 2>&1; then
            wget -q "$GRADLE_DIST_URL" -O "$TEMP_ZIP" || {
                echo "Failed to download Gradle"
                exit 1
            }
        elif command -v curl >/dev/null 2>&1; then
            curl -sL "$GRADLE_DIST_URL" -o "$TEMP_ZIP" || {
                echo "Failed to download Gradle"
                exit 1
            }
        else
            echo "ERROR: Neither wget nor curl found"
            exit 1
        fi
        
        echo "Extracting Gradle..."
        unzip -q "$TEMP_ZIP" -d "$GRADLE_HOME"
        rm -f "$TEMP_ZIP"
    fi
    
    GRADLE_BIN="$GRADLE_HOME/gradle-${GRADLE_VERSION}/bin/gradle"
    if [ ! -x "$GRADLE_BIN" ]; then
        echo "ERROR: Gradle binary not found at $GRADLE_BIN"
        exit 1
    fi
    
    echo "Using Gradle from $GRADLE_BIN"
    exec "$GRADLE_BIN" "$@"
fi

# Use wrapper jar if it exists
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

set -- \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "$CLASSPATH" \
    org.gradle.wrapper.GradleWrapperMain \
    "$@"

exec "$JAVACMD" "$@"
