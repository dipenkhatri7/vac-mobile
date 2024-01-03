import 'package:flutter/material.dart';
import 'package:vac/core/common/widgets/gap.dart';
import 'package:vac/core/utils/get_k_m.dart';

class StreamInfo extends StatefulWidget {
  const StreamInfo({super.key, required this.title, required this.waching});
  final String title;
  final int waching;

  @override
  State<StreamInfo> createState() => _StreamInfoState();
}

class _StreamInfoState extends State<StreamInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          const HGap(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
                size: 20,
              ),
              VGap(width: 10),
              Text(
                '${formatNumber(widget.waching)} watching',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
