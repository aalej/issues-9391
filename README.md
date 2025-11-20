# Repro for issue 9391

## Versions

firebase-tools: v14.25.1<br>
flutter: v3.35.4

## Steps to reproduce

1. Install libraries
   - Run `my_test_app`
   - Run `flutter pub get`
   - Run `cd ../`
2. Run `firebase dataconnect:sdk:generate`
   - This will generate `./my_test_app/lib/dataconnect_generated/update_profile.dart`, which has the error

<image  src="./images/sdk-error.png"/>
