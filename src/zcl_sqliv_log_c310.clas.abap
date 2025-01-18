CLASS zcl_sqliv_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sqliv_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    SELECT SINGLE FROM zcarrier_lg_c310
*     FIELDS *
*     WHERE carrrier_id = 'MX'
*     INTO @DATA(ls_airline).
*
*    IF sy-subrc = 0.
*
*      DELETE zcarrier_lg_c310 FROM @ls_airline.
*
*      IF sy-subrc = 0.
*
*        out->write( 'Record was deleted correctly' ).
*
*      ENDIF.
*
*    ENDIF.

*    DATA(ls_airline) = VALUE zcarrier_lg_c310( carrrier_id = 'WZ' ).
*
*    DELETE zcarrier_lg_c310 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*
*      out->write( 'Record was deleted correctly' ).
*
*    ENDIF.

*    SELECT FROM zcarrier_lg_c310
*     FIELDS *
*     WHERE currency_code = 'USD'
*     INTO table @DATA(lt_airlines).
*
*    IF sy-subrc = 0.
*
*      DELETE zcarrier_lg_c310 FROM TABLE @lt_airlines.
*
*      IF sy-subrc = 0.
*
*        out->write( 'Records was deleted from database' ).
*
*      ENDIF.
*
*    ENDIF.


    DELETE FROM zcarrier_lg_c310. "WHERE carrrier_id = 'AA'.

    IF sy-subrc = 0.

      out->write( 'Record was deleted from database' ).

    ENDIF.






















  ENDMETHOD.

ENDCLASS.
