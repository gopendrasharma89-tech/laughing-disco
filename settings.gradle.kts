pluginManagement {
    repositories {
        // Android and Kotlin plugins resolve transitive dependencies from
        // several groups, so filtering these repositories by plugin group
        // prevents Gradle from finding required artifacts.
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "OpenClawGo"
include(":app")
