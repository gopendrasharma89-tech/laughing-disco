pluginManagement {
    repositories {
        google { content { includeGroupByRegex("com\\.android.*") } }
        mavenCentral { content { includeGroupByRegex("org\\.jetbrains.*") } }
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
