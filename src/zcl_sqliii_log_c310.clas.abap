CLASS zcl_sqliii_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sqliii_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA(ls_airline) = VALUE zcarrier_lg_c310( carrrier_id = 'WZ'
*                                               name = 'Wizz Air'
*                                               currency_code = 'USD' ).
*
*    MODIFY zcarrier_lg_c310 FROM @ls_airline.
*

    SELECT FROM zcarrier_lg_c310
     FIELDS *
     WHERE carrrier_id = 'AA'
       OR carrrier_id = 'FJ'
     INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.

      LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<ls_airline>).
        <ls_airline>-currency_code = 'MXN'.
      ENDLOOP.

      APPEND VALUE #( carrrier_id = 'AV'
                             name = 'Avianca'
                    currency_code = 'COP' ) TO lt_airlines.

       MODIFY zcarrier_lg_c310 FROM TABLE @lt_airlines.

      IF sy-subrc = 0.

        out->write( 'The records was modified correctly' ).

      ELSE.

        out->write( 'The records was NOT modified' ).

      ENDIF.

    ENDIF.






















  ENDMETHOD.

ENDCLASS.
