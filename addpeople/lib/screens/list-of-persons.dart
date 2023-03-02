import 'package:flutter/material.dart';
import 'package:addpeople/screens/addperson.dart';
import 'package:addpeople/provider-files/personsdata.dart';
import 'package:provider/provider.dart';

class ListOfPersons extends StatefulWidget {
  const ListOfPersons({
    super.key,
  });

  @override
  State<ListOfPersons> createState() => _ListOfPersonsState();
}

class _ListOfPersonsState extends State<ListOfPersons> {
  @override
  Widget build(BuildContext context) {
    var per = context.watch<PersonsData>();
    String updatedName = '';
    int updatedAge = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
        leading: const Icon(Icons.people_alt_rounded),
        backgroundColor: const Color.fromRGBO(197, 230, 240, 1),
      ),
      body: ListView.builder(
        itemCount: per.allPersons.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return ListTile(
            title: Column(
              children: [
                Text(
                  'Name:- ${per.allPersons[index][0]}',
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Age:- ${per.allPersons[index][1]}',
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            subtitle: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        per.remove(index);
                      },
                      child: const Icon(Icons.delete)
                      
                      ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              contentPadding: const EdgeInsets.all(20),
                              title: const Text("Update Person Data"),
                              
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1,
                                    )),
                                    hintText: "required",
                                  ),
                                  controller: TextEditingController()
                                    ..text = per.allPersons[index][0],
                                  onChanged: (value) {
                                    updatedName = value;
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                      ),
                                      gapPadding: 10,
                                    ),
                                    hintText: "required",
                                  ),
                                  controller: TextEditingController()
                                    ..text =
                                        per.allPersons[index][1].toString(),
                                  onChanged: (value) {
                                    updatedAge = int.parse(value);
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (updatedAge == 0) {
                                      updatedAge = per.allPersons[index][1];
                                    }
                                    if (updatedName == '') {
                                      updatedName = per.allPersons[index][0];
                                    }

                                    per.update(
                                        [updatedName, updatedAge], index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListOfPersons()));
                                  },
                                  child: const Text(
                                    "Update",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                        
                      },
                      child: const Icon(Icons.edit)
                      ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text(
            "Add person",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPeople()))),
    );
  }
}
