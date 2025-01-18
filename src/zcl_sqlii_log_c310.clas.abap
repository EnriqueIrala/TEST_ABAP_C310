CLASS zcl_sqlii_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sqlii_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA ls_airline TYPE zcarrier_lg_c310.

*    SELECT SINGLE FROM zcarrier_lg_c310
*    FIELDS *
*    WHERE carrrier_id = 'AA'
*    INTO @ls_airline.
*
*    IF sy-subrc = 0.
*
*      out->write( |Current Currency: { ls_airline-currency_code }| ).
*
*      ls_airline-currency_code = 'EUR'.
*
*      UPDATE zcarrier_lg_c310 FROM @ls_airline.
*
*      IF sy-subrc = 0.
*
*        out->write( |Record updated with the new currency: { ls_airline-currency_code }| ).
*
*      ENDIF.
*
*    ENDIF.

*    ls_airline = VALUE #( carrrier_id = 'AA'
*                          "name = 'Airlines American'
*                          currency_code = 'MXN' ).
*
*    UPDATE zcarrier_lg_c310 FROM @ls_airline.
*
*    IF sy-subrc = 0.
*
*      out->write( |Record updated with the new currency: { ls_airline-currency_code }| ).
*
*    ENDIF.


    CONSTANTS lc_currency TYPE c LENGTH 3 VALUE 'USD'.
*
*    SELECT FROM zcarrier_lg_c310
*    FIELDS *
*    INTO TABLE @DATA(lt_airlines).
*
*    IF sy-subrc = 0.
*
*      LOOP AT lt_airlines ASSIGNING FIELD-SYMBOL(<fs_airlines>).
*        CLEAR <fs_airlines>-name.
*        <fs_airlines>-currency_code = lc_currency.
*      ENDLOOP.
*
*      UPDATE zcarrier_lg_c310 FROM TABLE @lt_airlines.
*
*      IF sy-subrc = 0.
*
*        out->write( |All records updated with the new currency: { lc_currency }| ).
*
*      ENDIF.
*
*    ENDIF.


*    UPDATE zcarrier_lg_c310
*       SET currency_code = @lc_currency.
**      WHERE carrrier_id EQ 'FJ'
**         OR carrrier_id EQ 'AA'.
*
*
*    IF sy-subrc = 0.
*
*      out->write( 'Records updated' ).
*
*    ELSE.
*
*      out->write( 'Records NOt updated' ).
*
*    ENDIF.


    UPDATE zflight_lgl
      SET maximumseats = maximumseats + 20,
          occupiedseats = occupiedseats + 7
     WHERE airlineid = 'LH'.


    IF sy-subrc = 0.

      out->write( |Updated Rows: { sy-dbcnt }| ).

    ELSE.

      out->write( 'Updated not executed' ).

    ENDIF.























  ENDMETHOD.

ENDCLASS.
