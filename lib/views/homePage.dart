import 'package:flutter/material.dart';
import 'package:pixabay_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabay != null) {
            return ListView.builder(
              itemBuilder: (context, index) =>Container(

              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
