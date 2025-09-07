CLASS z07_simple_internal_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  CONSTANTS max_count TYPE i VALUE 5.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z07_simple_internal_tables IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

    " Use the class constant
    out->write( |Count is: { max_count }| ).
 DATA numbers TYPE TABLE OF i.
 DATA output TYPE TABLE OF string.
  " Fill the internal table with Fibonacci numbers
DO max_count TIMES.
    out->write( sy-index ).
 CASE sy-index.
      WHEN 1.
        APPEND 0 TO numbers.
      WHEN 2.
        APPEND 1 TO numbers.
      WHEN OTHERS.
          APPEND numbers[  sy-index - 2 ]
               + numbers[  sy-index - 1 ]
              TO numbers.
   ENDCASE.
  ENDDO.

  DATA(counter) = 0.

  LOOP AT numbers INTO DATA(number).

     counter = counter + 1.

     APPEND |{ counter WIDTH = 4 }: { number WIDTH = 10 ALIGN = RIGHT }|
         TO output.
out->write(
         data   = output
         name   = |The first { max_count } Fibonacci Numbers|
           ) .

  ENDLOOP.
ENDMETHOD.
ENDCLASS.
