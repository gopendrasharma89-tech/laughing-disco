#!/bin/bash
# Setup script to generate Gradle wrapper
# Run this script if gradle-wrapper.jar is missing

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f "gradle/wrapper/gradle-wrapper.jar" ]; then
    echo "Gradle wrapper jar not found. Generating..."
    
    # Check if gradle is available
    if command -v gradle &> /dev/null; then
        echo "Using system gradle to generate wrapper..."
        gradle wrapper --gradle-version 8.2
    else
        echo "Gradle not found. Downloading temporary Gradle installation..."
        
        TEMP_DIR=$(mktemp -d)
        cd "$TEMP_DIR"
        
        # Download Gradle
        echo "Downloading Gradle 8.2..."
        if command -v wget &> /dev/null; then
            wget -q https://services.gradle.org/distributions/gradle-8.2-bin.zip
        elif command -v curl &> /dev/null; then
            curl -sL https://services.gradle.org/distributions/gradle-8.2-bin.zip -o gradle-8.2-bin.zip
        else
            echo "ERROR: Neither wget nor curl found"
            exit 1
        fi
        
        # Extract and use
        unzip -q gradle-8.2-bin.zip
        ./gradle-8.2/bin/gradle wrapper --gradle-version 8.2 --project-dir "$SCRIPT_DIR"
        
        # Cleanup
        cd "$SCRIPT_DIR"
        rm -rf "$TEMP_DIR"
    fi
    
    echo "✓ Gradle wrapper generated successfully"
else
    echo "✓ Gradle wrapper already exists"
fi

chmod +x gradlew
echo "Setup complete! You can now run: ./gradlew build"
