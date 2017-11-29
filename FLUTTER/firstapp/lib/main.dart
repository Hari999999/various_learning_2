/**
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

const String _name = "Your Name";

class FriendlychatApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

   Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )
                    : new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border:
                      new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Friendlychat"),
        elevation:
            Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
         ]
       ),
       decoration: Theme.of(context).platform == TargetPlatform.iOS ? new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null),//new
   );
  }
}
**/



/////////////////////////////////////////////////////////////////////////////////


/**
import 'package:flutter/material.dart';
import 'package:collection/collection.dart' show lowerBound;
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
const String _kAsset0 = 'shrine/vendors/zach.jpg';
const String _kAsset1 = 'shrine/vendors/16c477b.jpg';
const String _kAsset2 = 'shrine/vendors/sandra-adams.jpg';
enum LeaveBehindDemoAction {
  reset,
  horizontalSwipe,
  leftSwipe,
  rightSwipe
}



void main() {
  runApp(new MyApp());
}

class LeaveBehindItem implements Comparable<LeaveBehindItem> {
  LeaveBehindItem({ this.index, this.name, this.subject, this.body });

  LeaveBehindItem.from(LeaveBehindItem item)
      : index = item.index, name = item.name, subject = item.subject, body = item.body;

  final int index;
  final String name;
  final String subject;
  final String body;

  @override
  int compareTo(LeaveBehindItem other) => index.compareTo(other.index);
}







class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red),
      home: new MyHomePage(title: 'Inbox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DismissDirection _dismissDirection = DismissDirection.horizontal;
  List<LeaveBehindItem> leaveBehindItems;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  void initListItems() {
    leaveBehindItems = new List<LeaveBehindItem>.generate(16, (int index) {
      return new LeaveBehindItem(
          index: index,
          name: 'Item $index Sender',
          subject: 'Subject: $index',
          body: "[$index] first line of the message's body..."
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initListItems();
  }


  void _switchView(value) {}


  void handleDemoAction(LeaveBehindDemoAction action) {
    switch (action) {
      case LeaveBehindDemoAction.reset:
        initListItems();
        break;
      case LeaveBehindDemoAction.horizontalSwipe:
        _dismissDirection = DismissDirection.horizontal;
        break;
      case LeaveBehindDemoAction.leftSwipe:
        _dismissDirection = DismissDirection.endToStart;
        break;
      case LeaveBehindDemoAction.rightSwipe:
        _dismissDirection = DismissDirection.startToEnd;
        break;
    }
  }

  void handleUndo(LeaveBehindItem item) {
    final int insertionIndex = lowerBound(leaveBehindItems, item);
    setState(() {
      leaveBehindItems.insert(insertionIndex, item);
    });
  }

  Widget buildItem(LeaveBehindItem item) {
    final ThemeData theme = Theme.of(context);
    return new Dismissible(
        key: new ObjectKey(item),
        direction: _dismissDirection,
        onDismissed: (DismissDirection direction) {
          setState(() {
            leaveBehindItems.remove(item);
          });
          final String action = (direction == DismissDirection.endToStart) ? 'archived' : 'deleted';
          _scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text('You $action item ${item.index}'),
              action: new SnackBarAction(
                  label: 'UNDO',
                  onPressed: () { handleUndo(item); }
              )
          ));
        },
        background: new Container(
            color: Colors.green,
            child: const ListTile(
                leading: const Icon(Icons.done, color: Colors.white, size: 36.0)
            )
        ),
        secondaryBackground: new Container(
            color: Colors.orange,
            child: const ListTile(
                trailing: const Icon(Icons.query_builder, color: Colors.white, size: 36.0)
            )
        ),
        child: new Container(
            decoration: new BoxDecoration(
                color: theme.canvasColor,
                border: new Border(bottom: new BorderSide(color: theme.dividerColor))
            ),
            child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text("M"),
                  radius: 100.0,
                ),
                title: new Text(item.name),
                subtitle: new Text('${item.subject}\n${item.body}'),
                isThreeLine: true
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new Switch(
            value: false,
            onChanged: _switchView,
            inactiveThumbColor: Colors.blue,
            activeColor: Colors.white,
            inactiveThumbImage: new AssetImage("assets/unpin.png"),
            activeThumbImage: new AssetImage("assets/pin.png"),
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: _incrementCounter,
              color: Colors.white)
        ],
      ),
      drawer: new Drawer(
        child: new Column(children: <Widget>[new Expanded(child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: const Text('Zach Widget'),
                accountEmail: const Text('zach.widget@example.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: const AssetImage(
                    _kAsset0,
                    package: _kGalleryAssetsPackage,
                  ),
                )),

            new ListTile(
              leading: new Icon(Icons.inbox),
              title: new Text('All inboxes'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.inbox, color: Colors.blue),
              title: new Text('Inbox'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.query_builder,
                color: Colors.orange,
              ),
              title: new Text('Snoozed'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(
                Icons.done,
                color: Colors.green,
              ),
              title: new Text('Done'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.drafts),
              title: new Text('Drafts'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.send),
              title: new Text('Sent'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.touch_app),
              title: new Text('Reminders'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.delete),
              title: new Text('Trash'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.warning),
              title: new Text('Spam'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Bundled in the inbox'),
            ),
            new ListTile(
              leading: new Icon(Icons.flight, color: Colors.purple),
              title: new Text('Trips'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.bookmark, color: Colors.blue),
              title: new Text('Saved'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.shopping_cart, color: Colors.brown),
              title: new Text('Purchases'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.show_chart, color: Colors.green),
              title: new Text('Finance'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.group, color: Colors.red),
              title: new Text('Social'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.flag, color: Colors.orange),
              title: new Text('Updates'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.forum, color: Colors.blue),
              title: new Text('Forums'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            new ListTile(
              leading: new Icon(Icons.bookmark, color: Colors.lightBlue),
              title: new Text('Promos'),
              onTap: () {
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),

          ],
        )),
        new Divider(),
        new ListTile(
          leading: new Icon(Icons.settings),
          title: new Text('Settings'),
          onTap: () {
            // change app state...
            Navigator.pop(context); // close the drawer
          },
        ),
        new ListTile(
          leading: new Icon(Icons.help),
          title: new Text('Help & feedback'),
          onTap: () {
            // change app state...
            Navigator.pop(context); // close the drawer
          },
        ),
        ],),
      ),
      body: new ListView(
          children: leaveBehindItems.map(buildItem).toList()
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
**/






