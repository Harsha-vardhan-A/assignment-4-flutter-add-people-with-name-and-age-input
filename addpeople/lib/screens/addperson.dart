// import 'dart:ffi';

import 'package:addpeople/screens/list-of-persons.dart';
import 'package:flutter/material.dart';
import 'package:addpeople/provider-files/personsdata.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/material.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({super.key});

  @override
  State<AddPeople> createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  
  @override
  Widget build(BuildContext context) {
    String? enteredName='';
    int? enteredAge=0;
    var per= context.watch<PersonsData>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 90, 90, 0.7),
        title: Text("Add person"),
        leading: Icon(Icons.person),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            const Text("Person Name:-" ,style: TextStyle(fontSize: 25,),),
             Padding(padding: EdgeInsets.all(30),
              child: TextField(
                keyboardType: TextInputType.text,
                
                mouseCursor: MaterialStateMouseCursor.clickable,
                cursorHeight: 30,
                maxLength: 100,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: "enter name",
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xDFC2DE),
                      
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    
                  ),
                
                ),
                // controller: enteredName,
                onChanged: (value) => enteredName=value,
              ),
            ),
            const Text("Person Age:-",style: TextStyle(fontSize: 25,),),
             Padding(padding: const EdgeInsets.all(30),
              child: TextField(
                
                keyboardType: const TextInputType.numberWithOptions(),
                mouseCursor: MaterialStateMouseCursor.clickable,
                cursorHeight: 30,
                maxLength: 3,
                style: TextStyle(fontSize: 20,),
                decoration: const InputDecoration(
                  hintText: "enter age",
                  counterText: "",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xDFC2DE),
                      
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    
                  ),
                  
                ),
                onChanged: (value){
                  try{
                  enteredAge= int.parse(value);
                  value='';
                  }
                  catch(exception){
                    print(exception);
                  }
                }
              ),
            ),
            Padding(padding: EdgeInsets.all(30),
            child:ElevatedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 128, 90, 152))),
              onPressed: (){
                if(enteredName=='' || enteredAge! <= 0)
                {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Invalid Input "),
                      );
                    },
                  );
                }
                else{
                  per.allPersons.add([enteredName,enteredAge]);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfPersons()));
                  // enteredAge=0;
                  // enteredName='';

                }
              }, 
              child: const Text('ADD PERSON',style: TextStyle(fontSize: 20,),)
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListOfPersons()));
        },
        child: const Text("skip"),
        backgroundColor: Colors.black,
        ),
    );
  }
}