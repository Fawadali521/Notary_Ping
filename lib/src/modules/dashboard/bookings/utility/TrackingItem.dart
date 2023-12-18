// ignore_for_file: file_names

import '../../../../../index.dart';

class TrackingItem extends StatelessWidget {
  final String time;
  final String title;

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
            title,
            style: TextStyles.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
