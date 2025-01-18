CLASS zcl_inter_excep_c310 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_inter_excep_c310 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    SELECT FROM /dmo/flight AS f
*     INNER JOIN /dmo/carrier AS c ON c~carrier_id = f~carrier_id
*    FIELDS f~carrier_id, c~name
*
*    INTERSECT
*
*    SELECT FROM /dmo/carrier
*         FIELDS carrier_id, name
*
*    ORDER BY carrier_id ASCENDING, name
*
*    INTO TABLE @DATA(lt_final).
*
*    IF sy-subrc = 0.
*      out->write( lt_final ).
*    ENDIF.

    SELECT FROM /dmo/carrier
         FIELDS carrier_id, name

    EXCEPT

    SELECT FROM /dmo/flight AS f
     INNER JOIN /dmo/carrier AS c ON c~carrier_id = f~carrier_id
    FIELDS f~carrier_id, c~name

    ORDER BY carrier_id ASCENDING, name

    INTO TABLE @DATA(lt_final2).

    IF sy-subrc = 0.
      out->write( lt_final2 ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
