import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PlaydayTimeline extends StatelessWidget {
  const PlaydayTimeline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 10.0,
            color: Colors.blueAccent,
          ),
          endChild: Container(
            margin: const EdgeInsets.all(4.5),
            child: Row(
              children: const [
                Text(
                  '1.º lote R\$ 10.0 - vagas 0/10',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          indicatorStyle: const IndicatorStyle(width: 10.0),
          endChild: Container(
            margin: const EdgeInsets.all(4.5),
            child: const Text(
              '2.º lote R\$ 20.0 - vagas 0/10',
              style: TextStyle(fontSize: 12.0, color: Colors.black87),
            ),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isLast: true,
          indicatorStyle: const IndicatorStyle(width: 10.0),
          endChild: Container(
            margin: const EdgeInsets.all(4.5),
            child: const Text(
              '3.º lote R\$ 30.0 - vagas 0/10',
              style: TextStyle(fontSize: 12.0, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
