import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orayemem/interfaces/login/loin.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
         const Text(
            "Logout",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
         const SizedBox(
            height: 15,
          ),
         const Text(
            "Are you sure you want to Logout?",
            style: TextStyle(color: Color(0xff000000), fontSize: 17),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 43,
                width: 166,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xffFA5B01)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 40,
                      alignment: Alignment.center,
                      child: const Text(
                        "Cancel",
                        style:  TextStyle(
                          color: Color(0xffFA5B01),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
             const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: 43,
                width: 166,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const LoginScreen();
                    }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffFE8C00),
                        Color(0xffF83600),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 40,
                      alignment: Alignment.center,
                      child: const Text(
                        "Yes, Logout",
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
