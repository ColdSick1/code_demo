import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  static late BuildContext _context;
  static BuildContext get context => _context;

  @override
  Widget build(BuildContext context) {
    RootScreen._context = context;
    return const AutoRouter();
  }
}
