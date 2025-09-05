CLASS z_helloworld_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_helloworld_class IMPLEMENTATION.
method if_oo_adt_classrun~main.
out->write( 'hello world :  ABAP ' ).
endmethod.
ENDCLASS.
