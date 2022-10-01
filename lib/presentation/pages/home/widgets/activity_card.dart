import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:steps_tracker_flutter/core/common_imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
      ),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.27,
        width: SizeConfig.screenWidth * 0.43,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.screenPaddingY * 0.2,
              horizontal: SizeConfig.screenPaddingX),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(title,
                    maxLines: 2, style: Theme.of(context).textTheme.subtitle2),
              ),
              const Icon(Icons.star_border_outlined),
              // local_fire_department_sharp
            ],
          ),
          subtitle: Center(
            child: _buildTotalDurationPercentIndicator(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalDurationPercentIndicator(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CircularPercentIndicator(
      radius: SizeConfig.screenWidth * 0.10,
      lineWidth: 10,
      animation: true,
      animationDuration: 1200,
      percent: 0.4,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).colorScheme.onPrimary,
      center: Icon(icon),
      footer: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.screenPaddingX),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('20',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: SizeConfig.screenWidth * 0.05)),
            Text(tr.min, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
