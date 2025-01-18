CLASS zcl_secondary_key_lgl_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    METHODS:
      constructor,
      read_primary,
      read_non_key,
      read_secondary1,
      read_secondary2,
      read_secondary3.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: lt_sort    TYPE SORTED TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date, "PK
          lt_sort_sk TYPE SORTED TABLE OF /dmo/booking_m WITH NON-UNIQUE KEY travel_id booking_id booking_date
                     WITH NON-UNIQUE SORTED KEY sk_carrier COMPONENTS carrier_id.

ENDCLASS.



CLASS zcl_secondary_key_lgl_c310 IMPLEMENTATION.
  METHOD constructor.

    SELECT FROM /dmo/booking_m
      FIELDS *
      INTO TABLE @lt_sort.

    SELECT FROM /dmo/booking_m
    FIELDS *
    INTO TABLE @lt_sort_sk.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_object) = NEW zcl_secondary_key_lgl_c310( ).

    lo_object->read_non_key( ).
    lo_object->read_primary( ).
    lo_object->read_secondary1( ).
    lo_object->read_secondary2( ).
    lo_object->read_secondary3( ).

    out->write( 'ok' ).

  ENDMETHOD.

  METHOD read_non_key.

    DATA(ls_flight) = lt_sort[ flight_date = '20240812' ].

  ENDMETHOD.

  METHOD read_primary.

    DATA(ls_flight) = lt_sort[ travel_id = '00000013'
                               booking_id = '0003'
                               booking_date = '20240730' ].

  ENDMETHOD.

  METHOD read_secondary1.

    DATA(ls_sec_1) = lt_sort_sk[ KEY sk_carrier carrier_id = 'AA' ].

  ENDMETHOD.

  METHOD read_secondary2.

    DATA(ls_sec_2) = lt_sort_sk[ KEY sk_carrier carrier_id = 'AA' ].

  ENDMETHOD.

  METHOD read_secondary3.

    DATA(ls_sec_3) = lt_sort_sk[ KEY sk_carrier carrier_id = 'AA' ].

  ENDMETHOD.

ENDCLASS.
