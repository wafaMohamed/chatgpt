import 'package:chatgpt/constants/themes/app_theme.dart';
import 'package:chatgpt/view/widget/custom_text.dart';
import 'package:chatgpt/view_model/provider/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/models_model.dart';

class DropDownModel extends StatefulWidget {
  const DropDownModel({Key? key}) : super(key: key);

  @override
  State<DropDownModel> createState() => _DropDownModelState();
}

class _DropDownModelState extends State<DropDownModel> {
  String? currentModels;
  @override
  Widget build(BuildContext context) {
    final modelsProvider= Provider.of<ModelsProvider>(context,listen: false);
     currentModels= modelsProvider.getcurrentModel;
    return FutureBuilder<List<ModelsModel>>(
      future: modelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: TextWidget(label: snapshot.error.toString()),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
              child: DropdownButton(
                  dropdownColor: AppTheme.scaffoldBackgroundColor,
                  iconEnabledColor: AppTheme.white,
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                          value: snapshot.data![index].id,
                          child: TextWidget(
                            label: snapshot.data![index].id,
                            fontSize: 15,
                          ))),
                  value: currentModels,
                  onChanged: (value) {
                    setState(() {
                      currentModels = value.toString();
                    });
                     modelsProvider.setCurrentModel(value.toString());
                  },
                ),
            );
      },
    );
  }
}
