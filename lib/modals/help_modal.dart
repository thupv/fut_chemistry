import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpModal extends StatefulWidget {
  const HelpModal({Key? key}) : super(key: key);

  @override
  State<HelpModal> createState() => _HelpModalState();
}

class _HelpModalState extends State<HelpModal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          color: Colors.black87,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("HELP", style: TextStyle(color: Colors.white, fontSize: 18)),
                Column(
                  children: [
                    const Text("Select 11 players and press optimize, our algorithm will help you find the best formation for this squad", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 20),
                    Image.asset("assets/img/guide.png"),
                  ],
                ),
                const Text("from FutChemistry.com with ❤️", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ),
      ),
    );
  }
}
