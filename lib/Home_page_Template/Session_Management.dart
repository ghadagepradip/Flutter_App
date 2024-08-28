
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManagementPractice extends StatefulWidget {
  const SessionManagementPractice({super.key});

  @override
  State<SessionManagementPractice> createState() => _SessionManagementPracticeState();
}

class SharedPref {

  SharedPreferencesAsync pref = SharedPreferencesAsync();

  Future<SharedPreferences> getReferance() async
  {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1;
  }

  Future<SharedPreferencesWithCache> getCacheRef() async
  {
    SharedPreferencesWithCache refc = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'repeat','userdatacache'},
    )); 
    return refc;
  }


}

class _SessionManagementPracticeState extends State<SessionManagementPractice> {
  TextEditingController input = TextEditingController();
  String inputText='Your Data will be represented here using sharedPreferanceAsync';
  String inputText1='Your Data will be represented here using sharedPreferance';
  String inputText2='Your Data will be represented here using sharedPreferanceWithCache';
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenWidth*0.8,
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextField(
                  controller: input,
                 decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                   label: Text('Enter some data'),
                 ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () async{

                      SharedPref prefs = SharedPref();
                      prefs.pref.setString('Userdata', input.text);
                      inputText = (await prefs.pref.getString('Userdata'))!;
                      
                      SharedPreferences pref1 = await prefs.getReferance();
                      pref1.setString('userdatausingsp', input.text);
                      inputText1 = pref1.getString('userdatausingsp')!;

                      SharedPreferencesWithCache pref2 = await prefs.getCacheRef();
                       pref2.setString('userdatacache', inputText);
                      inputText2 = pref2.getString('userdatacache')!;

                      setState(() {

                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:Colors.blue,
                    ),
                    child: const Text('Click me', style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 10,),
              Text(inputText),
              const SizedBox(height: 10,),
              Text(inputText1),
              const SizedBox(height: 10,),
              Text(inputText2),
            ],
          ),
        ),
      ),
    );
  }
}
