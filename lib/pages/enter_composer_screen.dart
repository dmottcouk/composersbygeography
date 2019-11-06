import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../models/categories.dart';
import '../helpers/geocoder_helper.dart';
import '../models/placelocation.dart';
import '../providers/composer_provider.dart';
import './map_screen.dart';

class EnterComposerScreen extends StatefulWidget {
  static const routeName = '/entercomposer';

  @override
  _EnterComposerScreenState createState() => _EnterComposerScreenState();
}

class _EnterComposerScreenState extends State<EnterComposerScreen> {
  List<Category> _categories = Categories.getCategories();
  List<DropdownMenuItem<Category>> _dropdownMenuItems;
  Category _selectedCategory;
  String _categoryassetimage;
  final _form = GlobalKey<FormState>();

  final _firstnameFocusNode = FocusNode();
  final _subcatFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _birthlocationFocusNode = FocusNode();
  final _dodFocusNode = FocusNode();
  final _deathlocationFocusNode = FocusNode();
  final _bioFocusNode = FocusNode();
  final _youtubeFocusNode = FocusNode();
  final _textLinksFocusNode = FocusNode();

  final _birthplaceController =
      TextEditingController(); // we can enable or disable the info icon based on the focusNode attached to this controller
  final _deathplaceController = TextEditingController();
  final _youtubelinksController = TextEditingController();

  bool _birthplaceinfobuttonenabled;
  bool _deathplaceinfobuttonenabled;

  String geocodedBirthLocation;
  String geocodedDeathLocation;

