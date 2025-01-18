CLASS zcl_invoice_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_invoice_log_c310 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    GET TIME STAMP FIELD DATA(lv_start).

    DELETE FROM zinvoice_lg_c310.

    DO 100000 TIMES.

      MODIFY zinvoice_lg_c310  FROM TABLE @( VALUE #( (  invoice_id   = sy-index
                                                         comp         = '1010'
                                                         customer     = 'Coca-Cola'
                                                         status       = 'P'
                                                         create_by    = cl_abap_context_info=>get_user_technical_name( )
                                                         amount       = '1000'
                                                         Currency_key = 'USD' )

                                                    ( invoice_id   = sy-index
                                                         comp         = '1020'
                                                         customer     = 'Nestle'
                                                         status       = 'P'
                                                         create_by    = cl_abap_context_info=>get_user_technical_name( )
                                                         amount       = '500'
                                                         Currency_key = 'EUR' )

                                                    ( invoice_id   = sy-index
                                                         comp         = '1030'
                                                         customer     = 'Bimbo'
                                                         status       = 'P'
                                                         create_by    = cl_abap_context_info=>get_user_technical_name( )
                                                         amount       = '3000'
                                                         Currency_key = 'JPY' )

                                                    ( invoice_id   = sy-index
                                                         comp         = '1040'
                                                         customer     = 'Pepsi'
                                                         status       = 'P'
                                                         create_by    = cl_abap_context_info=>get_user_technical_name( )
                                                         amount       = '700'
                                                         Currency_key = 'USD' )

                                                    ( invoice_id   = sy-index
                                                       comp         = '1050'
                                                         customer     = 'Boing'
                                                         status       = 'P'
                                                         create_by    = cl_abap_context_info=>get_user_technical_name( )
                                                         amount       = '10000'
                                                         Currency_key = 'EUR' ) ) ).

    ENDDO.

    GET TIME STAMP FIELD DATA(lv_end).

    DATA(lv_dif_sec) = cl_abap_tstmp=>subtract(
                         tstmp1 = lv_end
                         tstmp2 = lv_start ).

    out->write( |Total execution time: { lv_dif_sec }| ).

  ENDMETHOD.
ENDCLASS.
