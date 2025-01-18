CLASS zcl_constructor_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_constructor_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* CAST

    TYPES: BEGIN OF t_struct,
             col1 TYPE i,
             col2 TYPE i,
           END OF t_struct.

    DATA: lo_data TYPE REF TO data,
          ls_int  TYPE t_struct.


    lo_data = NEW t_struct( ).

    ls_int = CAST t_struct( lo_data )->*.

    out->write( ls_int ).

    out->write( cl_abap_char_utilities=>newline ).

    CAST t_struct( lo_data )->* = ls_int.




* REDUCE

    DATA: numbers TYPE TABLE OF i,
          sum     TYPE i.

    numbers = VALUE #( ( 1 ) ( 2 ) ( 3 ) ).

    sum = REDUCE #( INIT x = 0
                    FOR n IN numbers
                    NEXT x = x + n ).

    out->write( sum ).

    out->write( cl_abap_char_utilities=>newline ).



* CORRESPONDING

    TYPES: BEGIN OF ty_old,
             name TYPE string,
             age  TYPE i,
           END OF ty_old.

    TYPES: BEGIN OF ty_new,
             name    TYPE string,
             age     TYPE i,
             address TYPE string,
           END OF ty_new.

    DATA: old_data TYPE ty_old.
*          new_data TYPE ty_new.

    old_data = VALUE #( name = 'Alice' age = 25 ).

    DATA(new_data) = CORRESPONDING ty_new( old_data ).

    out->write( old_data ).

    out->write( new_data ).

    out->write( cl_abap_char_utilities=>newline ).

* REF

    DATA: lv_num  TYPE i,
          ref_num TYPE REF TO i.

    lv_num = 200.

    ref_num = REF #( lv_num ). " Crear una referencia al valor de num

    out->write( ref_num->* ). " Acceder al valor referenciado

    out->write( cl_abap_char_utilities=>newline ).


* CONV

    DATA: text TYPE string,
          num  TYPE i.

    num = 100.

    text = CONV string( num ).

    out->write( text ).



* NEW
    DATA(lo_class) = NEW zcl_constructor_log_c310( ).

    DATA: lo_class2 TYPE REF TO zcl_constructor_log_c310.

    lo_class2 = NEW #( ).


* VALUE
    TYPES: BEGIN OF ty_employee,
             name   TYPE string,
             age    TYPE i,
             salary TYPE p LENGTH 7 DECIMALS 2,
           END OF ty_employee.

    DATA: ls_employee TYPE ty_employee.

    ls_employee = VALUE #( name = 'John Doe'
                            age = 30
                         salary = 5000 ).

    out->write( ls_employee ).


    TYPES: BEGIN OF ty_order,
             order_id   TYPE string,
             order_date TYPE d,
           END OF ty_order.

    DATA: lt_orders TYPE TABLE OF ty_order.

    lt_orders = VALUE #( ( order_id = 'A100' order_date = '20240101' )
                         ( order_id = 'A101' order_date = '20240102' ) ).

    out->write( lt_orders ).




  ENDMETHOD.

ENDCLASS.
