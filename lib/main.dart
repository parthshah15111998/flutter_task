import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/dashboard_screen/dashboard_provider/dashboard_provider.dart';
import 'package:parth_shah_task_1/login_view/login_provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'workspace_screens/workspace_provider/workspace_provider.dart';
import 'workspace_screens/workspace_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkspaceProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkSpaceScreen(),
    );
  }
}
