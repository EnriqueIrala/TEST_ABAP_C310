CLASS zcl_dynamic_cache_lglg_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dynamic_cache_lglg_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    GET TIME STAMP FIELD DATA(lv_start).

    SELECT FROM zinvoice_lg_c310
      FIELDS comp,
             currency_key,
             SUM( amount ) AS TotalAmount
      GROUP BY comp, currency_key
      INTO TABLE @DATA(lt_results).

    IF sy-subrc = 0.

      GET TIME STAMP FIELD DATA(lv_end).

      DATA(lv_dif_sec) = cl_abap_tstmp=>subtract(
                           tstmp1 = lv_end
                           tstmp2 = lv_start ).

      out->write( |Number of reciords: { lines( lt_results ) } | ).
      out->write( lt_results ).

      out->write( |Total execution time: { lv_dif_sec }| ).


    ENDIF.

  ENDMETHOD.

ENDCLASS.