  PlaceLocation birthLocation;
  PlaceLocation deathLocation;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_categories);
    _selectedCategory = _dropdownMenuItems[0].value;
    _categoryassetimage = _categories[0].associatedimage;
    _birthplaceinfobuttonenabled = false;
    _deathplaceinfobuttonenabled = false;

    //_birthlocationFocusNode.addListener(_updatebirthlocinfo);
    _birthplaceController.addListener(_updatebirthlocinfo);
    _deathplaceController.addListener(_updatedeathlocinfo);
    super.initState();
  }

  @override
  void dispose() {
    _firstnameFocusNode.dispose();
    _subcatFocusNode.dispose();
    _dobFocusNode.dispose();
    _birthlocationFocusNode.dispose();
    _dodFocusNode.dispose();
    _deathlocationFocusNode.dispose();
    _bioFocusNode.dispose();

    _youtubeFocusNode.dispose();
    _textLinksFocusNode.dispose();
    super.dispose();
  }

  void _updatebirthlocinfo() {
    print('_updatebirthlocinfo');
    if (_birthlocationFocusNode.hasFocus &&
        (geocodedBirthLocation != _birthplaceController.text)) {
      print('set birth loc info button disabled');

      setState(() {
        _birthplaceinfobuttonenabled = false;
      });
    }
  }

  void _updatedeathlocinfo() {
    print('_updatedeathlocinfo');
    if (_deathlocationFocusNode.hasFocus &&
        (geocodedDeathLocation != _deathplaceController.text)) {
      print('set death loc info button disabled');

      setState(() {
        _deathplaceinfobuttonenabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final devicewidth = MediaQuery.of(context).size.width;
    final deviceheight = MediaQuery.of(context).size.height;

    final ComposerProvider compProvider =
        Provider.of<ComposerProvider>(context, listen: false);
    //compProvider.initComposer();
    print('EnterComposerScreen build');
    //this._birthplaceinfobuttonenabled = Provider.of<ComposerProvider>(context, listen: false).birthlocgeolocresult;

    return Stack(
      children: <Widget>[
        Image.asset(_categoryassetimage,
            height: deviceheight, width: devicewidth, fit: BoxFit.cover),
        Scaffold(
          backgroundColor: Colors.white54,
          appBar: AppBar(
            title: Text('Enter composer'),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: devicewidth * 7 / 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Category',
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        _buildDateInfo(_selectedCategory),
                        DropdownButton(
                            elevation: 8,
                            value: _selectedCategory,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropdownItem),
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                    width: devicewidth * 7 / 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60,
                    ),
                    //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _form,
                          child: Column(children: <Widget>[
                            TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Surname'),
                                // this controls what the submit action of the soft keyboard input does
                                //
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_firstnameFocusNode);
                                },
                                onSaved: (value) {}),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'First names'),
                                      // this controls what the submit action of the soft keyboard input does
                                      //
                                      textInputAction: TextInputAction.next,
                                      focusNode: _firstnameFocusNode,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context)
                                            .requestFocus(_subcatFocusNode);
                                      },
                                      onSaved: (value) {}),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: Icon(Icons.help),
                                      onPressed: () {
                                        //_showfirstnamesinfoDialog(context);
                                        _showDialog(
                                            context,
                                            'First names information',
                                            'Enter first and any middle names');
                                      }),
                                )
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'Subcategory'),
                                        // this controls what the submit action of the soft keyboard input does
                                        //
                                        textInputAction: TextInputAction.next,
                                        focusNode: _subcatFocusNode,
                                        //
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_dobFocusNode);
                                        },
                                        onSaved: (value) {}),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        icon: Icon(Icons.help),
                                        onPressed: () {
                                          // _showsubcategoryinfoDialog(context);

                                          _showDialog(
                                              context,
                                              'Subcategory information',
                                              'Enter main composition type eg Choral, Orchestral, Brass Band etc');
                                        }),
                                  )
                                ]),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Date of Birth',
                                          hintText: 'dd/mm/yyyy'),
                                      // this controls what the submit action of the soft keyboard input does
                                      //
                                      textInputAction: TextInputAction.next,
                                      focusNode: _dobFocusNode,

                                      //
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _birthlocationFocusNode);
                                      },
                                      onSaved: (value) {}),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: Icon(Icons.help),
                                      onPressed: () {
                                        // _showsubcategoryinfoDialog(context);

                                        _showDialog(
                                            context,
                                            'Date of birth information',
                                            'Enter in format date / month / year ');
                                      }),
                                )
                              ],
                            ),
                            /*
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'BirthLocation'),

                                          // this controls what the submit action of the soft keyboard input does
                                          //
                                          textInputAction: TextInputAction.next,
                                          controller: _birthplaceController,
                                          focusNode: _birthlocationFocusNode,
                                          //
                                          onFieldSubmitted: (_) {
                                            FocusScope.of(context)
                                                .requestFocus(_dodFocusNode);
                                          },
                                          onSaved: (value) {}),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.gps_fixed),
                                            onPressed: () {
                                              print('geocode button pressed');
                                              if (_birthplaceController
                                                      .text.length ==
                                                  0) {
                                                _showThePleaseEnteraBirthLocationDialog(
                                                    context);
                                              } else {
                                                geocodedBirthLocation =
                                                    _birthplaceController.text;
                                                _birthplaceinfobuttonenabled =
                                                    true;
                                                compProvider
                                                    .setComposerBirthLocation(
                                                        _birthplaceController
                                                            .text);
                                              }
                                            }),
                                        Consumer<ComposerProvider>(
                                          builder: (ctx, cp, _) => IconButton(
                                              icon: Icon(Icons.info),
                                              onPressed: (cp
                                                          .birthlocgeolocresult &&
                                                      (_birthplaceinfobuttonenabled ==
                                                          true))
                                                  ? () {
                                                      _showbirthlocationinfoDialog(
                                                          context,
                                                          cp.getComposerBirthLocation());
                                                    }
                                                  : null),
                                        ),
                                        Consumer<ComposerProvider>(
                                          builder: (ctx, cp, _) => IconButton(
                                              icon: Icon(Icons.map,
                                                  color: (cp.birthlocgeolocresult &&
                                                          (_birthplaceinfobuttonenabled ==
                                                              true))
                                                      ? Colors.green
                                                      : Colors.black),
                                              onPressed: () {
                                                // we show the geolocation or allow user to enter a location

                                                Navigator.of(context).pushNamed(
                                                    MapScreen.routeName,
                                                    arguments: {
                                                      'loc': cp
                                                          .getComposerBirthLocation(),
                                                      'zoom': 10.0
                                                    });
                                              }),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            */
                            _buildBirthLocationWidget(compProvider),
                            SizedBox(height: 50),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Date of Death',
                                    hintText: 'dd/mm/yyyy'),
                                // this controls what the submit action of the soft keyboard input does
                                //
                                textInputAction: TextInputAction.next,
                                focusNode: _dodFocusNode,
                                //
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_deathlocationFocusNode);
                                },
                                onSaved: (value) {}),
                            _buildDeathLocationWidget(compProvider),
                            TextFormField(
                                decoration: InputDecoration(labelText: 'Bio'),
                                // this controls what the submit action of the soft keyboard input does
                                //
                                maxLines: 4,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.multiline,
                                focusNode: _bioFocusNode,
                                //
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_youtubeFocusNode);
                                }),
                            TextFormField(
                              decoration:
                                  //InputDecoration(labelText: 'YoutubeLinks', hintText: 'http://youtube.com/watch?'),
                                  InputDecoration(labelText: 'YoutubeLinks'),
                              // this controls what the submit action of the soft keyboard input does
                              //
                              // dont use textInputAction for multiLines ... or onFieldSubmitted
                              // textInputAction: TextInputAction.next,
                              focusNode: _youtubeFocusNode,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              //controller: _youtubelinksController,
                              initialValue: 'http://youtube.com/watch?',

                              //
                              // onFieldSubmitted: (_) {
                              //   FocusScope.of(context)
                              //       .requestFocus(_textLinksFocusNode);
                              // }),
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'textLinks'),
                              // this controls what the submit action of the soft keyboard input does
                              //
                              //textInputAction: TextInputAction.next,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              focusNode: _textLinksFocusNode,
                            )
                            //
                            // onFieldSubmitted: (_) {}),
                          ]),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBirthLocationWidget(ComposerProvider compProvider) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                  decoration: InputDecoration(labelText: 'BirthLocation'),

                  // this controls what the submit action of the soft keyboard input does
                  //
                  textInputAction: TextInputAction.next,
                  controller: _birthplaceController,
                  focusNode: _birthlocationFocusNode,
                  //
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_dodFocusNode);
                  },
                  onSaved: (value) {}),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.gps_fixed),
                    onPressed: () {
                      print('geocode button pressed');
                      if (_birthplaceController.text.length == 0) {
                        _showThePleaseEnteraBirthLocationDialog(context);
                      } else {
                        geocodedBirthLocation = _birthplaceController.text;
                        _birthplaceinfobuttonenabled = true;
                        compProvider.setComposerBirthLocation(
                            _birthplaceController.text);
                        // compProvider.setComposerBirthLocation(
                        //    _birthplaceController.text);

                      }
                    }),
                Consumer<ComposerProvider>(
                  builder: (ctx, cp, _) => IconButton(
                      icon: Icon(Icons.info),
                      onPressed: (cp.birthlocgeolocresult &&
                              (_birthplaceinfobuttonenabled == true))
                          ? () {
                              _showbirthlocationinfoDialog(
                                  context, cp.getComposerBirthLocation());
                            }
                          : null),
                ),
                Consumer<ComposerProvider>(
                  builder: (ctx, cp, _) => IconButton(
                      icon: Icon(Icons.map,
                          color: (cp.birthlocgeolocresult &&
                                  (_birthplaceinfobuttonenabled == true))
                              ? Colors.green
                              : Colors.black),
                      onPressed: () {
                        // we show the geolocation or allow user to enter a location

                        Navigator.of(context).pushNamed(MapScreen.routeName,
                            arguments: {
                              'loc': cp.getComposerBirthLocation(),
                              'zoom': 10.0,
                              'title': 'Birth Location'
                            });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDeathLocationWidget(ComposerProvider compProvider) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                  decoration: InputDecoration(labelText: 'DeathLocation'),

                  // this controls what the submit action of the soft keyboard input does
                  //
                  textInputAction: TextInputAction.next,
                  controller: _deathplaceController,
                  focusNode: _deathlocationFocusNode,
                  //
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_bioFocusNode);
                  },
                  onSaved: (value) {}),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.gps_fixed),
                    onPressed: () {
                      print('geocode button pressed');
                      if (_deathplaceController.text.length == 0) {
                        _showThePleaseEnteraDeathLocationDialog(context);
                      } else {
                        geocodedDeathLocation = _deathplaceController.text;
                        _deathplaceinfobuttonenabled = true;
                        compProvider.setComposerDeathLocation(
                            _deathplaceController.text);
                      }
                    }),
                Consumer<ComposerProvider>(
                  builder: (ctx, cp, _) => IconButton(
                      icon: Icon(Icons.info),
                      onPressed: (cp.deathlocgeolocresult &&
                              (_deathplaceinfobuttonenabled == true))
                          ? () {
                              _showdeathlocationinfoDialog(
                                  context, cp.getComposerDeathLocation());
                            }
                          : null),
                ),
                Consumer<ComposerProvider>(
                  builder: (ctx, cp, _) => IconButton(
                      icon: Icon(Icons.map,
                          color: (cp.deathlocgeolocresult &&
                                  (_deathplaceinfobuttonenabled == true))
                              ? Colors.green
                              : Colors.black),
                      onPressed: () {
                        // we show the geolocation or allow user to enter a location

                        Navigator.of(context).pushNamed(MapScreen.routeName,
                            arguments: {
                              'loc': cp.getComposerDeathLocation(),
                              'zoom': 10.0,
                              'title': 'Death Location'
                            });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showsubcategoryinfoDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Subcategory information'),
        content: Text(
            'Enter main composition type eg Choral, Orchestral, Brass Band etc'),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showThePleaseEnteraBirthLocationDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Enter place'),
        content: Text('Enter the place of birth'),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showThePleaseEnteraDeathLocationDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Enter place'),
        content: Text('Enter the place of death'),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showDialog(BuildContext ctx, String title, String bodytext) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(bodytext),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showbirthlocationinfoDialog(BuildContext ctx, PlaceLocation bloc) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Birth location information'),
        content: Text(
            'Location = ${bloc.address} latitude = ${bloc.latitude} longitude=${bloc.longitude} '),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showdeathlocationinfoDialog(BuildContext ctx, PlaceLocation bloc) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('Death location information'),
        content: Text(
            'Location = ${bloc.address} latitude = ${bloc.latitude} longitude=${bloc.longitude} '),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void _showfirstnamesinfoDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('First names information'),
        content: Text('Enter first and any middle names'),
        actions: <Widget>[
          FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category category in categories) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(category.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Category selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
      _categoryassetimage = selectedCategory.associatedimage;
    });
  }
}

Widget _buildDateInfo(Category selectedCategory) {
  switch (selectedCategory.name.toLowerCase()) {
    case 'medieval':
      return Text('500 - 1400', style: TextStyle(fontSize: 12));
    case 'renaissance':
      return Text('1400 - 1600', style: TextStyle(fontSize: 12));
    case 'baroque':
      return Text('1600 - 1750', style: TextStyle(fontSize: 12));
    case 'classical':
      return Text('1750 - 1825', style: TextStyle(fontSize: 12));
    case 'romantic':
      return Text('1825 - 1900', style: TextStyle(fontSize: 12));
    case 'contemporary':
      return Text('1900 - ');
  }
}
