CLASS zcl_strings_55 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_strings_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(string_data) = `I am a string`.
  DATA(char_data) = 'I am a char'.

* STRING LENGTH

*  out->write( strlen( string_data ) ).

* CHAR LENGTH

*  out->write( numofchar( char_data ) ).

* STRING FUNCTIONS

*  out->write( to_upper( string_data ) ). "to uppercase
*  out->write( to_lower( string_data ) ). "to lowercase

* REPLACE

*  out->write( replace( val = `I am batman's buddy` sub = `b` with = `f` occ = 1 ) ). "para todas las ocurrencias usar occ = 0 y para la ultima usar occ = -1

*  out->write( substring( val = `I am pacman` off = 2 ) ).
*  out->write( substring( val = `I am pacman` off = 2 len = 6 ) ). " am pac
*  out->write( substring( val = `I am pacman` len = 6 ) ). "I am p

* CHAR SUBCHARS

*  out->write( char_data+2 ). "am a char
*  out->write( char_data+2(6) ). "am a c
*  out->write( char_data(6) ). "I am a

* SUBSTRING

*  out->write( substring_from( val = 'I am pacman' sub = 'am' ) ). "substring from where it found the sub
*  out->write( substring_to( val = `I am pacman` sub = 'am' ) ). "substring to where if finds the sub
*  out->write( substring_after( val = `I am pacman` sub = 'am' ) ). "substring after the end of the found sub
*   out->write( substring_before( val = `I am pacman` sub = 'am' ) ). "substring before entering the sub

* FIND

*  out->write( find( val = `I am pacman` sub = `pac` ) ). " if it finds something it returns the number position in the string otherwise returns -1

*  out->write( find( val = `I am pacman` pcre = `[A-Z]` ) ). "REGEX

* FIND ANY OF: returns the index of any char found in the string

*  out->write( find_any_of( val = `I am pacman` sub = `pag` ) ).
*  out->write( find_any_of( val = `I am pacman` sub = `pc` ) ).

* REVERSE

*  out->write( reverse( 'This String' ) ).

* INSERT: Insert a string into a string chain

*  out->write( insert( val = 'This String' sub = ' is a' off = 4 ) ).

* CONCATENATE

  CONCATENATE 'This is' 'a String' INTO DATA(concat_res) SEPARATED BY ' '.
*  out->write( concat_res ).

* SPLIT

  DATA(split_me) = |split, me|.
  SPLIT split_me AT ',' INTO DATA(s1) DATA(s2).

*  out->write( s1 ).
*  out->write( s2 ).

* SHIFT: same as substring but more destructive, it alters the space in memory

  DATA(shift_me) = |shift me|.
*  SHIFT shift_me BY 2 PLACES. "same as substring_from

*  out->write( shift_me ).

*  SHIFT shift_me RIGHT BY 2 PLACES. "it replaces the number of chars with spaces
*  out->write( shift_me ).

*  SHIFT shift_me CIRCULAR BY 2 PLACES. "takes the character removed from and inserts them in the end of the string
*  out->write( shift_me ).

*  out->write( shift_left( val = shift_me places = 2 ) ).

   SHIFT shift_me UP TO 'ft'.
   out->write( shift_me ).

* CONDENSE
   DATA(condense_me) = |  Condense Me |.

   CONDENSE condense_me. "trims the start and end spaces

*  out->write( condense_me ).

   CONDENSE condense_me NO-GAPS. "trims all spaces

   out->write( condense_me ).



  ENDMETHOD.
ENDCLASS.
