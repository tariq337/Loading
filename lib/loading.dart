import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  Loading(
      {super.key,
      required this.isloading,
      required this.error,
      required this.body});
  bool isloading;
  String error;
  Widget body;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    if (widget.isloading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (widget.error.isNotEmpty) {
      return Center(
        child: Text(widget.error,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      );
    }
    return widget.body;
  }
}
