/* import '/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Account Information'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logged in as ${snapshot.data?.email}'),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => logout(context),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
 */

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:notification_demo/services/notification_service.dart';
import 'package:notifications_app/services/notification_service.dart';
import '/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }

  void _showTestNotification() {
    NotificationService.createNotification(
      id: 1,
      title: 'Test Notification',
      body: 'This is a test notification from Awesome Notifications',
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Account Information'),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logged in as ${snapshot.data?.email}'),
                      const SizedBox(height: 24),
                      OutlinedButton(
                        onPressed: () => logout(context),
                        child: const Text('Logout'),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _showTestNotification,
                        child: const Text('Send Test Notification'),
                      ),
                      // Her kan du legge til flere knapper for ulike notifikasjoner
                      OutlinedButton(
                        onPressed: () async {
                          await NotificationService.createNotification(
                            id: 1,
                            title: 'Default Notification',
                            body: 'This is the body of the notification',
                            summary: 'Small summary',
                          );
                        },
                        child: const Text('Default Notification'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
