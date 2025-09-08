*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition create public.

     public section.
     DATA carrier_id    TYPE /dmo/carrier_id.
     DATA connection_id TYPE /dmo/connection_id.
     CLASS-DATA conn_counter TYPE i.
    METHODS set_attributes
      IMPORTING
      i_carrier_id TYPE /dmo/carrier_id OPTIONAL
      i_connection_id TYPE /dmo/connection_id.

      METHODS get_attributes
      Exporting e_carrier_id TYPE /dmo/carrier_id
                e_connection_id TYPE /dmo/connection_id.

      protected section.
      private section.

endclass.

class lcl_connection implementation.
METHOD set_attributes.
    IF i_carrier_id IS  INITIAL or i_connection_id IS  INITIAL.
    RAISE EXCEPTION TYPE cx_abap_invalid_value.
      ENDIF.
    conn_counter = conn_counter + 1.
    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
ENDMETHOD.
METHOD get_attributes.
    e_carrier_id = carrier_id.
    e_connection_id = connection_id.
ENDMETHOD.
endclass.

class lcl_connection1 definition create public.
ENDCLASS.

class lcl_connection1 implementation.
ENDCLASS.
