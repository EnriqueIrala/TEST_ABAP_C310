CLASS zcl_sql_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DELETE FROM zcarrier_lg_c310.

*    DATA: ls_airline TYPE zcarrier_lg_c310.
*
*    ls_airline = VALUE #( carrrier_id   = 'MX'
*                          name          = 'Mexicana de aviación'
*                          currency_code = 'USD' ).
**
**    INSERT INTO zcarrier_lg_c310 VALUES @ls_airline.
*
**    INSERT zcarrier_lg_c310 from @( VALUE #(  carrrier_id   = 'LH'
**                                              name          = 'Lufthansa'
**                                              currency_code = 'USD'  ) ).
*
*    INSERT zcarrier_lg_c310 FROM @ls_airline.
*
*
*    IF sy-subrc = 0.
*
*      out->write( 'Record Intserted Correctly' ).
*
*    ELSE.
*
*      out->write( 'The Record was NOT Intserted' ).
*
*    ENDIF.


*    DATA: lt_airline TYPE STANDARD TABLE OF zcarrier_lg_c310.
*
*    SELECT FROM /DMO/I_Carrier
*     FIELDS *
*     WHERE CurrencyCode = 'USD'
*     INTO TABLE @DATA(lt_airlines).
*
*    IF sy-subrc = 0.
*
*      lt_airline = CORRESPONDING #( lt_airlines MAPPING carrrier_id = AirlineID
*                                                        currency_code = CurrencyCode ).
*
*      INSERT zcarrier_lg_c310 FROM TABLE @lt_airline.
*
*      IF sy-subrc = 0.
*
*        out->write( |The number of records inserted are: { sy-dbcnt }| ).
*
*      ENDIF.
*
*    ENDIF.

*    DATA: lt_airline TYPE STANDARD TABLE OF zcarrier_lg_c310.
*
*    SELECT FROM /DMO/I_Carrier
*     FIELDS AirlineID as carrier_id,
*            Name,
*            CurrencyCode as currency_code
*     WHERE CurrencyCode = 'USD'
*     INTO CORRESPONDING FIELDS OF TABLE @lt_airline.
*
*    IF sy-subrc = 0.
*
*      INSERT zcarrier_lg_c310 FROM TABLE @lt_airline.
*
*      IF sy-subrc = 0.
*
*        out->write( |The number of records inserted are: { sy-dbcnt }| ).
*
*      ENDIF.
*
*    ENDIF.

    DATA: lt_airline TYPE STANDARD TABLE OF zcarrier_lg_c310.

    SELECT FROM /DMO/I_Carrier
     FIELDS *
     WHERE CurrencyCode = 'USD'
     INTO TABLE @DATA(lt_airlines).

    IF sy-subrc = 0.

      lt_airline = CORRESPONDING #( lt_airlines MAPPING carrier_id = AirlineID
                                                        currency_code = CurrencyCode ).

*      TRY.
*          INSERT zcarrier_lg_c310 FROM TABLE @( VALUE #( ( carrrier_id = 'MX'
*                                                           name = 'Mexicana de Aviación'
*                                                           currency_code = 'MXN'  )  )  ).


      INSERT zcarrier_lg_c310 FROM TABLE @lt_airline ACCEPTING DUPLICATE KEYS.

*        CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
*          out->write( lx_sql_db->get_text( ) ).
*          RETURN.
*      ENDTRY.

      IF sy-subrc = 0.

        out->write( |The number of records inserted are: { sy-dbcnt }| ).

      ELSE.

        out->write( |The insert was not executed correctly: { sy-dbcnt }| ).

      ENDIF.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
