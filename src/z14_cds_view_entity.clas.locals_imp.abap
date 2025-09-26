*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.
PUBLIC SECTION.
    DATA carrier_id      TYPE /dmo/carrier_id.
    DATA connection_id   TYPE /dmo/connection_id.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.

    DATA carrier_name    TYPE /dmo/carrier_name.

    METHODS get_output "Get Method Definition
        RETURNING VALUE(r_output) type string_table.

     METHODS constructor
      importing "IMPORTING
      i_carrier_id type /dmo/carrier_id DEFAULT 'LH'
      i_connection_id type /dmo/connection_id
      i_airport_from_id TYPE /dmo/airport_from_id
      i_airport_to_id   TYPE /dmo/airport_to_id
      i_carrier_name type /dmo/carrier_name
      RAISING cx_abap_invalid_value.

ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.

method constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE
      FROM /DMO/I_Connection
    FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport, \_Airline-Name
     WHERE AirlineID    = @i_carrier_id
       AND ConnectionID = @i_connection_id
      INTO (  @carrier_id, @connection_id, @airport_from_id, @airport_to_id, @carrier_name  ).

      IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
      ENDIF.

ENDMETHOD.

METHOD get_output. "implementation of the method get_output
    APPEND |--------------------------------| TO r_output.
    APPEND |Carrier:     { carrier_id      }| TO r_output.
    APPEND |Connection:  { connection_id   }| TO r_output.
    APPEND |Airport_From:{ airport_from_id }| TO r_output.
    APPEND |Airport_To:  { airport_to_id   }| TO r_output.
    APPEND |Carrier_name:{ carrier_name    }| TO r_output.
ENDMETHOD.

ENDCLASS.
