import 'package:flutter/material.dart';
import 'package:yuma_test/utils.dart';

import 'Database/db-handlar.dart';
import 'Database/model_class.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DBHelper? dbHelper;
  late Future<List<UserModel>> userlist;
  int modification=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DBHelper();
    loadData();
  }
  loadData()async{
    userlist= dbHelper!.getUserList();
    print('user list $userlist');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'),centerTitle: true,),
      floatingActionButton: Theme(
          data:Theme.of(context).copyWith(
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  extendedSizeConstraints: BoxConstraints.tightFor(width:325,height: 60)
              )
          ),
          child:FloatingActionButton.extended(
            onPressed:(){
              Utils().toastMessage('Users info will be appeared in dashboard');
              setState(() {
                modification=1;
              });
             userList();
            },
            icon: const Icon(Icons.shopping_basket),
            label: const Text('Check Users'),
            extendedIconLabelSpacing: 16,
          )
      ),
      body: modification==1?userList():Container()

    );
  }
  Widget userList(){

    return SizedBox(
      height: 500,
      width:double.infinity,
      child: FutureBuilder(
          future: userlist,
          builder: (context,AsyncSnapshot<List<UserModel>> snapshot){

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:(context,index){
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListTile(
                      title: Text(snapshot.data![index].username.toString()),
                      subtitle:Text(snapshot.data![index].consumerUuid.toString()) ,
                      leading:Text(snapshot.data![index].sessionId.toString()) ,
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
