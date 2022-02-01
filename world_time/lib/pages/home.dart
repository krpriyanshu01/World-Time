import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override

  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color txtColor = data['isDayTime'] ? Colors.black : Colors.white70;
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[500] as Color;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        // data = {
                        //   'time': result['time'],
                        //   'location': result['location'],
                        //   'flag': result['flag'],
                        //   'isDayTime': result['isDayTime'],
                        // };
                        data = result;
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.lightGreenAccent[400], size: 65.0,),
                    label: Text(''),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: txtColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: txtColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}