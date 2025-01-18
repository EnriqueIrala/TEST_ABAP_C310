CLASS zcl_itab_log_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: ty_flights TYPE STANDARD TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id name.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      access1 CHANGING ct_flights TYPE ty_flights,
      access2 CHANGING ct_flights TYPE ty_flights.
ENDCLASS.



CLASS zcl_itab_log_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: ty_flights TYPE STANDARD TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id name.

    DATA: lt_flights TYPE ty_flights.

    SELECT FROM /dmo/airport
    FIELDS *
    INTO TABLE @lt_flights.

    me->access1(
      CHANGING
        ct_flights = lt_flights
    ).

    me->access2(
      CHANGING
        ct_flights = lt_flights
    ).

  ENDMETHOD.

  METHOD access1.

    LOOP AT ct_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
      <fs_flights>-country = 'CO'.
    ENDLOOP.

  ENDMETHOD.

  METHOD access2.

    LOOP AT ct_flights INTO DATA(ls_flights).
      ls_flights-country = 'CO'.
      MODIFY ct_flights FROM ls_flights.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
