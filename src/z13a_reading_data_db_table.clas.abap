CLASS z13a_reading_data_db_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z13a_reading_data_db_table IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
out->write( 'Reading data from a database table1' ).

Data connection TYPE REF TO lcl_connection.
Data connections TYPE STANDARD TABLE OF REF TO lcl_connection.

TRY. "1st TRY
    connection = NEW #(
                        i_carrier_id    = 'UA'
                        i_connection_id = '0058'
                        i_airport_from_id = 'SFO'
                        i_airport_to_id = 'RFA'
                      ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
ENDTRY.

TRY. "2nd TRY
    connection = NEW #(
                        i_carrier_id    = 'UA'
                        i_connection_id = '0059'
                        i_airport_from_id = 'RFA'
                        i_airport_to_id = 'SFO'
                      ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
ENDTRY.


 LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.
        out->write( `Executed` ).

ENDMETHOD.
ENDCLASS.
