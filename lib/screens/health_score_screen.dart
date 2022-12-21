import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:profertility/screens/widgets/my_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HealthScoreScreen extends StatelessWidget {
  final int score;
  const HealthScoreScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        title: "Healthscore Details",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: SfCircularChart(
                  annotations: [
                    CircularChartAnnotation(
                      angle: 0,
                      radius: '0%',
                      height: '120%',
                      width: '120%',
                      widget: Center(
                        child: Text(
                          "$score%",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                      ),
                    ),
                  ],
                  series: getRadialBarCustomizedSeries(),
                ),
              ),
            ),
            const Gap(16.0),
            Wrap(
              runSpacing: 16,
              children: const [
                HealthScoreWidget(
                  color: Color(0xffe6a01c),
                  score: "600",
                  text: "Take notice",
                  range: "401-700",
                ),
                HealthScoreWidget(
                  color: Color(0xff07a89d),
                  score: "870",
                  text: "Good",
                  range: "700+",
                ),
                HealthScoreWidget(
                  color: Color(0xfffd7600),
                  score: "379",
                  text: "Needs attention",
                  range: "0-400",
                ),
              ],
            ),
            const Gap(26),
            const Text(
              "Areas making up Score:",
              style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(16.0),
            Wrap(
              runSpacing: 16.0,
              children: const [
                CardWidget(
                  title: "Biological",
                  percent: "11%",
                  description:
                      "The individual BHS is derived by summing biomarker-specific"
                      "scores across all biomarkers.",
                  colors: [
                    Color.fromARGB(255, 0, 218, 204),
                    Color(0xff1f8d85),
                  ],
                ),
                CardWidget(
                  title: "Lifestyle & Habits",
                  percent: "67%",
                  description:
                      "The lifestyle score consists of five lifestyle factors:"
                      "diet, BMI, smoking status, physical activity.",
                  colors: [
                    Color.fromARGB(255, 255, 187, 169),
                    Color(0xfffd3a84),
                  ],
                ),
                CardWidget(
                  title: "Biological",
                  percent: "52%",
                  description:
                      "The environmental score customizes the severity of"
                      "a vulnerability to an asset specific to the program's organization.",
                  colors: [
                    Color.fromRGBO(30, 210, 227, 1),
                    Color.fromRGBO(143, 77, 234, 1),
                  ],
                ),
                CardWidget(
                  title: "Mental Wellbeing",
                  percent: "69%",
                  description:
                      "The WEMWBS is scored by summing the responses to each "
                      "of the 14 test items on a 1 to 5 Likert scale (1 = None of the time to 5 + All of the time).",
                  colors: [
                    Color.fromRGBO(185, 141, 255, 1),
                    Color.fromRGBO(58, 80, 253, 1),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<RadialBarSeries<ChartSampleData, String>>
      getRadialBarCustomizedSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        maximumValue: 1000,
        gap: '20%',
        radius: '100%',
        dataSource: <ChartSampleData>[
          ChartSampleData(
              x: 'Vehicle',
              y: 600.0,
              text: '100%',
              pointColor: const Color(0xffe6a01c)),
          ChartSampleData(
              x: 'Education',
              y: 870.0,
              text: '100%',
              pointColor: const Color(0xff07a89d)),
          ChartSampleData(
              x: 'Home',
              y: 379.0,
              text: '100%',
              pointColor: const Color(0xfffd7600)),
        ],
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '60%',
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        legendIconType: LegendIconType.circle,
      ),
    ];
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String percent;
  final List<Color> colors;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.percent,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints.tightFor(height: 140),
      decoration: BoxDecoration(
        color: const Color.fromARGB(247, 234, 238, 255),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff4d1a53),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 14.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors,
                  ),
                ),
                child: Text(
                  percent,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Text(
            description,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}

class ChartSampleData {
  final String x;
  final double y;
  final String text;
  final Color pointColor;

  ChartSampleData({
    required this.x,
    required this.y,
    required this.text,
    required this.pointColor,
  });
}

class HealthScoreWidget extends StatelessWidget {
  final Color color;
  final String score;
  final String text;
  final String range;
  const HealthScoreWidget({
    Key? key,
    required this.color,
    required this.score,
    required this.text,
    required this.range,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
            const Gap(6),
            Text(
              score,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const Gap(6),
            Text(
              "($text)",
              style: const TextStyle(color: Color(0xff1d1d1d)),
            ),
          ],
        ),
        Text(
          range,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        )
      ],
    );
  }
}
