import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/getx_controller/home_controller.dart';
import 'package:introduction_screen/models/post_model.dart';

class Pge1 extends StatelessWidget {
  const Pge1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller=Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Home Page1'),
        actions: [
          // IconButton(
          //     onPressed: () async {
          //       final pref = await SharedPreferences.getInstance();
          //       pref.setBool('home', false);
          //       Get.offAll(const OnBoardingPage());
          //     },
          //     icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Performing '),
            const SizedBox(height: 20,),
            InkWell(splashColor: Colors.pink,
              onTap: (){
              final postModel=PostModel(
                name: 'Rssel',
                job: 'Mobile '
              );
              controller.createUser(postModel: postModel);


              },
              child: Ink(
                // alignment: Alignment.center,
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius:BorderRadius.circular(12) ,
                ),
                child: Center(child: const Text('Post Dt')),
              ),
            ),
           const SizedBox(height: 20,),
            InkWell(splashColor: Colors.pink,
              onTap: (){
                final postModel=PostModel(

                    name: 'Sofiwe',
                    job: 'Mobile Design ',


                );
                controller.updateUser(postModel: postModel,id: 3);

              },
              child: Ink(
                // alignment: Alignment.center,
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius:BorderRadius.circular(12) ,
                ),
                child: Center(child: const Text('Updte Dt')),
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(splashColor: Colors.pink,
              onTap: (){
              controller.deleteUser(id: 3);
              },
              child: Ink(
                // alignment: Alignment.center,
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius:BorderRadius.circular(12) ,
                ),
                child: Center(child: const Text('Delete')),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
