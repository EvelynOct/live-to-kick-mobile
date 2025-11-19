import 'package:flutter/material.dart';
import 'package:live_to_kick/screens/productlist_form.dart';
import 'package:live_to_kick/screens/product_entry_list.dart';
import 'package:live_to_kick/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class ItemCard {
  final String name;
  final IconData icon;

  ItemCard(this.name, this.icon);
}

class ProductCard extends StatelessWidget {
  final ItemCard item;

  const ProductCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          }
          else if (item.name == "See Live to Kick") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage()
              ),
            );
          }
          // Add this after your previous if statements
          else if (item.name == "Logout") {
            // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
            // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
            // If you using chrome,  use URL http://localhost:8000

            final response = await request.logout(
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message See you again, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}