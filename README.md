## Assignment 7
1. Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.

In Flutter, the widget tree is a structure that represents the entire user interface (UI) of the application. Every visible and invisible component (buttons, text, layout containers, etc.) is a widget, and they are arranged in a hierarchical structure, similar to a family tree. The tree are made of:
> Root: The top-level widget (usually MaterialApp or CupertinoApp).
> 
> Branches: Layout widgets like Column, Row, or Padding.
> 
> Leaves: Simple, atomic widgets like Text, Icon, or Image.

Parent-Child Relationships:

Every widget in the UI is either a parent or a child (or both). A Parent Widget is a container or structural element that takes one or more widgets as its children. Examples: Scaffold, Column, Row. Meanwhile, a Child Widget is contained within a parent. A widget's build method is responsible for returning the next widget in the tree, so the widget returned by a parent's build method is its child, and so on. This hierarchy determines the layout, styling, and interactivity of the entire UI.

2. List all the widgets you used in this project and explain their functions.

> MyApp	(main.dart).	Function: Root Widget. Defines the starting point of the application.
> 
> MaterialApp	(main.dart).	Function: Framework Setup. Provides the necessary features for Material Design (themes, navigation, etc.).
> 
> ThemeData	(main.dart).	Function: Styling. Defines the visual properties (colors, fonts, etc.) for the entire app.
> 
> MyHomePage	(menu.dart).	Function: Page Structure. Represents the main screen/page of your application.
> 
> Scaffold	(menu.dart).	Function: Layout Structure. Implements the basic structure of a screen, providing slots for AppBar, body, and potentially a drawer.
> 
> AppBar	(menu.dart).	Function: Top Navigation/Header. Displays the title and common action buttons at the top of the screen.
> 
> Padding	(menu.dart).	Function: Spacing. Applies consistent space/padding around a single child widget.
> 
> Column	(menu.dart).	Function: Vertical Layout. Arranges its list of children widgets vertically.
> 
> Row	(menu.dart).	Function: Horizontal Layout. Arranges its list of children widgets horizontally.
> 
> SizedBox	(menu.dart).	Function: Fixed Space. Creates an empty box of a specific size, often used for adding vertical or horizontal spacing.
> 
> Center	(menu.dart).	Function: Alignment. Centers its single child widget within the parent.
> 
> Text	(main.dart and menu.dart).	Function: Text Display. Displays a string of text on the screen.
> 
> GridView.count	(menu.dart).	Function: Grid Layout. Displays its children in a two-dimensional scrollable array with a fixed number of columns (crossAxisCount).
> 
> Card	(menu.dart) (in InfoCard)	Function: Styling/Elevation. A container with slightly rounded corners and a shadow (elevation) to give a lifted, material look.
> 
> Material	(menu.dart) (in ItemCard)	Function: Visual Properties. Provides material properties like background color and borderRadius before adding interactivity.
> 
> InkWell	(menu.dart) (in ItemCard)	Function: Tappable Area. Makes its child widget respond to touch/tap events (onTap) and provides the famous ripple effect.
> 
> Icon	(menu.dart)	Icon Display. Function: Displays a graphical symbol from the Material Icons library.

3. What is the function of the MaterialApp widget? Explain why this widget is often used as the root widget.

Function:
> It brings in the necessary components and structure to create a consistent, Material Design-compliant application.
> 
> It defines the theme data (like primary colors, fonts, and overall styling) that all subsequent widgets will inherit.
> 
> It sets up the system for navigating between different screens using named routes (/home, /settings, etc.).
> 
> It manages global settings like locale, text direction, and displays the debug banner.

Why it's the Root Widget:
> MaterialApp is almost always the root widget because it's the entry point that has app-wide services and context needed for the rest of the application to function correctly. If you try to use widgets like Scaffold, AppBar, or even Text with inherited styles without a MaterialApp above them in the tree, they often won't work, as they rely on the environment that MaterialApp provides.

4. Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?

StatelessWidget:
> Immutable (cannot change after creation).
> Only rebuilds when its parent rebuilds, or when external data (like its constructor parameters) changes.
> Extends StatelessWidget and overrides the build method.
> Example: Text, Icon, Padding, Your MyHomePage

