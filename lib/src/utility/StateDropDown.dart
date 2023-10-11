import 'package:flutter/material.dart';
import 'package:notary_ping/Infos.dart';
import 'package:notary_ping/styles.dart';

class StateDropDown extends StatefulWidget {
  const StateDropDown({Key? key}) : super(key: key);

  @override
  State<StateDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<StateDropDown> {
  String? dropdownValue = 'Select State';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - 40) / 2 - 20,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Customize border radius
        color: Palette.textFieldFill,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.grey,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Palette.primaryColor,
              ), // Add dropdown icon
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: Infos()
                  .stateDropdownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyles().textFieldHint,
                    textAlign: TextAlign.center,
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
