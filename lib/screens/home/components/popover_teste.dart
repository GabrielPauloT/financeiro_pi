import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../../login.dart';
import '../profile_screan.dart';

class PopoverExample extends StatelessWidget {
  const PopoverExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Popover Example')),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Button(),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: const Center(child: Text('Click Me')),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 150),
            bodyBuilder: (context) => const ListItems(),
            // ignore: avoid_print
            /* onPop: () => print('Popover was popped!'), */
            direction: PopoverDirection.top,
            width: 200,
            height: 400,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            /* InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<ProfileScreen>(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: const Color(0xFF1A202E),
                child: const ListTile(
                    title: Text('Meu Perfil',
                        style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.ac_unit, color: Colors.white)),
              ),
            ), */
            Container(
              height: 50,
              color: const Color(0xFF1A202E),
              child: const ListTile(
                  title: Text('Victor Pereira',
                      style: TextStyle(color: Colors.white)),
                  leading: Icon(Icons.ac_unit, color: Colors.white)),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.white,
              child: const ListTile(
                title: Text('teste@hotmail.com'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.edit, color: Colors.green),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.white,
              child: const ListTile(
                title: Text('*********'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.edit, color: Colors.green),
              ),
            ),
            const Divider(),
            /* const SizedBox(
              width: 50,
              height: 50,
              /* color: Colors.amber[200], */
              child: Center(child: Text('')),
            ),
            const Divider(),
            const SizedBox(
              width: 50,
              height: 50,
              /* color: Colors.amber[300], */
              child: Center(child: Text('')),
            ), */
            const Padding(padding: EdgeInsets.only(top: 110)),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const SizedBox(
                width: 50,
                height: 50,
                /* color: Colors.amber[300], */
                child:
                    ListTile(title: Text('Sair'), leading: Icon(Icons.ac_unit)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
