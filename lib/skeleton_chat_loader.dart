library skeleton_chat_loader;

import 'package:flutter/material.dart';

class MessageShimmerLoading extends StatefulWidget {
  
  final double height;
  final bool isSender;
  final double maxWidth;
  final List<Color>? shimmerColors;

  const MessageShimmerLoading({
    super.key,
    
    this.height = 50,          
    this.isSender = false,
    this.maxWidth = 280,
    this.shimmerColors,
  });

  @override
  State<MessageShimmerLoading> createState() => _MessageShimmerLoadingState();
}

class _MessageShimmerLoadingState extends State<MessageShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Default shimmer colors if none are passed
    List<Color> shimmerColors = widget.shimmerColors ?? [
      Colors.grey.shade300,
      Colors.grey.shade100,
      Colors.grey.shade300,
    ];
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          
          height: widget.height,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: widget.isSender 
                ? MainAxisAlignment.end 
                : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: widget.maxWidth),
                child: Column(
                  crossAxisAlignment: widget.isSender 
                      ? CrossAxisAlignment.end 
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Message bubble placeholder
                    Container(
                      width: widget.maxWidth * 0.8,
                      height: widget.height - 16, // Adjust for margin
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: widget.isSender
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(4),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                        gradient: LinearGradient(
                          begin: Alignment(_animation.value, 0),
                          end: const Alignment(2, 0),
                          colors: shimmerColors ,
                          stops: const [0.1, 0.3, 0.4],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

