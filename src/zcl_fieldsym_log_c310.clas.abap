CLASS zcl_fieldsym_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fieldsym_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_date,
             year  TYPE n LENGTH 4,
             month TYPE n LENGTH 2,
             day   TYPE n LENGTH 2,
           END OF ty_date.

    DATA: lv_employee TYPE string,
          lv_date     TYPE d.

    FIELD-SYMBOLS: <lv_employee> TYPE string.

**     Assigning field symbol to variable and changing its value
*    lv_employee = 'John Doe'.
*    ASSIGN lv_employee TO <lv_employee>.
*    <lv_employee> = 'Jane Smith'.
*    out->write( |Employee Name: { lv_employee }| ).

**     Inline declaration of field symbol and internal table
    SELECT * FROM zemp_logali INTO TABLE @DATA(lt_employees).
*
    FIELD-SYMBOLS <ls_employee> TYPE zemp_logali.

*    LOOP AT lt_employees ASSIGNING FIELD-SYMBOL(<ls_employee>).
*      <ls_employee>-email = 't100437@logali.com'.
*    ENDLOOP.

*     Adding a new record using APPEND
*    APPEND VALUE #( name = 'New Employee' email = 't100437@logali.com' )
*        TO lt_employees ASSIGNING <ls_employee>.
*    IF <ls_employee> IS ASSIGNED.
*      out->write( |New Employee Added: { <ls_employee>-name }| ).
*      UNASSIGN <ls_employee>.
*    ENDIF.

*     Inserting a new record at index 2 using INSERT
*    INSERT VALUE #( name = 'Inserted Employee' email = 't100437@logali.com' )
*        INTO lt_employees INDEX 2 ASSIGNING <ls_employee>.
*    IF <ls_employee> IS ASSIGNED.
*      out->write( |Inserted Employee: { <ls_employee>-name }| ).
*      UNASSIGN <ls_employee>.
*    ENDIF.

*     Reading and modifying a record
*    READ TABLE lt_employees ASSIGNING <ls_employee> INDEX 1.
*    IF <ls_employee> IS ASSIGNED.
*      <ls_employee>-name = 'Updated Name'.
*      <ls_employee>-email = 't100437@logali.com'.
*      out->write( |Updated Employee: { <ls_employee>-name }| ).
*    ENDIF.

*     Implicit casting of date type to a field symbol
    FIELD-SYMBOLS: <lv_date>  TYPE d,
                   <lv_date2> TYPE any,
                   <lv_date3> TYPE n.

    lv_date = cl_abap_context_info=>get_system_date( ).
    ASSIGN lv_date TO <lv_date>.
    out->write( |Today's Date: { <lv_date> }| ).

    ASSIGN lv_date TO <lv_date2> CASTING TYPE ty_date.

    DO.

      ASSIGN COMPONENT sy-index OF STRUCTURE <lv_date2> TO <lv_date3>.

      IF sy-subrc <> 0.

        EXIT.

      ENDIF.

      out->write( |Today's Date: { <lv_date3> }| ).

    ENDDO.


*    out->write( |Today's Date: { <lv_date2> }| ).

  ENDMETHOD.

ENDCLASS.
