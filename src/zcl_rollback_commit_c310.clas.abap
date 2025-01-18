CLASS zcl_rollback_commit_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rollback_commit_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* 1 LUW

    UPDATE zcarrier_lg_c310
       SET currency_code = 'USD'
     WHERE carrier_id = 'AA'.

    IF sy-subrc = 0.

      COMMIT WORK.

* 2 LUW
      SELECT SINGLE FROM zcarrier_lg_c310
      FIELDS *
      WHERE carrier_id = 'AA'
      INTO @DATA(ls_airline).

      IF sy-subrc = 0.

        out->write(  ls_airline-currency_code ).

      ENDIF.

      ROLLBACK WORK.

      SELECT SINGLE FROM zcarrier_lg_c310
      FIELDS *
      WHERE carrier_id = 'AA'
      INTO @ls_airline.

      IF sy-subrc = 0.

        out->write(  ls_airline-currency_code ).

      ENDIF.

      UPDATE zcarrier_lg_c310
       SET currency_code = 'EUR'
     WHERE carrier_id = 'AA'.

      ROLLBACK WORK.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
