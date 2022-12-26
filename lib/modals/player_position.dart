import 'package:flutter/material.dart';
import '../analytics/event.dart';

import 'package:fut_chemistry/constants/assets_images.dart';

class PlayerPositionModal extends StatefulWidget {
  const PlayerPositionModal({Key? key}) : super(key: key);

  @override
  State<PlayerPositionModal> createState() => _PlayerPositionModalState();
}

class _PlayerPositionModalState extends State<PlayerPositionModal> {
  double _height = 0.0;
  double _width = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackdropImage(),
            Positioned(
              top: 40,
              left: 20,
              child: _buildPositionCircle(position: 'LW'),
            ),
            Positioned(
              top: 40,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'ST'),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: _buildPositionCircle(position: 'RW'),
            ),
            Positioned(
              top: 120,
              left: 50,
              child: _buildPositionCircle(position: 'LF'),
            ),
            Positioned(
              top: 120,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'CF'),
            ),
            Positioned(
              top: 120,
              right: 50,
              child: _buildPositionCircle(position: 'RF'),
            ),
            Positioned(
              top: _height * 0.275,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'CAM'),
            ),
            //345345
            Positioned(
              top: _height * 0.35,
              left: 20,
              child: _buildPositionCircle(position: 'LM'),
            ),
            Positioned(
              top: _height * 0.4,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'CM'),
            ),
            Positioned(
              top: _height * 0.35,
              right: 20,
              child: _buildPositionCircle(position: 'RM'),
            ),
            //345345

            //321321
            Positioned(
              top: _height * 0.55,
              left: 20,
              child: _buildPositionCircle(position: 'LWB'),
            ),
            Positioned(
              top: _height * 0.55,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'CDM'),
            ),
            Positioned(
              top: _height * 0.55,
              right: 20,
              child: _buildPositionCircle(position: 'RWB'),
            ),
            //123123
            Positioned(
              top: _height * 0.7,
              left: 20,
              child: _buildPositionCircle(position: 'LB'),
            ),
            Positioned(
              top: _height * 0.7,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'CB'),
            ),
            Positioned(
              top: _height * 0.7,
              right: 20,
              child: _buildPositionCircle(position: 'RB'),
            ),
            Positioned(
              top: _height * 0.8,
              left: (_width / 2) - 30,
              child: _buildPositionCircle(position: 'GK'),
            ),
          ],
        ),
      ),
    );
  }

  ColorFiltered _buildBackdropImage() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black45,
        BlendMode.darken,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(
          AssetsImages.fieldPositionUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildPositionCircle({required String position}) {
    return GestureDetector(
      onTap: () {
        logFilter('position', position);
        Navigator.pop(context, position);
      },
      child: PhysicalModel(
        elevation: 15.0,
        color: Colors.black26,
        shadowColor: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30.0),
        shape: BoxShape.circle,
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.black54,
          ),
          child: Text(
            position,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
