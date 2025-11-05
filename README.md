## Assignment 7
1. Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
In Flutter, the widget tree is a structure that represents the entire user interface 
(UI) of the application. Every visible and invisible component (buttons, text, layout 
containers, etc.) is a widget, and they are arranged in a hierarchical structure, similar to a 
family tree.

Root: The top-level widget (usually MaterialApp or CupertinoApp).

Branches: Layout widgets like Column, Row, or Padding.

Leaves: Simple, atomic widgets like Text, Icon, or Image.

Parent-Child Relationships
Every widget in the UI is either a parent or a child (or both).

A Parent Widget is a container or structural element that takes one or more widgets as its children. Examples: Scaffold, Column, Row.

A Child Widget is contained within a parent.

How it works: A widget's build method is responsible for returning the next widget in the tree. This establishes the relationship: the widget returned by a parent's build method is its child, and so on. This hierarchy determines the layout, styling, and interactivity of the entire UI.
2. List all the widgets you used in this project and explain their functions.
3. What is the function of the MaterialApp widget? Explain why this widget is often used as the root widget.
4. Explain the difference between StatelessWidget and StatefulWidget. When would you choose one over the other?
5. What is BuildContext and why is it important in Flutter? How is it used in the build method?
6. Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”.