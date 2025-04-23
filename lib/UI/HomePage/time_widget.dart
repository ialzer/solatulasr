import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeWidgetStateController extends GetxController {
  DateTime now = DateTime.now().toUtc().add(const Duration(hours: 5));

  late List<DateTime> getTimesList;

  TimeWidgetStateController() {
    getTimesList = [
      DateTime(now.year, now.month, now.day, 4, 5),
      DateTime(now.year, now.month, now.day, 5, 31),
      DateTime(now.year, now.month, now.day, 12, 21),
      DateTime(now.year, now.month, now.day, 17, 10),
      DateTime(now.year, now.month, now.day, 19, 16),
      DateTime(now.year, now.month, now.day, 20, 34),
    ];
  }

  Duration getCountdownToNextTime() {
    print(DateTime.now().timeZoneName);
    for (DateTime time in getTimesList) {
      if (now.isBefore(time)) {
        return time.difference(now);
      }
    }

    return Duration.zero;
  }

  String printCountdown() {
    Duration countdown = getCountdownToNextTime();

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(countdown.inHours);
    String minutes = twoDigits(countdown.inMinutes.remainder(60));
    String seconds = twoDigits(countdown.inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TimeWidgetStateController controller = Get.put(
      TimeWidgetStateController(),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((0.3 * 255).toInt()),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.1 * 255).toInt()),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Qolgan vaqt',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                controller.printCountdown(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),
              const Text(
                'Keyingi ibodat: Shom',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '19:45',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
