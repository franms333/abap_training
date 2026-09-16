CLASS zcl_conditionals_55 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_conditionals_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  IF/ELSE

   DATA(str_one) = |ABC|.
   DATA(str_two) = |DEF|.

*   IF str_one = str_two.
*    out->write( 'EQUAL' ).
*   ELSE.
*    out->write( 'NOT EQUAL' ).
*   ENDIF.

*   SWITCH

    DATA(switch_num) = 20.
    DATA(switch_res) = SWITCH string( switch_num
        WHEN 1 THEN 'It is one'
        WHEN 2 THEN |It is two|
        ELSE 'It is more than two'
     ).

     out->write( switch_res ).

*  CASE STATEMENTS

*    DATA(case_chars) = 'Not in whens'.
*    DATA: case_result TYPE c LENGTH 20.
*
*    CASE case_chars.
*        WHEN 'I am an option'.
*            case_result = 'First when'.
*        WHEN 'I am second option'.
*            case_result = 'Second when'.
*        WHEN OTHERS.
*            case_result = 'Not found'.
*    ENDCASE.
*
*    out->write( case_result ).

*   In Line XSDBOOL with logical operators

    out->write( |ABAP TRUE = { ABAP_TRUE }| ).
        out->write( |ABAP FALSE = { ABAP_FALSE }| ).

    DATA(num_for_bool) = 8.
    DATA(is_larger_than_ten) = xsdbool( num_for_bool > 10 ).

    out->write( is_larger_than_ten ).

* = / EQ
* <> / NE (not equal to)
* a BETWEEN b and c (INTERVAL TEST)

    DATA(is_between) = xsdbool( num_for_bool BETWEEN 5 AND 9 ).

    out->write( |is_between = { is_between } | ).

  ENDMETHOD.
ENDCLASS.
