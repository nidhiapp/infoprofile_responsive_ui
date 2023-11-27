import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/onboarding_provider.dart';
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(1)
                  ),
                  child: FutureBuilder(
                    future: authProvider.getEmail(),
                    builder: (context, snap) {
                      if(snap.hasData){
                        return Text("Success Login with ${snap.data.toString() ?? ""}");
                      }
                      else {
                        return Container();
                      }
                    }
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  authProvider.logout(context);
                }, child: const Text("Log Out"))
              ],
            );
          }
        ),
      ),
    );
  }
}
