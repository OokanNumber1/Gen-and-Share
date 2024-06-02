import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Flexible(
              child: Text(content.replaceFirst("-", "")),
            ),
            const SizedBox(width: 16),
            
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Share.share(content);
                },
                child: const Icon(Icons.share),
              ),
            )
          ],
        ),
      ),
    );
  }
}
