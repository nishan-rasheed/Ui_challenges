import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

List pImages = [
  'assets/images/pizza.png',
  'assets/pizzas/pizza1.png',
  'assets/pizzas/pizza2.png',
  'assets/pizzas/pizza3.png'
];

class _PizzaScreenState extends State<PizzaScreen> {
  var _turns = 1.0;
  var height = 180.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pizza'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.shopping_cart))],
      ),

      body: Column(
        children: [
          
          Expanded(
            child: 
            CarouselSlider.builder(
              itemCount: pImages.length, 
              itemBuilder:  (context, index, realIndex) => 
              AnimatedRotation(
                curve: Curves.linearToEaseOut,
              turns:_turns,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(duration: 
              Duration(milliseconds: 500,),
              width: height,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(pImages[index],
                ))
              ),
              )
            ),
              options: CarouselOptions(

              ))
            // AnimatedRotation(
            //   turns:_turns,
            //   duration: Duration(milliseconds: 700),
            //   child: Image.asset('assets/images/pizza.png',
            //   height: height,width: height,
            //   ),
            // ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child:  Text('\u{20B9}180',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),
            ),
          ),

        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    SizeWidget(onTap: (){
                      setState(() {
                        _turns+=1;
                        height = 150;
                      });
                    },text: 'S',),
                    SizeWidget(onTap: (){
                      setState(() {
                        _turns+=1;
                        height= 180;
                      });
                    },text: 'M',),
                    SizeWidget(onTap: (){
                      setState(() {
                        _turns+=1;
                        height = 210;
                      });
                    },text: 'L',),
            ],
          ),

        const SizedBox(height: 50,),

        const Align(
          alignment: Alignment.centerLeft,
          child:  Text('CUSTOMIZE YOUR PIZZA',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey
            ),
            ),
        ), 


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    IncredientWidget(onTap: (){}),
                    IncredientWidget(onTap: (){}),
                    IncredientWidget(onTap: (){}),
            ],
          ),
        ),

        const SizedBox(height: 20,),


        ElevatedButton(
          onPressed: (){}, 
          child: Text('Add to cart')) 
          
        ],
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  const SizeWidget({
    super.key, required this.text, required this.onTap,
  });

  final String text;
  final Function() onTap;

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          shape: const CircleBorder(side: BorderSide.none),
          elevation: 10,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}


class IncredientWidget extends StatelessWidget {
  const IncredientWidget({
    super.key, required this.onTap,
  });

  final Function() onTap;

  

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(255, 206, 233, 223),
        backgroundImage: AssetImage('assets/images/pizza.png'),
      ),
    );
  }
}