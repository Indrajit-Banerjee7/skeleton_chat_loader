import 'package:flutter/material.dart';
import 'package:skeleton_chat_loader/skeleton_chat_loader.dart';

import 'colours.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeleton Chat Loader Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        children: [
          // Header with user details
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 25,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 16),
                Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.video_camera_back),
              ],
            ),
          ),
          
          // Skeleton Loader Chat Messages
          Expanded(
            child: ListView(
              children:  [
                MessageShimmerLoading(shimmerColors: [
    Colors.green.shade300,
    Colors.green.shade100,
    Colors.green.shade300,
  ],),
                MessageShimmerLoading(isSender:  true, shimmerColors: orangeShades,),
                MessageShimmerLoading(shimmerColors: redShades,),
                MessageShimmerLoading(isSender: true, shimmerColors: blueShades,),
                MessageShimmerLoading(shimmerColors: purpleShades),
                MessageShimmerLoading(isSender: true , shimmerColors: yellowShades,),
                MessageShimmerLoading(shimmerColors: pinkShades),
                MessageShimmerLoading(isSender: true, shimmerColors: brownShades),
              ],
            ),
          ),
          
          // Message input box at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle message sending action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
