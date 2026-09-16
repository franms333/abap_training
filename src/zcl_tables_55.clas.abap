CLASS zcl_tables_55 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tables_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF sample_row,
               id   TYPE i,
               name TYPE c LENGTH 20,
               category TYPE c LENGTH 20,
               country TYPE c LENGTH 3,
           END OF sample_row.

*  STANDARD TABLES: Slow

    DATA: standard_tab TYPE STANDARD TABLE OF sample_row.

          standard_tab = VALUE #(
            ( id = 1 name = 'Apple' category = 'Fruits' country = 'USA' )
            ( id = 3 name = 'Rice' category = 'Grain' country = 'IT' )
            ( id = 2 name = 'Chicken' category = 'Meat' country = 'VEN' )
          ).

          out->write( standard_tab ).

*   SORTED TABLES: Fast

    DATA: sorted_tab TYPE SORTED TABLE OF sample_row WITH NON-UNIQUE KEY id.

          sorted_tab = VALUE #(
            ( id = 1 name = 'Apple' category = 'Fruits' country = 'USA' )
            ( id = 2 name = 'Rice' category = 'Grain' country = 'IT' )
            ( id = 3 name = 'Chicken' category = 'Meat' country = 'VEN' )
          ).

          out->write( sorted_tab ).

*   HASHED TABLES: Fastest

    DATA: hashed_tab TYPE HASHED TABLE OF sample_row WITH UNIQUE KEY id name.

          hashed_tab = VALUE #(
            ( id = 1 name = 'Apple' category = 'Fruits' country = 'USA' )
            ( id = 2 name = 'Rice' category = 'Grain' country = 'IT' )
            ( id = 3 name = 'Chicken' category = 'Meat' country = 'VEN' )
          ).

          out->write( hashed_tab ).

  ENDMETHOD.
ENDCLASS.
