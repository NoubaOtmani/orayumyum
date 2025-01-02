import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Widget child;
  const CustomScaffold({super.key, required this.child});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFDF8),
              Color(0xffFFE1D1),
            ],
          )),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: widget.child,
          ),
          ),
          
    );
  }
}
