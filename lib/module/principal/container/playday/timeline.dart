import 'package:flutter/material.dart';
import 'package:grafu/models/playday.dart';
import 'package:grafu/module/principal/container/playday/section_title.dart';
import 'package:grafu/styles/color.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PlaydayTimeline extends StatelessWidget {
  final Playday playday;

  const PlaydayTimeline({
    Key? key,
    required this.playday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const SectionTitle(title: 'Ingresso'),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.0,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 10.0,
              color: mainStrongText,
            ),
            endChild: Container(
              margin: const EdgeInsets.all(4.5),
              child: Row(
                children: [
                  Text(
                    '1.º lote R\$ ${playday.firstLot.price} - vagas ${playday.firstLot.vacancyFilled}/${playday.firstLot.vacancyFilled}',
                    style: const TextStyle(
                      color: mainStrongText,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          (playday.secoundLot != null)
              ? TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.0,
                  indicatorStyle: const IndicatorStyle(width: 10.0),
                  endChild: Container(
                    margin: const EdgeInsets.all(4.5),
                    child: Text(
                      '2.º lote R\$ ${playday.secoundLot!.price} - vagas ${playday.secoundLot!.vacancyFilled}/${playday.secoundLot!.vacancyFilled}',
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black87),
                    ),
                  ),
                )
              : Container(),
          (playday.thirdLot != null)
              ? TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.0,
                  isLast: true,
                  indicatorStyle: const IndicatorStyle(width: 10.0),
                  endChild: Container(
                    margin: const EdgeInsets.all(4.5),
                    child: Text(
                      '3.º lote R\$ ${playday.thirdLot!.price} - vagas ${playday.thirdLot!.vacancyFilled}/${playday.thirdLot!.vacancyFilled}',
                      style: const TextStyle(
                          fontSize: 12.0, color: Colors.black87),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
