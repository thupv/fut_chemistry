import 'package:flutter/material.dart';

import 'package:fut_chemistry/constants/assets_images.dart';

class CardRarityModal extends StatelessWidget {
  const CardRarityModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Material(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'SELECT RARITY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    String _nationUrl = AssetsImages.rarityFolderPath + AssetsImages.cardRarityList[index] + ".png";
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(AssetsImages.cardRarityList[index]);
                      },
                      child: Image.asset(
                        _nationUrl,
                        height: 50,
                        width: 50,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
