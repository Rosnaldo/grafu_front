# Grafu Frontedn

## Specifications 
platforms: Web | Android | Ios <br>
framework: Flutter <br>
other tools: Firebase(Authentication and image storage) and Stripe (Payment) <br>

<br>
 
## Architeture decisitons
• State management ValueNotifier and Mobx <br>
• Modular Architeture <br>
• Widgets divided in two layers (Container and Business) <br>
• Clean Architeture concepts <br>

<br>

ValueNotifier was used for small scoped functions and triple statement when fetching data and loading the page. <br>
Mobx is been used for global stores. <br>
Business functionalities are divided into modules with an eye on the future in case you need to split into micro-frontends. <br>



<br>

## Flutter build runner

```
flutter pub run build_runner clean
flutter pub run build_runner watch
```

## deploy

```
flutter build web
firebase deploy
```
