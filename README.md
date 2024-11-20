# flight-ui-mockup
Android Mock-Up for ScubaTx device's onboard UI

## FlutterFlow 

flutter flow is used to generate the UI for this mockup. When updating the UI, replace the /mvpui/assets and /mvpui/lib by those exported from FlutterFlow. *The backend directories should not be replaced*. 

### Connecting UI to backend
To connect FlutterFlow Frontend to backend, put 
```dart
import '../../components/auto_update.dart'; at the top
````
and 
```dart
autoUpdate(_model, (MainModel model) {
  _model  = model;
  setState(() {});
});
```
at the end of 
```dart
void initState() {
```
in /mvpui/lib/pages/main/main_widget.dart