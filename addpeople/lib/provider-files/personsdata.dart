import 'package:flutter/material.dart';

class PersonsData extends ChangeNotifier{
  final List<List> allPersons=[];

  void addPerson(List person)
  {
    allPersons.add(person);
    notifyListeners();
  }
  void remove(int location)
  {
    allPersons.removeAt(location);
    notifyListeners();
  }
  void update(List person,int location)
  {
    allPersons.removeAt(location);
    allPersons.insert(location, person);
    notifyListeners();
  }

}