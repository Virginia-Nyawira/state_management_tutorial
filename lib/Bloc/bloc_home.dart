import 'package:flutter/material.dart';

class BlockHomeView extends StatefulWidget {
  const BlockHomeView({super.key});

  @override
  State<BlockHomeView> createState() => _BlockHomeViewState();
}

class _BlockHomeViewState extends State<BlockHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('data', style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
      ),
    );
  }
}
