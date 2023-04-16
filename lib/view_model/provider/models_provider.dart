import 'package:flutter/cupertino.dart';

import '../../models/models_model.dart';
import '../../services/api_services.dart';

class ModelsProvider with ChangeNotifier{
  String currentModel="text-davinci-edit-001";
  String get getcurrentModel{
    return currentModel;
  }
void setCurrentModel(String newModel){
     currentModel=newModel;
     notifyListeners(

     );
}
  List<ModelsModel> modelsList=[];
  List<ModelsModel> get getModelsList{
    return modelsList;
  }
  Future<List<ModelsModel>> getAllModels ()async{
    modelsList = await ApiServices.getModels();
    return modelsList;
  }
}
