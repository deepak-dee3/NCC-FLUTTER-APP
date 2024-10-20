import 'package:flutter/material.dart';

class Home2 extends StatefulWidget{
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
     var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body:Container(
        
        width: double.infinity,
        decoration: BoxDecoration(
          color:Colors.white,
          
          
        //   gradient: LinearGradient(//begin: Alignment.topCenter,
        //     colors: [
            

        //    Colors.red[200]!,
        // const Color.fromARGB(255, 44, 5, 135)!,
        //    Colors.blue[300]!,
        //   ])
          
        ),
        
        child:Column(
           children: [
            SizedBox(height: screenHeight*0.25,),

            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                

              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.1,),
                  Padding(padding: EdgeInsets.all(16),
                    child:Container(
                      padding: EdgeInsets.all(10),
                    
                    height: screenHeight*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[ BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 0.8

                      ),],
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child:TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your mail here'
                        ,hintStyle: TextStyle(color: Colors.grey)
                      ),
                    )
                  )),

                   Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                 // color: Colors.blue.withOpacity(0.2),
                 color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                           fontWeight: FontWeight.bold,color: Colors.black,
                          fontSize: 13,
                          //color: Color(0xff67727d)
                          ),
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                    // controller: login_passcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user password";
                    }
                   
                      else {
                        "Correct your password";
                      }
                    return null;
                  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          prefixIconColor: Colors.black,
                          hintText: "Password",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )
              ),
              
                ],
              ),
              

            ))
           ],
       
         
        )
      )
    );
  }
}