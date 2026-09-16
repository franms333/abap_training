CLASS zcl_math_exp_55 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_math_exp_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: num TYPE i.

    num = 1 + 2.

*  out->write( num ).

    num = num + 1.

*  out->write( num ).

    num += 1.

*  out->write( num ).

    num -= 1.

*  out->write( num ).

    num = 2 * 3.

*  out->write( num ).

    num = 4 / 2.

*  out->write( num ).

    num = 1 / 8.

*    out->write( num ) " only returns 0 because of the return value being integer.

    DATA: pack TYPE p LENGTH 5 DECIMALS 3.

    pack = 1 / 8.

*    out->write( pack ).

    num = 3 ** 2. " exponenciales

*    out->write( num ).

    num = 3 MOD 2. " resto de la division

*    out->write( num ).

*    out->write( 3 ** 2 ).

* CONVERSION

    pack = '0.597'.
*    out->write( |Converting a pack to an int 0.597: { CONV i( pack ) }| ). " CONV convierte al tipo que se pase al lado, en este caso fue i "integer"

    pack = 1 DIV 8. " integer division
*    out->write( pack ).

    DATA(total) = REDUCE i( "REDUCE es similar al reduce de JS, permite iterar para reducir o condensar informacion en un solo valor o estructura
      INIT sum = 0
      FOR i = 1 UNTIL i = 5
      NEXT sum += i
    ).

    out->write( total ).

  ENDMETHOD.
ENDCLASS.
