import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  
  String message;
  List<String> gameState;

  //TODO: link up images

  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  //initial state method

  @override
  void initState() { 
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  //play game method
   bool isCross = true;

  playGame(int index){
   
    if(this.gameState[index] == "empty"){
      setState(() {
        if(this.isCross)
        {
          this.gameState[index] = "cross";
    
        }
        else
        {
          this.gameState[index] = "circle";
        }
        
        this.isCross = !this.isCross;
        this.checkWin();
        
      });
    }

  }
  //get image method

  AssetImage getImage(String value){

    switch (value) {
      case ('empty'):
      return edit;
      break;
      case ('cross'):
      return cross;
      break;
       case ('circle'):
      return circle;
      break;
    }
    
  }
  //win game method

  checkWin(){

    if ((gameState[0] != 'empty')&& 
    (gameState[0] == gameState[1])
    &&(gameState[1] == gameState[2])) {

      setState(() {
        this.message = '${this.gameState[0]} wins';
  

        
      });
      
    }else if ((gameState[3] != "empty")&& 
    (gameState[3] == gameState[4])
    &&(gameState[4] == gameState[5])) {
       setState(() {
        this.message = '${this.gameState[3]} wins';
      });
      
    }else if ((gameState[6] != "empty")&& 
    (gameState[6] == gameState[7])
    &&(gameState[7] == gameState[8])) {
       setState(() {
        this.message = '${this.gameState[6]} wins';
      });
      
    }else if ((gameState[0] != "empty")&& 
    (gameState[0] == gameState[3])
    &&(gameState[3] == gameState[6])) {
       setState(() {
        this.message = '${this.gameState[0]} wins';
      });
      
    }else if ((gameState[1] != "empty")&& 
    (gameState[1] == gameState[4])
    &&(gameState[4] == gameState[7])) {
       setState(() {
        this.message = '${this.gameState[1]} wins';
      });
      
    }else if ((gameState[2] != "empty")&& 
    (gameState[2] == gameState[5])
    &&(gameState[5] == gameState[8])) {
       setState(() {
        this.message = '${this.gameState[2]} wins';
      });
      
    }else if ((gameState[0] != "empty")&& 
    (gameState[0] == gameState[4])
    &&(gameState[4] == gameState[8])) {
       setState(() {
        this.message = '${this.gameState[0]} wins';
      });
      
    }else if ((gameState[2] != "empty")&& 
    (gameState[2] == gameState[4])
    &&(gameState[4] == gameState[6])) {
       setState(() {
        this.message = '${this.gameState[2]} wins';
      });
      
    }else if (!gameState.contains('empty')) {
       setState(() {
        this.message = 'Oops Match Draw!';
      });
      
    }
  }
  //reset game method

  resetGame(){
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: GridView.builder(
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0 ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                height: 100.0,
                width: 100.0,
                child: MaterialButton(onPressed:(){
                  this.playGame(i);
              
                },
                child: Image(image: this.getImage(this.gameState[i])
                ),
                ),
              ) ,
          )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              '🎉${this.message}🎉',
              style: TextStyle(
                color: Colors.red[500],
                
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),

          ),
          RaisedButton(onPressed: 
          (){
            this.resetGame();
          },
          padding: EdgeInsets.all(15.0),
          color: Colors.pink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          
          child: Text("Reset Game",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),) ,),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "❤ Developed by Deepak Puri ❤",
              style: TextStyle(
                fontSize: 20,
              ),
            ) ,
          )
         
         
        ],
      ),
    );
  }
}