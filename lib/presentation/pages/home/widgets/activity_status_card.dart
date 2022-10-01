import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:steps_tracker_flutter/application/models/exercise.model.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final activityStatusCardProvider = Provider<ExerciseModel>((ref) {
  throw UnimplementedError();
});

class ActivityStatusCard extends ConsumerWidget {
  const ActivityStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;

    final state = ref.watch(activityStatusCardProvider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
      ),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenPaddingX),
      color: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStepsPercentIndicator(context, state, tr),
            _buildTotalDurationPercentIndicator(context, state, tr),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsPercentIndicator(
      BuildContext context, ExerciseModel data, AppLocalizations tr) {
    return CircularPercentIndicator(
      radius: SizeConfig.screenWidth * 0.18,
      lineWidth: 15,
      animation: true,
      animationDuration: 1200,
      percent: data.steps <= 10000 ? data.steps / 10000 : 1,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.2),
      center: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.screenMarginY),
        child: Column(
          children: [
            const Icon(Icons.do_not_step_sharp),
            Text(
              '${data.steps}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: SizeConfig.screenWidth * 0.05, color: Colors.white),
            ),
            Text(
              tr.steps,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalDurationPercentIndicator(
      BuildContext context, ExerciseModel data, AppLocalizations tr) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.4,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            axisLineStyle: AxisLineStyle(
              color: Colors.white.withOpacity(0.2),
              dashArray: const <double>[8, 2],
            ),
            axisLabelStyle: const GaugeTextStyle(
              color: Colors.white,
            ),
            majorTickStyle: const MajorTickStyle(color: Colors.white),
            minorTickStyle: const MinorTickStyle(color: Colors.white),
            pointers: <GaugePointer>[
              RangePointer(
                value: data.consumedTime.toDouble(),
                color: Colors.white,
                enableDragging: false,
              )
            ],
            annotations: [
              GaugeAnnotation(
                axisValue: 40,
                widget: Text(
                  textAlign: TextAlign.center,
                  '${data.consumedTime}\n${tr.min}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
