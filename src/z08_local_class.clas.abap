CLASS z08_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z08_local_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA connection TYPE REF TO lcl_connection.
  DATA connections TYPE TABLE OF REF TO lcl_connection.

  connection = new #( ).
  connection = new #( ).
* In the example above, the address of lcl_connection (2) overwrites the address of lcl_connection (1).
* Consequently, there is no longer a reference variable in the program pointing to lcl_connection (1).
* When this happens to an instance, it can no longer be addressed from the program.
* the garbage collector will destroy all of the instances to which they had pointed.
* You do not have to worry about resource management in the program yourself.
  connection->carrier_id    = 'LH'.
  connection->connection_id = '0400'.
  APPEND connection TO connections.

    connection = NEW #(  ).

    connection->carrier_id    = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection TO connections.

    connection = NEW #(  ).

    connection->carrier_id    = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.
  ENDMETHOD.
ENDCLASS.
