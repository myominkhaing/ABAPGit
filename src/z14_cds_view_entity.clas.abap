CLASS z14_cds_view_entity DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z14_cds_view_entity IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'CDS VIEW ENTITY' ).

    Data connection TYPE REF TO lcl_connection.
    Data connections TYPE STANDARD TABLE OF REF TO lcl_connection.

TRY. "1st TRY
" Create a connection instance
    connection = NEW #(

                       i_carrier_id    = 'LH'
                       i_connection_id = '0401'
                       i_airport_from_id = 'JFK'
                       i_airport_to_id = 'FRA'
                       i_carrier_name = 'Deutsche Lufthansa AG'
                       ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
ENDTRY.

TRY. "2nd TRY
    connection = NEW #(

                       i_carrier_id    = 'LH'
                       i_connection_id = '0400'
                       i_airport_from_id = 'FRA'
                       i_airport_to_id = 'JFK'
                       i_carrier_name = 'Deutsche Lufthansa AG'
                       ).
           APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
ENDTRY.
    " Get output as string table
 LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

    " Print to console
           out->write( `End Executed` ).

  ENDMETHOD.
ENDCLASS.
