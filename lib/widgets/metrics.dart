import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/styles.dart';

const _graphAssetName = 'assets/graph.svg';

class Metrics extends StatelessWidget {
  final String _labelText;
  final String _weightText;
  final String _unitText;

  const Metrics(this._labelText, this._weightText,
      {Key? key, String unitText = 'lbs'})
      : _unitText = unitText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContainerContents(),
      // Clip is required to keep svg inside of Container
      clipBehavior: Clip.antiAlias,
      decoration: bubbleBoxDecoration,
      width: bubbleDiameter.toDouble(),
      height: bubbleDiameter.toDouble(),
    );
  }

  Widget _buildContainerContents() {
    final svg = SvgPicture.asset(
      _graphAssetName,
      width: bubbleDiameter.toDouble(),
    );

    final label = Text(_labelText, style: labelTextStyle);
    final weight = Text(_weightText, style: weightTextStyle);
    final unit = Text(_unitText, style: unitTextStyle);

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(child: label, top: bubbleDiameter * 0.16),
        weight,
        Positioned(child: unit, bottom: bubbleDiameter * 0.12),
        Positioned(child: svg, bottom: bubbleDiameter * -0.09),
      ],
    );
  }
}
