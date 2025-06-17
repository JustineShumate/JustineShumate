import 'package:flutter/material.dart';

class FeaturedPage extends StatelessWidget {
  FeaturedPage({super.key});

  // Mock data for streamers
  final List<Map<String, dynamic>> streams = [
    {
      'title': 'IDK THURSDAY -> GIVEAWAY',
      'streamer': 'Prodigyddk',
      'avatar': '', // Add a URL or leave blank for default avatar
      'thumbnail': '', // Add a URL or leave blank for default image
    },
    {
      'title': 'Gaming with Liam',
      'streamer': 'Liam Carter',
      'avatar': '', // Add a URL or leave blank for default avatar
      'thumbnail': '', // Add a URL or leave blank for default image
    },
    // Add more mock streamers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: streams.length,
                itemBuilder: (context, index) {
                  return _buildStreamCard(streams[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        children: [
          Text(
            'Featured Streams',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreamCard(Map<String, dynamic> stream) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[900],
      child: InkWell(
        onTap: () {
          // TODO: Navigate to stream detail page (not required for you)
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildThumbnail(stream),
            _buildStreamInfo(stream),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(Map<String, dynamic> stream) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: stream['thumbnail'] != null && stream['thumbnail'].toString().isNotEmpty
            ? Image.network(
                stream['thumbnail'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[800],
                  child: const Center(child: Icon(Icons.broken_image, color: Colors.white54)),
                ),
              )
            : Container(
                color: Colors.grey[800],
                child: const Center(child: Icon(Icons.live_tv, color: Colors.greenAccent, size: 48)),
              ),
      ),
    );
  }

  Widget _buildStreamInfo(Map<String, dynamic> stream) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _buildAvatar(stream),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stream['title'] ?? 'Untitled Stream',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  stream['streamer'] ?? 'Unknown Streamer',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Viewer count removed as per requirements
        ],
      ),
    );
  }

  Widget _buildAvatar(Map<String, dynamic> stream) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey[850],
      backgroundImage: stream['avatar'] != null && stream['avatar'].toString().isNotEmpty
          ? NetworkImage(stream['avatar'])
          : null,
      child: (stream['avatar'] == null || stream['avatar'].toString().isEmpty)
          ? const Icon(Icons.person, color: Colors.white54)
          : null,
    );
  }
}
