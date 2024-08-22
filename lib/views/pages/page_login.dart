import 'package:get/get.dart';
import 'package:htx_mh/resources/app_assets.dart';

import '../pages/page_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/page_signup.dart';
// import '../ultils/colors.dart';
import 'package:htx_mh/utills/text/big_text.dart';
import 'package:htx_mh/utills/text/middle_text.dart';
import 'package:htx_mh/utills/text/small_text.dart';
import 'package:htx_mh/resources/colors.dart';
import 'package:htx_mh/utills/responsives/dimentions.dart';
// import '../utills/text/middle_text.dart';
// import '../utills/text/small_text.dart';
// import '../utills/responsives/dimentions.dart';
import 'package:flutter/material.dart';

import '../widgets/navigations_menu.dart';

class PageLogin extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  PageLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
               image: DecorationImage(
        image: AssetImage('assets/images/hinh-nen-phong-thuy-menh-moc-dep-5-inkythuatso-24-10-20-01.jpg'),
        fit: BoxFit.cover,
               ),
             ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimentions.width10*2, right: Dimentions.width10*2,
                    top: 100, bottom: Dimentions.height10,
                                         ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: Dimentions.height10*2),
                          height: 90,
                          width: Dimentions.width10*10,
                          decoration: const BoxDecoration(
                            image:  DecorationImage(
                              image: AssetImage('assets/images/htx.png'),
                              fit: BoxFit.cover)
                          ),
                        ),
                        const Text("Welcome to Muong Thanh",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white
                        ),),
                        SizedBox(height: Dimentions.height10,),
                        SmallText(text: "Đăng nhập ", color: Colors.white, size: Dimentions.font16,),
                      ],
                    ),
                    SizedBox(height: Dimentions.height20,),
                    Column(
                      children: [
                        TextField(
                          controller: _textController,
                          maxLines: 1,
                          style: TextStyle(fontSize: Dimentions.font16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                            ),
                            filled: true,
                            fillColor: wColor,
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: Dimentions.font15, color: bColor.withOpacity(0.4)),
                            prefixIcon: Icon(Icons.email_outlined,color: bColor.withOpacity(0.5), size: Dimentions.font20,),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: bColor.withOpacity(0.5)),
                              iconSize: Dimentions.font20,
                              onPressed: (){
                                _textController.clear();
                                },
                            ),
                          ),
                        ),
                        SizedBox(height: Dimentions.height10,),
                        TextField(
                          maxLines: 1,
                          style: TextStyle(fontSize: Dimentions.font16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: Dimentions.height10/2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(Dimentions.radius10/2)
                            ),
                            filled: true,
                            fillColor: wColor,
                            hintText: "Mật khẩu",
                            hintStyle: TextStyle(fontSize: Dimentions.font15, color: bColor.withOpacity(0.4)),
                            prefixIcon: Icon(Icons.lock_outline,color: bColor.withOpacity(0.5), size: Dimentions.font20,),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined, color: bColor.withOpacity(0.5),),
                              iconSize: Dimentions.font20,
                              onPressed: (){},
                            ),
                          ),
                        ),
                        SizedBox(height: Dimentions.height40,),
                        Container(
                          margin: EdgeInsets.only(left: 50,right: 50),
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(height: Dimentions.height25*2),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 93, 221, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationMenu()),);
                                  },
                                  child: const Center(child:
                                     Text('Đăng nhập',style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    // decoration: TextDecoration.underline,
                                    fontSize: 20,
                                  ),
                                   )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimentions.height25,),
                       
                        TextButton(onPressed: () {},
                          child: MiddleText(text: "Quên mật khẩu?", size: Dimentions.font16, color: Colors.white,)),
                        SizedBox(height: Dimentions.height10,),
                         Container(
                          // margin: EdgeInsets.only(left: 50,right: 50),
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(height: Dimentions.height25*2),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 248, 250, 248),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                     Container(
                                       margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                                       child: Image.asset(AppAssets.icGoogle),
                                     ),
                                     SizedBox(width: 10,),
                                      const Center(child:
                                         Text('Đăng nhập băng Google',style: TextStyle(
                                        color: Color.fromARGB(255, 0, 6, 14),
                                        fontWeight: FontWeight.bold,
                                        // decoration: TextDecoration.underline,
                                        fontSize: 20,
                                      ),
                                       )
                                                                    ),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimentions.height10,),
                         Container(
                          // margin: EdgeInsets.only(left: 50,right: 50),
                          // padding: EdgeInsets.only(right: 0),
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tightFor(height: Dimentions.height25*2),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 75, 104, 168),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                  onPressed: (){},
                                  child:  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Image.asset('assets/images/fb4.png')),
                                       const Expanded(
                                        flex: 8,
                                         child:  Center(
                                          child:
                                           Text('Đăng nhập bằng Facebook',style: TextStyle(
                                          color: Color.fromARGB(255, 252, 252, 253),
                                          fontWeight: FontWeight.bold,
                                          // decoration: TextDecoration.underline,
                                          overflow: TextOverflow.visible,
                                          fontSize: 20,
                                                                         ),
                                         )
                                                                               ),
                                       ),
                                    ],
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimentions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(text: "Bạn chưa có tài khoản? ", size: Dimentions.font16, color: const Color.fromARGB(255, 253, 252, 252),),
                            TextButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => PageSignUp())),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(right: Dimentions.width10),
                                    ),
                                ),
                                child: const Text('Đăng kí',style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontSize: 16,
                                ),) )
              
                          ],
                         
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}

