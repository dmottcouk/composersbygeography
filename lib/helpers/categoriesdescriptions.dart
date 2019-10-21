import 'package:flutter/material.dart';


class CategoriesDescriptions {

  static List<String> getCategoryDescription (String cat)
  {
    switch(cat.toLowerCase())
    {
      case 'medieval' :
        return ['500 - 1400','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];
      case 'renaissance' :
         return ['1400 - 1600','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];
      case 'baroque' :
        return ['1600 - 1750','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];
      case 'classical' :
         return ['1750 - 1825','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];
      case 'romantic' :
        return ['1825 - 1900','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];
      case 'contemporary' :
         return ['1900 - ','Medieval music consists of songs, instrumental pieces, and liturgical music from about 500 A.D. to 1400.',
          'Medieval music was both sacred and secular','During the earlier medieval period, the liturgical genre, predominantly Gregorian chant, was monophonic',
          'Polyphonic genres began to develop during the high medieval era, becoming prevalent by the later thirteenth and early fourteenth century'];          
       

    }
   


  }





}