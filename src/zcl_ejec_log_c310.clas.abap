CLASS zcl_ejec_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejec_log_c310 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lv_first_name TYPE zde_first_name.
*
*    lv_first_name = 'Enrique'.
*
*    out->write( lv_first_name ).
*
*    data: ls_employee type zst_employee.
*
*    ls_employee-fisrt_name = 'Laura'.
*    ls_employee-last_name = 'Gomez'.
**    ls_employee-address-adress_id = 1.
**    ls_employee-adress_id = 2.
*
*    out->write( ls_employee ).
*
*    data: lt_adress type ztt_address_c310.
*
*    lt_adress[ 1 ]-adress_id = 1.
*
*
*    data: ls_address2 type zst_employee.
*
*    ls_address2-fisrt_name = 'Pedro'.
*    ls_address2-address[ 1 ]-adress_id = 2.

    DELETE FROM zemployee_c310_d.

    MODIFY zemployee_c310_d FROM TABLE @( VALUE #( (  employee_id   = 1
                                                    fisrt_name   = 'Juan'
                                                    last_name    = 'Coca'
                                                    start_date   = cl_abap_context_info=>get_system_date( )
                                                    job_category = 'A01'
                                                    address_id   = 1 )

                                                  ( employee_id   = 2
                                                    fisrt_name   = 'Pedro'
                                                    last_name    = 'Coca'
                                                    start_date   = cl_abap_context_info=>get_system_date( )
                                                    job_category = 'B01'
                                                    address_id   = 2 )

                                                  ( employee_id   = 3
                                                    fisrt_name   = 'Luis'
                                                    last_name    = 'Coca'
                                                    start_date   = cl_abap_context_info=>get_system_date( )
                                                    job_category = 'C01'
                                                    address_id   = 3 )

                                                  ( employee_id   = 4
                                                    fisrt_name   = 'Javier'
                                                    last_name    = 'Coca'
                                                    start_date   = cl_abap_context_info=>get_system_date( )
                                                    job_category = 'D01'
                                                    address_id   = 4 )

                                                  ( employee_id   = 5
                                                    fisrt_name   = 'Laura'
                                                    last_name    = 'Coca'
                                                    start_date   = cl_abap_context_info=>get_system_date( )
                                                    job_category = 'A02'
                                                    address_id   = 5  ) ) ).

    IF sy-subrc = 0.

      out->write( |{ sy-dbcnt } rows affected| ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
