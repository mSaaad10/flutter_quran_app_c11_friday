import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter=0;
  double turns=0.0;
  int tasbehCount=0;
  List<String> tasabehList = [];
  @override
  Widget build(BuildContext context) {
    if (tasabehList.isEmpty) loadTasabehFile();
    return tasabehList.isEmpty
        ? Center(
      child: CircularProgressIndicator(),
    )
        :Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedRotation(
          turns: turns,
          duration: Duration(seconds: 1),
          child:

          Image.asset('assets/images/tasbeh.png',width: 237,height: 339,),
        ),
        SizedBox(
            width: double.infinity,
            child: Text('عدد التسبيحات',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),textAlign: TextAlign.center)),
        Container(
          width: 69,
          height: 81,
          margin: EdgeInsets.only(top: 65),
          child: FloatingActionButton(onPressed: () {
            setState(() {
              turns += 1 / 30 ;
              if(counter<30){

                counter++;
              }
              else
              {
                counter=0;
                if(tasbehCount<13)
                {
                  tasbehCount++;
                }else{tasbehCount=0;}
              }
            });
          },
            child: Text('$counter'),
            backgroundColor: Color(0xffB7935F).withOpacity(0.57),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xffB7935F)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${tasabehList[tasbehCount]}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25,color: Colors.white),textAlign: TextAlign.center,),
          ),
        )

      ],
    );
  }
  void loadTasabehFile() async {
    String fileContent =
    await rootBundle.loadString('assets/files/tasabe7.txt');
    List<String> tasabeh = fileContent.split('\n');

    tasabehList = tasabeh;

    tasabeh.forEach(
          (element) {
        print(element);
      },
    );
    setState(() {});
  }
}
