CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
  CLASS-DATA conn_counter TYPE i READ-ONLY.

  METHODS constructor
  importing
  i_carrier_id type /dmo/carrier_id DEFAULT 'LH'
  i_connection_id type /dmo/connection_id
  RAISING cx_abap_invalid_value.

   METHODS get_output "Get Method
      RETURNING VALUE(r_output) TYPE string_table.
  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.
method constructor.
  " Implementation code goes here
  me->carrier_id = i_carrier_id.
  me->connection_id = i_connection_id.
  conn_counter = conn_counter + 1.
ENDMETHOD.

  METHOD get_output.

    APPEND |------------------------------| TO r_output.
    APPEND |Carrier:     { carrier_id    }| TO r_output.
    APPEND |Connection:  { connection_id }| TO r_output.

  ENDMETHOD.
ENDCLASS.
