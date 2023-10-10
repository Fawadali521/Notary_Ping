import 'package:flutter/material.dart';
import 'package:notary_ping/Infos.dart';
import 'package:notary_ping/styles.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({super.key});

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  String? dropdownValue = '+241';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - 40) / 2 - 20,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderStyles.textFieldBorderRadius,
        color: Colors.white.withOpacity(0.15),
      ),
      child: Center(
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Palette.textFieldFill),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.white.withOpacity(0.15),
              value: dropdownValue,
              underline: Container(),
              icon: const SizedBox.shrink(),
              style: TextStyles.textField,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: Infos()
                  .dropdownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, right: 3),
                    child: Text(
                      value,
                      style: TextStyles.textField,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
