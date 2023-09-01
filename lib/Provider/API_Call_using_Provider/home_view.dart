import 'package:flutter/material.dart';

class ProviderWithApi extends StatefulWidget {
  const ProviderWithApi({super.key});

  @override
  State<ProviderWithApi> createState() => _ProviderWithApiState();
}

class _ProviderWithApiState extends State<ProviderWithApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API and Provider with tutorial"),
      ),
    );
  }
}
