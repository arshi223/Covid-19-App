import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/Model/world_states.dart';
import 'package:myapp/Services/Utilities/app_url.dart';

class StatesServies {
  Future<WorldStatesModel> worldstateRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      return throw Exception('Error');
    }
  }

  Future<List<dynamic>> countrieslistModel() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
