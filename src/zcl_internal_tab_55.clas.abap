CLASS zcl_internal_tab_55 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internal_tab_55 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF employee_row,
            id TYPE i,
            first_name TYPE c LENGTH 20,
            last_name TYPE C LENGTH 20,
            department TYPE c LENGTH 2,
            full_name TYPE c LENGTH 40,
        END OF employee_row.

  DATA: employees_table TYPE SORTED TABLE OF employee_row WITH UNIQUE KEY id.

  employees_table = VALUE #(
    ( id = 1 first_name = 'Frank' last_name = 'Montes' department = 'IT' )
    ( id = 3 first_name = 'Yamba' last_name = 'Labarca' department = 'SP' )
  ).

*  out->write( employees_table ).

* Inserting a table
  DATA: employee TYPE employee_row.

  employee-id = '2'.
  employee-first_name = 'Mochi'.
  employee-last_name = 'Montes'.
  employee-department = 'SA'.

  INSERT employee INTO TABLE employees_table.

*  out->write( employees_table ).

* Modify a table

    CLEAR employee.

    employee-id = '2'.
    employee-first_name = 'Someone'.
    employee-last_name = 'Doe'.
    employee-department = 'SA'.

*    MODIFY TABLE employees_table FROM employee.

*    out->write( employees_table ).

* Failed Insert
    INSERT VALUE #( id = 2 first_name = 'No' last_name = 'name' department = 'HR' ) INTO TABLE employees_table.

    IF sy-subrc = 0. " <- means true
*        out->write( 'Inserted' ).
    ELSE.
        DATA(subrc) = sy-subrc.
*        out->write( |Failed sy-subrc = { subrc }| ).
    ENDIF.

* Filtering a table
    DATA(filtered_tab) = FILTER #( employees_table WHERE id < 3 ).

*    out->write( filtered_tab ).

* Reading tables

    READ TABLE employees_table WITH KEY id = 2 INTO DATA(employee_two).
*    out->write( employee_two ).

*    DATA(employee_one) = employees_table[ id = 1 ].
*        out->write( employee_one ).

* Modifying with row
*    employee_one-full_name = 'Oops'.

*    MODIFY TABLE employees_table FROM employee_one.
*    out->write( employees_table ).

* Table to Structure with line LINE OF
    DATA: tab_line LIKE LINE OF employees_table.
*        out->write( tab_line ).

* LOOPS
*    LOOP AT employees_table INTO DATA(employee_line).
*        employee_line-full_name = |{ employee_line-first_name } { employee_line-last_name }|.
*        MODIFY TABLE employees_table FROM employee_line.
*    ENDLOOP.

*    out->write( employees_table ).

* FIELD SYMBOL: Son un puntero del valor en memoria evitando usar MODIFY

*    LOOP AT employees_table ASSIGNING FIELD-SYMBOL(<fs_employee>).
*        <fs_employee>-full_name = |{ <fs_employee>-first_name } { <fs_employee>-last_name }|.
*    ENDLOOP.

*    out->write( employees_table ).

* Reference

    LOOP AT employees_table REFERENCE INTO DATA(employee_ref).
        employee_ref->full_name = |{ employee_ref->first_name } { employee_ref->last_name }|.
    ENDLOOP.

*    out->write( employees_table ).

* Base
    DATA(employee_one) = employees_table[ id = 1 ].

    MODIFY TABLE employees_table FROM VALUE #( BASE employee_one full_name = 'This is a mistake' ).

    out->write( employees_table ).

  ENDMETHOD.
ENDCLASS.
