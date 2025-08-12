# Android Signing Template

1) Generate keystore (on your machine):
```
keytool -genkey -v -keystore aura-release.keystore -alias aura -keyalg RSA -keysize 2048 -validity 10000
```

2) Put `aura-release.keystore` in `android/keystore/` (create the folder).

3) Create/append to `android/key.properties` (DO NOT COMMIT SECRETS):
```
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=aura
storeFile=keystore/aura-release.keystore
```

4) In `android/app/build.gradle` (release buildTypes) set:
```
signingConfigs {
    release {
        if (project.hasProperty('keyProperties')) {
            storeFile file(keyProperties['storeFile'])
            storePassword keyProperties['storePassword']
            keyAlias keyProperties['keyAlias'])
            keyPassword keyProperties['keyPassword']
        }
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled false
        shrinkResources false
    }
}
```