StatefulWidget:
> Mutable (data can change during the widget's lifetime).
> Rebuilds whenever setState() is explicitly called, or when its parent rebuilds.
> Extends StatefulWidget and overrides createState(), which creates an associated State object.
> Example: Checkbox, TextField, or a custom widget that contains a counter.

Choose StatelessWidget when the widget's appearance and behavior do not depend on anything that changes internally. Choose StatefulWidget when the widget needs to change its appearance or behavior based on user interaction (like clicking a button), network data, or other events that happens after it has been built.

5. What is BuildContext and why is it important in Flutter? How is it used in the build method?

BuildContext is essentially a handle or a reference to the location of a widget in the Widget Tree. Every widget has its own BuildContext as the widget's address or identity card within the application's UI structure. It's important because it tells the framework where a widget is located. It is also the primary way a widget can look up and access resources, services, or data provided by widgets higher up in the tree. This is crucial for accessing things like:

> Theme data: Theme.of(context)
> Navigation: Navigator.of(context)
> Media Queries (screen size): MediaQuery.of(context)

How is it Used in the build Method?
The build method signature for both StatelessWidget and StatefulWidget is:
> @override
> Widget build(BuildContext context) { ... }

The build method is where the widget describes its UI. By having BuildContext context passed into the method, the widget can use that context to access information it needs to render itself correctly in its current position.

6. Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”.

Hot reload:
> Injects new code into the running Dart Virtual Machine (VM).
> Very Fast (usually under a second).
> Preserves State. Maintains the current state of the app (e.g., a counter's value, text entered in a form).
> Styling/UI Changes. Used for changes inside a widget's build method, text changes, color changes, layout tweaks.

Hot restart:
> Stops the Dart VM, recompiles everything, and restarts the entire application.
> Fast, but noticeably slower than Hot Reload (a few seconds).
> Resets State. Clears all application state back to its initial condition (the app runs from void main()).
> Code Structure/App Logic Changes. Used when you modify void main(), change a global variable, modify a StatefulWidget's State class, or change native platform code.

So basically, we use Hot Reload for rapid UI iteration. Meanwhile we use Hot Restart when Hot Reload fails to reflect a deep structural change or you need to reset the app's state entirely.



## Assignment 8

1. Explain the difference between Navigator.push() and Navigator.pushReplacement() in Flutter. In what context of your application is each best used?
   
> Navigator.push() is used to add a new page onto the navigation stack, allowing the user to return to the previous page using the back button. It is used for navigation where users might want to go back (like opening a product details page).
> Navigator.pushReplacement() replaces the current page with a new one, removing the previous page from the stack. It is used for one-way navigation, like moving from a login page to the home page after successful authentication.

2. How do you use hierarchy widget like Scaffold, AppBar, dan Drawer to build a consistent page structure in the your application?

> **`Scaffold`:** This is the foundational widget for a single page. It provides the slots for the main structural components, ensuring every page has a standard layout canvas.
> 
> **`AppBar`:** Placed in the `appBar` slot of the `Scaffold`, it provides consistent elements like the screen **Title**, the automatic **Back Button** (leading), and action icons (like the **Shopping Cart**).
> 
> **`Drawer`:** Placed in the `drawer` slot of the `Scaffold`, it is used for global, secondary navigation links (e.g., **My Orders**, **Settings**). Using it keeps the main screen clean while providing uniform access to other major sections of the app.

```dart
// Example of a consistent page structure
Scaffold(
  appBar: AppBar(
    title: const Text('Live to Kick'), // Consistent title and branding
    // ... actions
  ),
  drawer: Drawer( // Consistent global navigation panel
    child: ListView(
      // ... navigation links
    ),
  ),
  body: Center(
    child: Text('Main Page Content'),
  ),
);
```

3. In the context of user interface design, what do you think is the advantages of using layout widget like Padding, SingleChildScrollView, and ListView when displaying form elements? Provide usage examples from your application.
> These layout widgets are crucial for creating a responsive, clean, and user-friendly experience, especially in forms. Their main advantages are preventing UI errors and improving readability:
> 
> Padding (Visual Separation)	Adds "breathing room" around form fields. This prevents them from feeling cramped, improves readability, and makes each field an easier and more obvious tap target.
> 
> SingleChildScrollView	(Prevents Pixel Overflow) Wraps the form, making it scrollable. This is essential for forms, as it prevents the "bottom overflow" error when the keyboard appears and covers the bottom half of the screen.
> 
> ListView (Efficient Scrolling Structure) Acts like a Column and SingleChildScrollView combined. It's excellent for long forms or dynamic forms where fields might be added or removed, as it handles scrolling efficiently.
>
> Example Padding and ListView:
```dart
child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Live to Kick',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "All the latest football updates here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
```
> Example SingleChildScrollView:
```dart
child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
```

4. How do you set the color theme so that your Football Shop have a visual identity that is consistent with the shop brand.
> You achieve a consistent visual identity by defining a global ThemeData object and passing it to the theme property of the root MaterialApp widget. This ensures that all widgets in the application (like AppBar, ElevatedButton, FloatingActionButton, etc.) automatically inherit the brand's colors and styles. We can set the colorScheme or older properties like primaryColor and accentColor. For my website it has backgroundColor: Theme.of(context).colorScheme.primary, but each of the button colors is different to match Assignment 7.
