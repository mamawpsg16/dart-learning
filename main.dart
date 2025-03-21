import 'dart:math';
import 'greetings.dart' deferred as greetings show greetNamed, greetPositional;  // Import Everything EXCEPT Some Functions (hide)
import 'library.dart' as lib;
import 'variables.dart' as variables;
import 'controlflow_statements.dart' as controlflow;
import 'functions.dart' as functions;
import 'enums.dart';
import 'inheritance.dart';
import 'mixins.dart';
import 'abstract_classes.dart';
import 'interface_classes.dart';
import 'async.dart';
import 'exception.dart';

// import 'file.dart' show func1, func2;	//Import only specific functions
// import 'file.dart' hide func1;	//Import everything except func1
// import 'file.dart' as alias;	//Import with a namespace
import 'classes.dart' as classExample;
void main() async {
   print("App Started 🚀");
  /** VARIABLE DECLARATIONS */
  variables.example();

  /** CONTROL FLOW STATEMENTS */
  controlflow.example();

  /** FUNCTIONS */
  functions.example();

  /** IMPORTS */
  var intValue = Random().nextInt(10); 
  print(intValue);
  
   // ✅ Load the module when needed
  await greetings.loadLibrary();
  print(greetings.greetNamed(name : "Alice"));
  print("App In-Process 🚀");
  print(lib.greetNamed());
  print(lib.greetPositional("Bob"));
  print(lib.greetPositional());
  print(lib.add(2, 3));
  
  /** CLASSES */
  classExample.Spacecraft spacecraft = classExample.Spacecraft('Voyager I', DateTime(1977, 9, 5));
  spacecraft.describe();
  classExample.Spacecraft voyager3 = classExample.Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

/** ENUMS */
  print("-------------- ENUMS --------------");
  OrderStatus status = OrderStatus.shipped;
  print(status.message); // Output: Your order has been shipped.

   // Select a planet
  Planet myPlanet = Planet.jupiter;

  // Print details
  print('Planet: ${myPlanet.name}');
  print('Type: ${myPlanet.planetType}');
  print('Moons: ${myPlanet.moons}');
  print('Has Rings? ${myPlanet.hasRings}');
  print('Is a Giant? ${myPlanet.isGiant}');

  /** INHERITANCE */
  print("\n-------------- INHERITANCE --------------");
  Animal animal = Animal('Buldog', 'Black', "Dog");
  animal.eat();
  print(animal.breed);

  Dog dog = Dog('Buldog', 'Black', 'Blacky');
  dog.eat();
  dog.bark();
  print(dog.breed);

  /** MIXINS */
  print("\n-------------- MIXINS --------------");
  PilotedCraft pilotedCraft = PilotedCraft('Voyager I', DateTime(1977, 9, 5));
  pilotedCraft.describeCrew();

  /** ABSTRACT CLASSES */
  print("\n-------------- ABSTRACT CLASSES --------------");
  Payment payment1 = CreditCardPayment();
  payment1.processPayment(100.0);
  
  Payment payment2 = PayPalPayment();
  payment2.processPayment(50.0);

  /** INTERFACE CLASSES */
  print("\n-------------- INTERFACE CLASSES --------------");
   List<Notifiable> notifications = [
    SMSNotification(),
    EmailNotification(),
    PushNotification(),
  ];

  for (var notification in notifications) {
    notification.sendNotification("Your order has been shipped!");
  }

  /** ASYNC */
  print("\n-------------- ASYNC --------------");
  try {
    String data = await fetchUser();
    print('Data received: $data');
  } catch (e) {
    print('Error: $e');
  }

  /** EXCEPTION */
  print("\n-------------- EXCEPTION --------------");
  await fetchData();
}
