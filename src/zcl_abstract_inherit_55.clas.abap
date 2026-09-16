CLASS zcl_abstract_inherit_55 DEFINITION INHERITING FROM zcl_abstract_class_55
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS: say_my_name REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abstract_inherit_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( say_my_name( name = 'Frank' ) ).
  ENDMETHOD.

  METHOD say_my_name.
    result = |Hi! your name is { name }!|.
  ENDMETHOD.

ENDCLASS.
