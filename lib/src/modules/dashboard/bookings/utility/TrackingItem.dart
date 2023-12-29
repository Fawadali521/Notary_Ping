// ignore_for_file: file_names

import '../../../../../index.dart';

class TrackingItem extends StatelessWidget {
  final String time; // The time of the tracking item
  final String title; // The title of the tracking item

  const TrackingItem({
    super.key,
    required this.time,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, // Display the title of the tracking item
            style: TextStyles.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            time, // Display the time of the tracking item
            style: TextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
