import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {

  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter=0;
  double angle=0;
  List<String>tasbehList=[
    "سبحلن الله",
    "الحمد الله",
    "لا اليه الا الله",
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [


                  Image.asset('assets/images/head_sebha_logo.png'),

                Padding
                  (padding: EdgeInsets.only(top: size.height*0.08),
                  //padding: EdgeInsets.symmetric(vertical: 75,horizontal: 75),
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/body_sebha_logo.png'),
                ),
                ),
              ],
            ),
          ),
         SizedBox(height: size.height*0.01,),
            Text('عدد التسبيحات',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
          SizedBox(height: size.height*0.05,),
    Container(
      padding: EdgeInsets.all(19),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
      color: Color(0xFFB7935F)),
      child: Text('$counter',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25),),
    ),
          SizedBox(height: size.height*0.05,),
          InkWell(
            onTap: (){
              Tsbeh();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFB7935F)),
              child: Text(' ${tasbehList[index]}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25,color: Colors.white),),
            ),
          ),

        ],
      ),
    );
  }
  Tsbeh(){

    angle+=0.1;
    if(counter < 33)
      {
      counter++;}
    else
      {counter=0;
      index++;
      if(index==3)
        {index=0;}}
    setState(() {

    });
  }
}
