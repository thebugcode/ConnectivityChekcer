# ConnectivityChecker
This is a code sample on how to show a Modal View Controller overlay when your device is connected to 2g/3g/4g instead of Wifi. It also
If you tap  "I agree" it will remember your choice and not warn you until the next app cold start.

Architecturally this code sample uses an Interactor (see VIPER for more details) which responds to a simple interface:
```language-Swift
    func shouldAllowLargeDownloads() -> Bool 
    func temporarilyDisableLargeDownloadsWarnings()
```
