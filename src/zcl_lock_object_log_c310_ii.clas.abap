CLASS zcl_lock_object_log_c310_ii DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lock_object_log_c310_ii IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'User has started the BP' ).

* Obtener la referencia del objeto de bloqueo
    TRY.

        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZEMP_LGL_C310' ).

      CATCH cx_abap_lock_failure.

        out->write( 'Lock Object Instance is not created' ).
        RETURN.

    ENDTRY.

* Se establecen parámetros de bloqueo
    DATA: lt_parameter TYPE if_abap_lock_object=>tt_parameter.

    lt_parameter = VALUE #( ( name = 'EMPLOYEE_ID'
                              value = REF #( '5' ) ) ).

* Realizar el bloqueo
    TRY.

        lo_lock_object->enqueue( it_parameter  = lt_parameter ).

      CATCH cx_abap_foreign_lock.
        out->write( 'Foreing lock exception' ).

      CATCH cx_abap_lock_failure.
        out->write( 'Not possible to write on the database. object Is locked' ).

    ENDTRY.

    out->write( 'Lock Object is active' ).

    DATA: ls_employee TYPE zemployee_c310.

    ls_employee = VALUE #( employee_id   = 1
                           fisrt_name   = 'Juan'
                           last_name    = 'Perez'
                           start_date   = cl_abap_context_info=>get_system_date( )
                           job_category = 'A'
                           address_id   = 1 ).

* Se actualiza la tabla de base de datos.
    MODIFY zemployee_c310 FROM @ls_employee.

    IF sy-subrc = 0.
      out->write( 'BO was updated on the DDBB' ).
    ENDIF.

* Se libera el bloqueo
    TRY.

        lo_lock_object->dequeue( it_parameter  = lt_parameter ).

      CATCH cx_abap_lock_failure.

        out->write( 'Lock Object was NOT released' ).

    ENDTRY.

    out->write( 'Lock Object was released ' ).

  ENDMETHOD.

ENDCLASS.
