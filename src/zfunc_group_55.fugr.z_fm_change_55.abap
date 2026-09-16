FUNCTION Z_FM_CHANGE_55.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(NUM_ONE) TYPE  I
*"     VALUE(NUM_TWO) TYPE  I DEFAULT 5
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  STRING
*"  CHANGING
*"     REFERENCE(REF_CHANGE) TYPE REF TO  I
*"     REFERENCE(VAL_CHANGED) TYPE  I
*"----------------------------------------------------------------------
* Value allows you direct access to importing parameters
    " for example: num_one = 4 -> this is an error
    "              num_two = 8 -> this will work

    ref_change->* = ref_change->* + 10.
    val_changed = val_changed + 10.

    result = num_one + num_two.



ENDFUNCTION.