/////////////////////////////////////////////





/**
import "package:flutter/material.dart";

void main() {
  runApp(new ControlleApp());
}

class ControlleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      backgroundColor: new Color(0xFF26C6DA),
    ),
    floatingActionButton: new FloatingActionButton(
      tooltip: 'Add',
      child: new Icon(Icons.add),
      backgroundColor: new Color(0xFFF44336),
      onPressed: (){
        new SimpleDialog(
          title: new Text('Test'),
          children: <Widget>[
            new RadioListTile(
              title: new Text('Testing'), value: null, groupValue: null, onChanged: (value) {},
            )
          ],
        );
      }     
    ),    
  );
}
**/







//////////////////////////////////////////////////////////




/**
import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ExampleWidget(),
    );
  }
}

/// Opens an [AlertDialog] showing what the user typed.
class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => new _ExampleWidgetState();
}

/// State for [ExampleWidget] widgets.
class _ExampleWidgetState extends State<ExampleWidget> {
  final TextEditingController _controller = new TextEditingController();
/**
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: 'Type something',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('What you typed'),
                content: new Text(_controller.text),
              ),
            );
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
**/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Friendlychat")
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _controller,
              decoration: new InputDecoration(
                hintText: 'Type something',
              ),
            ),
            new RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text('What you typed'),
                    content: new Text(_controller.text),
                  ),
                );
              },
              child: new Text('DONE'),
            ),
          ],
        )
    );
  }

}
**/



//////////////////////////////////////////////////////////////////////////





import 'package:flutter/material.dart';

// This app is a stateful, it tracks the user's current choice.
class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Basic AppBar'),
          actions: <Widget>[
            new IconButton( // action button
              icon: new Icon(choices[0].icon),
              onPressed: () { _select(choices[0]); },
            ),
            new IconButton( // action button
              icon: new Icon(choices[1].icon),
              onPressed: () { _select(choices[1]); },
            ),
            new PopupMenuButton<Choice>( // overflow menu
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    value: choice,
                    child: new Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new BasicAppBarSample());
}