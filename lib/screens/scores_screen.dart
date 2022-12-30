import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Results",
          style: TextStyle(
            color: Color(0xff4d1a53),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24.0),
          const ScoreLabel(
            title: "Total Semen Analysis",
            result: "High",
            resultMetrix: "31 g/L",
            color: Colors.amber,
          ),
          const Gap(34.0),
          Graph(
            max: 5.25,
            min: 0,
            interval: 2,
            value: 3.1,
            markerColor: Colors.amber,
            points: [
              Point(0, "Normal"),
              Point(2, "High"),
              Point(4, "Very High"),
            ],
            ranges: [
              Range(0, 2, Theme.of(context).primaryColor),
              Range(2, 4, Colors.amber),
              Range(4, 5.8, const Color(0xffD02251)),
            ],
          ),
          const Gap(24.0),
          const Divider(height: 34),
          const Gap(24.0),
          const ScoreLabel(
            title: "Total Marker",
            result: "High",
            resultMetrix: "31 g/L",
            color: Colors.amber,
          ),
          const Gap(34.0),
          Graph(
            max: 5.25,
            min: 0,
            interval: 2,
            value: 3.1,
            markerColor: Colors.amber,
            points: [
              Point(0, "Normal"),
              Point(2, "High"),
              Point(4, "Very High"),
            ],
            ranges: [
              Range(0, 2, Theme.of(context).primaryColor),
              Range(2, 4, Colors.amber),
              Range(4, 5.8, const Color(0xffD02251)),
            ],
          ),
          const Gap(24.0),
          const Divider(height: 34),
          const Gap(24.0),
          const ScoreLabel(
            title: "Total Bloods",
            result: "High",
            resultMetrix: "31 g/L",
            color: Colors.amber,
          ),
          const Gap(34.0),
          Graph(
            max: 5.25,
            min: 0,
            interval: 2,
            value: 3.1,
            markerColor: Colors.amber,
            points: [
              Point(0, "Normal"),
              Point(2, "High"),
              Point(4, "Very High"),
            ],
            ranges: [
              Range(0, 2, Theme.of(context).primaryColor),
              Range(2, 4, Colors.amber),
              Range(4, 5.8, const Color(0xffD02251)),
            ],
          ),
          const Divider(height: 34),
        ],
      ),
    );
  }
}

class ScoreLabel extends StatelessWidget {
  final String title;
  final String? test;
  final String? date;
  final String result;
  final Color color;
  final String resultMetrix;

  const ScoreLabel({
    Key? key,
    this.test,
    this.date,
    required this.title,
    required this.result,
    required this.resultMetrix,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff4d1a53),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(6.0),
                RichText(
                  text: TextSpan(
                    text: "${test ?? "FH03586"} ",
                    style: GoogleFonts.comfortaa().copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: "| ${date ?? "9th September 2021"}",
                        style: GoogleFonts.comfortaa()
                            .copyWith(color: Colors.grey[800], fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                result,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 14.0,
                ),
              ),
              const Gap(4.0),
              Text(
                resultMetrix,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  final List<Point> points;
  final List<Range> ranges;
  final Color markerColor;
  final double interval;
  final double max;
  final double min;
  final double value;

  const Graph({
    super.key,
    required this.max,
    required this.min,
    required this.value,
    required this.ranges,
    required this.points,
    required this.interval,
    required this.markerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SfLinearGauge(
        minimum: min,
        maximum: max,
        interval: interval,
        animateAxis: true,
        animateRange: true,
        showLabels: true,
        showTicks: false,
        minorTicksPerInterval: 0,
        labelFormatterCallback: (value) {
          return value;
        },
        labelOffset: 5,
        axisTrackStyle: const LinearAxisTrackStyle(
          thickness: 15,
          color: Colors.white,
        ),
        markerPointers: <LinearMarkerPointer>[
          LinearShapePointer(
            value: value,
            onChanged: (dynamic value) {},
            height: 20,
            width: 20,
            color: markerColor,
            position: LinearElementPosition.cross,
            shapeType: LinearShapePointerType.triangle,
          ),
          ...points.map(
            (e) => LinearWidgetPointer(
              value: e.value,
              enableAnimation: false,
              position: LinearElementPosition.outside,
              offset: 4,
              child: Text(
                e.text,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
        ranges: <LinearGaugeRange>[
          ...ranges.map(
            (e) => LinearGaugeRange(
              startValue: e.startValue,
              endValue: e.endValue,
              startWidth: 8,
              midWidth: 8,
              endWidth: 8,
              position: LinearElementPosition.cross,
              edgeStyle: LinearEdgeStyle.bothCurve,
              color: e.color,
            ),
          ),
        ],
      ),
    );
  }
}

class Point {
  final double value;
  final String text;

  Point(this.value, this.text);
}

class Range {
  final double startValue;
  final double endValue;
  final Color color;

  Range(this.startValue, this.endValue, this.color);
}
