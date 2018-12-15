
--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/hls_pkgs/src/funcs.vhd 

-- a package of attributes that give verification tools a hint about
-- the function being implemented
PACKAGE attributes IS
  ATTRIBUTE CALYPTO_FUNC : string;
  ATTRIBUTE CALYPTO_DATA_ORDER : string;
end attributes;

-----------------------------------------------------------------------
-- Package that declares synthesizable functions needed for RTL output
-----------------------------------------------------------------------

LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

PACKAGE funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC;
   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

   FUNCTION maximum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION minimum(arg1, arg2 : INTEGER) RETURN INTEGER;
   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER;
   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2 : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
   
-----------------------------------------------------------------
-- logic functions
-----------------------------------------------------------------

   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION or_v (inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;
   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- mux functions
-----------------------------------------------------------------

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC       ) RETURN STD_LOGIC_VECTOR;
   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- latch functions
-----------------------------------------------------------------
   FUNCTION lat_s(dinput: STD_LOGIC       ; clk: STD_LOGIC; doutput: STD_LOGIC       ) RETURN STD_LOGIC;
   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- tristate functions
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC       ; control: STD_LOGIC) RETURN STD_LOGIC;
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION "<" (l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">="(l, r: SIGNED  ) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC;
   FUNCTION ">" (l, r: SIGNED  ) RETURN STD_LOGIC;

   -- RETURN 2 bits (left => lt, right => eq)
   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED;
 
   FUNCTION fabs(arg1: SIGNED  ) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED;
   FUNCTION "**" (l, r: UNSIGNED) RETURN UNSIGNED;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  ;
   FUNCTION "**" (l, r: SIGNED  ) RETURN SIGNED  ;

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-- *_stdar functions use shift functions from std_logic_arith
-----------------------------------------------------------------

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR;

   -----------------------------------------------------------------
   -- *_stdar functions use shift functions from std_logic_arith
   -----------------------------------------------------------------
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED  ;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC;
   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE;
   --FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR;
   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR ;

   FUNCTION ceil_log2(size : NATURAL) return NATURAL;
   FUNCTION bits(size : NATURAL) return NATURAL;    

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR);
   
END funcs;


--------------------------- B O D Y ----------------------------


PACKAGE BODY funcs IS

-----------------------------------------------------------------
-- utility functions
-----------------------------------------------------------------

   FUNCTION TO_STDLOGIC(arg1: BOOLEAN) RETURN STD_LOGIC IS
     BEGIN IF arg1 THEN RETURN '1'; ELSE RETURN '0'; END IF; END;
--   FUNCTION TO_STDLOGIC(arg1: STD_ULOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
--     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: STD_LOGIC_VECTOR(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;
   FUNCTION TO_STDLOGIC(arg1: SIGNED(0 DOWNTO 0)) RETURN STD_LOGIC IS
     BEGIN RETURN arg1(0); END;

   FUNCTION TO_STDLOGICVECTOR(arg1: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
     VARIABLE result: STD_LOGIC_VECTOR(0 DOWNTO 0);
   BEGIN
     result := (0 => arg1);
     RETURN result;
   END;

   FUNCTION maximum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 > arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION minimum (arg1,arg2: INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 < arg2) THEN
       RETURN(arg1) ;
     ELSE
       RETURN(arg2) ;
     END IF;
   END;

   FUNCTION ifeqsel(arg1, arg2, seleq, selne : INTEGER) RETURN INTEGER IS
   BEGIN
     IF(arg1 = arg2) THEN
       RETURN(seleq) ;
     ELSE
       RETURN(selne) ;
     END IF;
   END;

   FUNCTION resolve_std_logic_vector(input1: STD_LOGIC_VECTOR; input2: STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := input1'LENGTH;
     ALIAS input1a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input1;
     ALIAS input2a: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS input2;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     --synopsys translate_off
     FOR i IN len-1 DOWNTO 0 LOOP
       result(i) := resolved(input1a(i) & input2a(i));
     END LOOP;
     --synopsys translate_on
     RETURN result;
   END;

   FUNCTION resolve_unsigned(input1: UNSIGNED; input2: UNSIGNED) RETURN UNSIGNED IS
   BEGIN RETURN UNSIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

   FUNCTION resolve_signed(input1: SIGNED; input2: SIGNED) RETURN SIGNED IS
   BEGIN RETURN SIGNED(resolve_std_logic_vector(STD_LOGIC_VECTOR(input1), STD_LOGIC_VECTOR(input2))); END;

-----------------------------------------------------------------
-- Logic Functions
-----------------------------------------------------------------

   FUNCTION "not"(arg1: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN UNSIGNED(not STD_LOGIC_VECTOR(arg1)); END;
   FUNCTION and_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(and_v(inputs, 1)); END;
   FUNCTION or_s (inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(or_v(inputs, 1)); END;
   FUNCTION xor_s(inputs: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
     BEGIN RETURN TO_STDLOGIC(xor_v(inputs, 1)); END;

   FUNCTION and_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result AND inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

   FUNCTION or_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     -- this if is added as a quick fix for a bug in catapult evaluating the loop even if inputs'LENGTH==1
     -- see dts0100971279
     IF icnt2 > 1 THEN
       FOR i IN icnt2-1 DOWNTO 1 LOOP
         inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
         result := result OR inputsx(olenM1 DOWNTO 0);
       END LOOP;
     END IF;
     RETURN result;
   END;

   FUNCTION xor_v(inputs: STD_LOGIC_VECTOR; olen: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT ilen: POSITIVE := inputs'LENGTH;
     CONSTANT ilenM1: POSITIVE := ilen-1; --2.1.6.3
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT ilenMolenM1: INTEGER := ilen-olen-1; --2.1.6.3
     VARIABLE inputsx: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0);
     CONSTANT icnt2: POSITIVE:= inputs'LENGTH/olen;
     VARIABLE result: STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT ilen REM olen = 0 SEVERITY FAILURE;
     --synopsys translate_on
     inputsx := inputs;
     result := inputsx(olenM1 DOWNTO 0);
     FOR i IN icnt2-1 DOWNTO 1 LOOP
       inputsx(ilenMolenM1 DOWNTO 0) := inputsx(ilenM1 DOWNTO olen);
       result := result XOR inputsx(olenM1 DOWNTO 0);
     END LOOP;
     RETURN result;
   END;

-----------------------------------------------------------------
-- Muxes
-----------------------------------------------------------------
   
   FUNCTION mux_sel2_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(1 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 4;
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector( size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "01" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "10" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "11" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel3_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(2 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 8;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000" =>
       result := inputs0(1*size-1 DOWNTO 0*size);
     WHEN "001" =>
       result := inputs0(2*size-1 DOWNTO 1*size);
     WHEN "010" =>
       result := inputs0(3*size-1 DOWNTO 2*size);
     WHEN "011" =>
       result := inputs0(4*size-1 DOWNTO 3*size);
     WHEN "100" =>
       result := inputs0(5*size-1 DOWNTO 4*size);
     WHEN "101" =>
       result := inputs0(6*size-1 DOWNTO 5*size);
     WHEN "110" =>
       result := inputs0(7*size-1 DOWNTO 6*size);
     WHEN "111" =>
       result := inputs0(8*size-1 DOWNTO 7*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel4_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(3 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 16;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "0000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "0001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "0010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "0011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "0100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "0101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "0110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "0111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "1000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "1001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "1010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "1011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "1100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "1101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "1110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "1111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel5_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(4 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 32;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0 );
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "00000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "00001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "00010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "00011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "00100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "00101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "00110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "00111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "01000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "01001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "01010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "01011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "01100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "01101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "01110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "01111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "10000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "10001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "10010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "10011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "10100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "10101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "10110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "10111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "11000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "11001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "11010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "11011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "11100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "11101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "11110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "11111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;
   
   FUNCTION mux_sel6_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR(5 DOWNTO 0))
   RETURN STD_LOGIC_VECTOR IS
     CONSTANT size   : POSITIVE := inputs'LENGTH / 64;
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     VARIABLE result : STD_LOGIC_Vector(size-1 DOWNTO 0);
   BEGIN
     -- for synthesis only
     -- simulation inconsistent with control values 'UXZHLWD'
     CASE sel IS
     WHEN "000000" =>
       result := inputs0( 1*size-1 DOWNTO 0*size);
     WHEN "000001" =>
       result := inputs0( 2*size-1 DOWNTO 1*size);
     WHEN "000010" =>
       result := inputs0( 3*size-1 DOWNTO 2*size);
     WHEN "000011" =>
       result := inputs0( 4*size-1 DOWNTO 3*size);
     WHEN "000100" =>
       result := inputs0( 5*size-1 DOWNTO 4*size);
     WHEN "000101" =>
       result := inputs0( 6*size-1 DOWNTO 5*size);
     WHEN "000110" =>
       result := inputs0( 7*size-1 DOWNTO 6*size);
     WHEN "000111" =>
       result := inputs0( 8*size-1 DOWNTO 7*size);
     WHEN "001000" =>
       result := inputs0( 9*size-1 DOWNTO 8*size);
     WHEN "001001" =>
       result := inputs0( 10*size-1 DOWNTO 9*size);
     WHEN "001010" =>
       result := inputs0( 11*size-1 DOWNTO 10*size);
     WHEN "001011" =>
       result := inputs0( 12*size-1 DOWNTO 11*size);
     WHEN "001100" =>
       result := inputs0( 13*size-1 DOWNTO 12*size);
     WHEN "001101" =>
       result := inputs0( 14*size-1 DOWNTO 13*size);
     WHEN "001110" =>
       result := inputs0( 15*size-1 DOWNTO 14*size);
     WHEN "001111" =>
       result := inputs0( 16*size-1 DOWNTO 15*size);
     WHEN "010000" =>
       result := inputs0( 17*size-1 DOWNTO 16*size);
     WHEN "010001" =>
       result := inputs0( 18*size-1 DOWNTO 17*size);
     WHEN "010010" =>
       result := inputs0( 19*size-1 DOWNTO 18*size);
     WHEN "010011" =>
       result := inputs0( 20*size-1 DOWNTO 19*size);
     WHEN "010100" =>
       result := inputs0( 21*size-1 DOWNTO 20*size);
     WHEN "010101" =>
       result := inputs0( 22*size-1 DOWNTO 21*size);
     WHEN "010110" =>
       result := inputs0( 23*size-1 DOWNTO 22*size);
     WHEN "010111" =>
       result := inputs0( 24*size-1 DOWNTO 23*size);
     WHEN "011000" =>
       result := inputs0( 25*size-1 DOWNTO 24*size);
     WHEN "011001" =>
       result := inputs0( 26*size-1 DOWNTO 25*size);
     WHEN "011010" =>
       result := inputs0( 27*size-1 DOWNTO 26*size);
     WHEN "011011" =>
       result := inputs0( 28*size-1 DOWNTO 27*size);
     WHEN "011100" =>
       result := inputs0( 29*size-1 DOWNTO 28*size);
     WHEN "011101" =>
       result := inputs0( 30*size-1 DOWNTO 29*size);
     WHEN "011110" =>
       result := inputs0( 31*size-1 DOWNTO 30*size);
     WHEN "011111" =>
       result := inputs0( 32*size-1 DOWNTO 31*size);
     WHEN "100000" =>
       result := inputs0( 33*size-1 DOWNTO 32*size);
     WHEN "100001" =>
       result := inputs0( 34*size-1 DOWNTO 33*size);
     WHEN "100010" =>
       result := inputs0( 35*size-1 DOWNTO 34*size);
     WHEN "100011" =>
       result := inputs0( 36*size-1 DOWNTO 35*size);
     WHEN "100100" =>
       result := inputs0( 37*size-1 DOWNTO 36*size);
     WHEN "100101" =>
       result := inputs0( 38*size-1 DOWNTO 37*size);
     WHEN "100110" =>
       result := inputs0( 39*size-1 DOWNTO 38*size);
     WHEN "100111" =>
       result := inputs0( 40*size-1 DOWNTO 39*size);
     WHEN "101000" =>
       result := inputs0( 41*size-1 DOWNTO 40*size);
     WHEN "101001" =>
       result := inputs0( 42*size-1 DOWNTO 41*size);
     WHEN "101010" =>
       result := inputs0( 43*size-1 DOWNTO 42*size);
     WHEN "101011" =>
       result := inputs0( 44*size-1 DOWNTO 43*size);
     WHEN "101100" =>
       result := inputs0( 45*size-1 DOWNTO 44*size);
     WHEN "101101" =>
       result := inputs0( 46*size-1 DOWNTO 45*size);
     WHEN "101110" =>
       result := inputs0( 47*size-1 DOWNTO 46*size);
     WHEN "101111" =>
       result := inputs0( 48*size-1 DOWNTO 47*size);
     WHEN "110000" =>
       result := inputs0( 49*size-1 DOWNTO 48*size);
     WHEN "110001" =>
       result := inputs0( 50*size-1 DOWNTO 49*size);
     WHEN "110010" =>
       result := inputs0( 51*size-1 DOWNTO 50*size);
     WHEN "110011" =>
       result := inputs0( 52*size-1 DOWNTO 51*size);
     WHEN "110100" =>
       result := inputs0( 53*size-1 DOWNTO 52*size);
     WHEN "110101" =>
       result := inputs0( 54*size-1 DOWNTO 53*size);
     WHEN "110110" =>
       result := inputs0( 55*size-1 DOWNTO 54*size);
     WHEN "110111" =>
       result := inputs0( 56*size-1 DOWNTO 55*size);
     WHEN "111000" =>
       result := inputs0( 57*size-1 DOWNTO 56*size);
     WHEN "111001" =>
       result := inputs0( 58*size-1 DOWNTO 57*size);
     WHEN "111010" =>
       result := inputs0( 59*size-1 DOWNTO 58*size);
     WHEN "111011" =>
       result := inputs0( 60*size-1 DOWNTO 59*size);
     WHEN "111100" =>
       result := inputs0( 61*size-1 DOWNTO 60*size);
     WHEN "111101" =>
       result := inputs0( 62*size-1 DOWNTO 61*size);
     WHEN "111110" =>
       result := inputs0( 63*size-1 DOWNTO 62*size);
     WHEN "111111" =>
       result := inputs0( 64*size-1 DOWNTO 63*size);
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_s(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN RETURN TO_STDLOGIC(mux_v(inputs, sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS  --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR(inputs'LENGTH-1 DOWNTO 0) IS inputs;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2 SEVERITY FAILURE;
     --synopsys translate_on
       CASE sel IS
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0( size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1  DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0(size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
       RETURN result;
   END;
--   BEGIN RETURN mux_v(inputs, TO_STDLOGICVECTOR(sel)); END;

   FUNCTION mux_v(inputs: STD_LOGIC_VECTOR; sel : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS --pragma hls_map_to_operator mux
     ALIAS    inputs0: STD_LOGIC_VECTOR( inputs'LENGTH-1 DOWNTO 0) IS inputs;
     ALIAS    sel0   : STD_LOGIC_VECTOR( sel'LENGTH-1 DOWNTO 0 ) IS sel;

     VARIABLE sellen : INTEGER RANGE 2-sel'LENGTH TO sel'LENGTH;
     CONSTANT size   : POSITIVE := inputs'LENGTH / 2;
     CONSTANT olen   : POSITIVE := inputs'LENGTH / 2**sel'LENGTH;
     VARIABLE result : STD_LOGIC_VECTOR(olen-1 DOWNTO 0);
     TYPE inputs_array_type is array(natural range <>) of std_logic_vector( olen - 1 DOWNTO 0);
     VARIABLE inputs_array : inputs_array_type( 2**sel'LENGTH - 1 DOWNTO 0);
   BEGIN
     sellen := sel'LENGTH;
     --synopsys translate_off
     ASSERT inputs'LENGTH = olen * 2**sellen SEVERITY FAILURE;
     sellen := 2-sellen;
     --synopsys translate_on
     CASE sellen IS
     WHEN 1 =>
       CASE sel0(0) IS

       WHEN '1' 
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
            =>
         result := inputs0(  size-1 DOWNTO 0);
       WHEN '0' 
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
            =>
         result := inputs0(2*size-1 DOWNTO size);
       WHEN others =>
         --synopsys translate_off
         result := resolve_std_logic_vector(inputs0( size-1 DOWNTO 0), inputs0( 2*size-1 DOWNTO size));
         --synopsys translate_on
       END CASE;
     WHEN 2 =>
       result := mux_sel2_v(inputs, not sel);
     WHEN 3 =>
       result := mux_sel3_v(inputs, not sel);
     WHEN 4 =>
       result := mux_sel4_v(inputs, not sel);
     WHEN 5 =>
       result := mux_sel5_v(inputs, not sel);
     WHEN 6 =>
       result := mux_sel6_v(inputs, not sel);
     WHEN others =>
       -- synopsys translate_off
       IF(Is_X(sel0)) THEN
         result := (others => 'X');
       ELSE
       -- synopsys translate_on
         FOR i in 0 to 2**sel'LENGTH - 1 LOOP
           inputs_array(i) := inputs0( ((i + 1) * olen) - 1  DOWNTO i*olen);
         END LOOP;
         result := inputs_array(CONV_INTEGER( (UNSIGNED(NOT sel0)) ));
       -- synopsys translate_off
       END IF;
       -- synopsys translate_on
     END CASE;
     RETURN result;
   END;

 
-----------------------------------------------------------------
-- Latches
-----------------------------------------------------------------

   FUNCTION lat_s(dinput: STD_LOGIC; clk: STD_LOGIC; doutput: STD_LOGIC) RETURN STD_LOGIC IS
   BEGIN RETURN mux_s(STD_LOGIC_VECTOR'(doutput & dinput), clk); END;

   FUNCTION lat_v(dinput: STD_LOGIC_VECTOR ; clk: STD_LOGIC; doutput: STD_LOGIC_VECTOR ) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     --synopsys translate_off
     ASSERT dinput'LENGTH = doutput'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN mux_v(doutput & dinput, clk);
   END;

-----------------------------------------------------------------
-- Tri-States
-----------------------------------------------------------------
--   FUNCTION tri_s(dinput: STD_LOGIC; control: STD_LOGIC) RETURN STD_LOGIC IS
--   BEGIN RETURN TO_STDLOGIC(tri_v(TO_STDLOGICVECTOR(dinput), control)); END;
--
--   FUNCTION tri_v(dinput: STD_LOGIC_VECTOR ; control: STD_LOGIC) RETURN STD_LOGIC_VECTOR IS
--     VARIABLE result: STD_LOGIC_VECTOR(dinput'range);
--   BEGIN
--     CASE control IS
--     WHEN '0' | 'L' =>
--       result := (others => 'Z');
--     WHEN '1' | 'H' =>
--       FOR i IN dinput'range LOOP
--         result(i) := to_UX01(dinput(i));
--       END LOOP;
--     WHEN others =>
--       -- synopsys translate_off
--       result := (others => 'X');
--       -- synopsys translate_on
--     END CASE;
--     RETURN result;
--   END;

-----------------------------------------------------------------
-- compare functions returning STD_LOGIC
-- in contrast to the functions returning boolean
-----------------------------------------------------------------

   FUNCTION "=" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;
   FUNCTION "/="(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN or_s(STD_LOGIC_VECTOR(l) xor STD_LOGIC_VECTOR(r)); END;

   FUNCTION "<" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     VARIABLE diff: UNSIGNED(l'LENGTH DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     diff := ('0'&l) - ('0'&r);
     RETURN diff(l'LENGTH);
   END;
   FUNCTION "<"(l, r: SIGNED  ) RETURN STD_LOGIC IS
   BEGIN
     RETURN (UNSIGNED(l) < UNSIGNED(r)) xor (l(l'LEFT) xor r(r'LEFT));
   END;

   FUNCTION "<="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION "<=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(r < l); END;
   FUNCTION ">" (l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">"(l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN r < l; END;
   FUNCTION ">="(l, r: UNSIGNED) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;
   FUNCTION ">=" (l, r: SIGNED  ) RETURN STD_LOGIC IS
     BEGIN RETURN not STD_LOGIC'(l < r); END;

   FUNCTION cmp (l, r: STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
   BEGIN
     --synopsys translate_off
     ASSERT l'LENGTH = r'LENGTH SEVERITY FAILURE;
     --synopsys translate_on
     RETURN not or_s(l xor r);
   END;

-----------------------------------------------------------------
-- Vectorized Overloaded Arithmetic Operators
-----------------------------------------------------------------

   --some functions to placate spyglass
   FUNCTION mult_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a*b;
   END mult_natural;

   FUNCTION div_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a/b;
   END div_natural;

   FUNCTION mod_natural(a,b : NATURAL) RETURN NATURAL IS
   BEGIN
     return a mod b;
   END mod_natural;

   FUNCTION add_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a+b;
   END add_unsigned;

   FUNCTION sub_unsigned(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a-b;
   END sub_unsigned;

   FUNCTION sub_int(a,b : INTEGER) RETURN INTEGER IS
   BEGIN
     return a-b;
   END sub_int;

   FUNCTION concat_0(b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return '0' & b;
   END concat_0;

   FUNCTION concat_uns(a,b : UNSIGNED) RETURN UNSIGNED IS
   BEGIN
     return a&b;
   END concat_uns;

   FUNCTION concat_vect(a,b : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
   BEGIN
     return a&b;
   END concat_vect;





   FUNCTION faccu(arg: UNSIGNED; width: NATURAL) RETURN UNSIGNED IS
     CONSTANT ninps : NATURAL := arg'LENGTH / width;
     ALIAS    arg0  : UNSIGNED(arg'LENGTH-1 DOWNTO 0) IS arg;
     VARIABLE result: UNSIGNED(width-1 DOWNTO 0);
     VARIABLE from  : INTEGER;
     VARIABLE dto   : INTEGER;
   BEGIN
     --synopsys translate_off
     ASSERT arg'LENGTH = width * ninps SEVERITY FAILURE;
     --synopsys translate_on
     result := (OTHERS => '0');
     FOR i IN ninps-1 DOWNTO 0 LOOP
       --result := result + arg0((i+1)*width-1 DOWNTO i*width);
       from := mult_natural((i+1), width)-1; --2.1.6.3
       dto  := mult_natural(i,width); --2.1.6.3
       result := add_unsigned(result , arg0(from DOWNTO dto) );
     END LOOP;
     RETURN result;
   END faccu;

   FUNCTION  fabs (arg1: SIGNED) RETURN UNSIGNED IS
   BEGIN
     CASE arg1(arg1'LEFT) IS
     WHEN '1'
     --synopsys translate_off
          | 'H'
     --synopsys translate_on
       =>
       RETURN UNSIGNED'("0") - UNSIGNED(arg1);
     WHEN '0'
     --synopsys translate_off
          | 'L'
     --synopsys translate_on
       =>
       RETURN UNSIGNED(arg1);
     WHEN others =>
       RETURN resolve_unsigned(UNSIGNED(arg1), UNSIGNED'("0") - UNSIGNED(arg1));
     END CASE;
   END;

   PROCEDURE divmod(l, r: UNSIGNED; rdiv, rmod: OUT UNSIGNED) IS
     CONSTANT llen: INTEGER := l'LENGTH;
     CONSTANT rlen: INTEGER := r'LENGTH;
     CONSTANT llen_plus_rlen: INTEGER := llen + rlen;
     VARIABLE lbuf: UNSIGNED(llen+rlen-1 DOWNTO 0);
     VARIABLE diff: UNSIGNED(rlen DOWNTO 0);
   BEGIN
     --synopsys translate_off
     ASSERT rdiv'LENGTH = llen AND rmod'LENGTH = rlen SEVERITY FAILURE;
     --synopsys translate_on
     lbuf := (others => '0');
     lbuf(llen-1 DOWNTO 0) := l;
     FOR i IN rdiv'range LOOP
       diff := sub_unsigned(lbuf(llen_plus_rlen-1 DOWNTO llen-1) ,(concat_0(r)));
       rdiv(i) := not diff(rlen);
       IF diff(rlen) = '0' THEN
         lbuf(llen_plus_rlen-1 DOWNTO llen-1) := diff;
       END IF;
       lbuf(llen_plus_rlen-1 DOWNTO 1) := lbuf(llen_plus_rlen-2 DOWNTO 0);
     END LOOP;
     rmod := lbuf(llen_plus_rlen-1 DOWNTO llen);
   END divmod;

   FUNCTION "/"  (l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rdiv;
   END "/";

   FUNCTION "MOD"(l, r: UNSIGNED) RETURN UNSIGNED IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(l, r, rdiv, rmod);
     RETURN rmod;
   END;

   FUNCTION "REM"(l, r: UNSIGNED) RETURN UNSIGNED IS
     BEGIN RETURN l MOD r; END;

   FUNCTION "/"  (l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rdiv := UNSIGNED'("0") - rdiv;
     END IF;
     RETURN SIGNED(rdiv); -- overflow problem "1000" / "11"
   END "/";

   FUNCTION "MOD"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
     CONSTANT rnul: UNSIGNED(r'LENGTH-1 DOWNTO 0) := (others => '0');
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     IF rmod /= rnul AND to_X01(l(l'LEFT)) /= to_X01(r(r'LEFT)) THEN
       rmod := UNSIGNED(r) + rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "MOD";

   FUNCTION "REM"(l, r: SIGNED  ) RETURN SIGNED  IS
     VARIABLE rdiv: UNSIGNED(l'LENGTH-1 DOWNTO 0);
     VARIABLE rmod: UNSIGNED(r'LENGTH-1 DOWNTO 0);
   BEGIN
     divmod(fabs(l), fabs(r), rdiv, rmod);
     IF to_X01(l(l'LEFT)) = '1' THEN
       rmod := UNSIGNED'("0") - rmod;
     END IF;
     RETURN SIGNED(rmod);
   END "REM";

   FUNCTION mult_unsigned(l,r : UNSIGNED) return UNSIGNED is
   BEGIN
     return l*r; 
   END mult_unsigned;

   FUNCTION "**" (l, r : UNSIGNED) RETURN UNSIGNED IS
     CONSTANT llen  : NATURAL := l'LENGTH;
     VARIABLE result: UNSIGNED(llen-1 DOWNTO 0);
     VARIABLE fak   : UNSIGNED(llen-1 DOWNTO 0);
   BEGIN
     fak := l;
     result := (others => '0'); result(0) := '1';
     FOR i IN r'reverse_range LOOP
       --was:result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(result & (result*fak)), r(i)));
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR( concat_uns(result , mult_unsigned(result,fak) )), r(i)));

       fak := mult_unsigned(fak , fak);
     END LOOP;
     RETURN result;
   END "**";

   FUNCTION "**" (l, r : SIGNED) RETURN SIGNED IS
     CONSTANT rlen  : NATURAL := r'LENGTH;
     ALIAS    r0    : SIGNED(0 TO r'LENGTH-1) IS r;
     VARIABLE result: SIGNED(l'range);
   BEGIN
     CASE r(r'LEFT) IS
     WHEN '0'
   --synopsys translate_off
          | 'L'
   --synopsys translate_on
     =>
       result := SIGNED(UNSIGNED(l) ** UNSIGNED(r0(1 TO r'LENGTH-1)));
     WHEN '1'
   --synopsys translate_off
          | 'H'
   --synopsys translate_on
     =>
       result := (others => '0');
     WHEN others =>
       result := (others => 'X');
     END CASE;
     RETURN result;
   END "**";

-----------------------------------------------------------------
--               S H I F T   F U C T I O N S
-- negative shift shifts the opposite direction
-----------------------------------------------------------------

   FUNCTION add_nat(arg1 : NATURAL; arg2 : NATURAL ) RETURN NATURAL IS
   BEGIN
     return (arg1 + arg2);
   END;
   
--   FUNCTION UNSIGNED_2_BIT_VECTOR(arg1 : NATURAL; arg2 : NATURAL ) RETURN BIT_VECTOR IS
--   BEGIN
--     return (arg1 + arg2);
--   END;
   
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shl(SIGNED(result), arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; -- 2.1.6.3
     CONSTANT ilenub: INTEGER := arg1'LENGTH-1;
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: SIGNED(len-1 DOWNTO 0);
   BEGIN
     result := (others => sbit);
     result(ilenub DOWNTO 0) := arg1;
     result := shr(result, arg2);
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
     --synopsys translate_off
            | 'L'
     --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
     --synopsys translate_off
            | 'H'
     --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: SIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: SIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr_stdar(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshl_stdar(arg1x, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr_stdar(arg1x_pad(arg1l+1 DOWNTO 1), '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
        =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
        =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr_stdar(arg1: SIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN SIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: SIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl_stdar(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);
       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_signed(
           fshr_stdar(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl_stdar(arg1 & '0', '0' & not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshl_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl_stdar(arg1, arg2, '0', olen); END;
   FUNCTION fshr_stdar(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr_stdar(arg1, arg2, '0', olen); END;

   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshl_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshl_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;
   FUNCTION fshr_stdar(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN fshr_stdar(arg1, arg2, arg1(arg1'LEFT), olen); END;


   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     --SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: NATURAL range 1 TO len;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => '0');
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         --was:temp(i2+sw) := result(i2);
         temp_idx := add_nat(i2,sw);
         temp(temp_idx) := result(i2);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT ilen: INTEGER := arg1'LENGTH;
     CONSTANT olenM1: INTEGER := olen-1; --2.1.6.3
     CONSTANT len: INTEGER := maximum(ilen, olen);
     VARIABLE result: UNSIGNED(len-1 DOWNTO 0);
     VARIABLE temp: UNSIGNED(len-1 DOWNTO 0);
     SUBTYPE  sw_range IS NATURAL range 1 TO len;
     VARIABLE sw: sw_range;
     VARIABLE result_idx : INTEGER; --2.1.6.3
   BEGIN
     sw := 1;
     result := (others => sbit);
     result(ilen-1 DOWNTO 0) := arg1;
     FOR i IN arg2'reverse_range LOOP
       temp := (others => sbit);
       FOR i2 IN len-1-sw DOWNTO 0 LOOP
         -- was: temp(i2) := result(i2+sw);
         result_idx := add_nat(i2,sw);
         temp(i2) := result(result_idx);
       END LOOP;
       result := UNSIGNED(mux_v(STD_LOGIC_VECTOR(concat_uns(result,temp)), arg2(i)));
       sw := minimum(mult_natural(sw,2), len);
     END LOOP;
     RETURN result(olenM1 DOWNTO 0);
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg1l: NATURAL := arg1'LENGTH - 1;
     ALIAS    arg1x: UNSIGNED(arg1l DOWNTO 0) IS arg1;
     CONSTANT arg2l: NATURAL := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE arg1x_pad: UNSIGNED(arg1l+1 DOWNTO 0);
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others=>'0');
     arg1x_pad(arg1l+1) := sbit;
     arg1x_pad(arg1l downto 0) := arg1x;
     IF arg2l = 0 THEN
       RETURN fshr(arg1x_pad, UNSIGNED(arg2x), sbit, olen);
     -- ELSIF arg1l = 0 THEN
     --   RETURN fshl(sbit & arg1x, arg2x, sbit, olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshl(arg1x_pad, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit,  olen),
           fshr(arg1x_pad(arg1l+1 DOWNTO 1), not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen)
         );
         --synopsys translate_on
         RETURN result;
       END CASE;
     END IF;
   END;

   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; sbit: STD_LOGIC; olen: POSITIVE) RETURN UNSIGNED IS
     CONSTANT arg2l: INTEGER := arg2'LENGTH - 1;
     ALIAS    arg2x: SIGNED(arg2l DOWNTO 0) IS arg2;
     VARIABLE result: UNSIGNED(olen-1 DOWNTO 0);
   BEGIN
     result := (others => '0');
     IF arg2l = 0 THEN
       RETURN fshl(arg1, UNSIGNED(arg2x), olen);
     ELSE
       CASE arg2x(arg2l) IS
       WHEN '0'
       --synopsys translate_off
            | 'L'
       --synopsys translate_on
       =>
         RETURN fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen);

       WHEN '1'
       --synopsys translate_off
            | 'H'
       --synopsys translate_on
       =>
         RETURN fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen);
       WHEN others =>
         --synopsys translate_off
         result := resolve_unsigned(
           fshr(arg1, UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), sbit, olen),
           fshl(arg1 & '0', not UNSIGNED(arg2x(arg2l-1 DOWNTO 0)), olen)
         );
         --synopsys translate_on
	 return result;
       END CASE;
     END IF;
   END;

   FUNCTION fshl(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: UNSIGNED; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;
   FUNCTION fshl(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshl(arg1, arg2, '0', olen); END;
   FUNCTION fshr(arg1: UNSIGNED; arg2: SIGNED  ; olen: POSITIVE) RETURN UNSIGNED IS
     BEGIN RETURN fshr(arg1, arg2, '0', olen); END;

   FUNCTION fshl(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: UNSIGNED; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshl(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshl(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;
   FUNCTION fshr(arg1: SIGNED  ; arg2: SIGNED  ; olen: POSITIVE) RETURN SIGNED   IS
     BEGIN RETURN SIGNED(fshr(UNSIGNED(arg1), arg2, arg1(arg1'LEFT), olen)); END;


   FUNCTION frot(arg1: STD_LOGIC_VECTOR; arg2: STD_LOGIC_VECTOR; signd2: BOOLEAN; sdir: INTEGER range -1 TO 1) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len: INTEGER := arg1'LENGTH;
     VARIABLE result: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     VARIABLE temp: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     SUBTYPE sw_range IS NATURAL range 0 TO len-1;
     VARIABLE sw: sw_range;
     VARIABLE temp_idx : INTEGER; --2.1.6.3
   BEGIN
     result := (others=>'0');
     result := arg1;
     sw := sdir MOD len;
     FOR i IN arg2'reverse_range LOOP
       EXIT WHEN sw = 0;
       IF signd2 AND i = arg2'LEFT THEN 
         sw := sub_int(len,sw); 
       END IF;
       -- temp := result(len-sw-1 DOWNTO 0) & result(len-1 DOWNTO len-sw)
       FOR i2 IN len-1 DOWNTO 0 LOOP
         --was: temp((i2+sw) MOD len) := result(i2);
         temp_idx := add_nat(i2,sw) MOD len;
         temp(temp_idx) := result(i2);
       END LOOP;
       result := mux_v(STD_LOGIC_VECTOR(concat_vect(result,temp)), arg2(i));
       sw := mod_natural(mult_natural(sw,2), len);
     END LOOP;
     RETURN result;
   END frot;

   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: UNSIGNED) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), FALSE, -1); END;
   FUNCTION frol(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, 1); END;
   FUNCTION fror(arg1: STD_LOGIC_VECTOR; arg2: SIGNED  ) RETURN STD_LOGIC_VECTOR IS
     BEGIN RETURN frot(arg1, STD_LOGIC_VECTOR(arg2), TRUE, -1); END;

-----------------------------------------------------------------
-- indexing functions: LSB always has index 0
-----------------------------------------------------------------

   FUNCTION readindex(vec: STD_LOGIC_VECTOR; index: INTEGER                 ) RETURN STD_LOGIC IS
     CONSTANT len : INTEGER := vec'LENGTH;
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
   BEGIN
     IF index >= len OR index < 0 THEN
       RETURN 'X';
     END IF;
     RETURN vec0(index);
   END;

   FUNCTION readslice(vec: STD_LOGIC_VECTOR; index: INTEGER; width: POSITIVE) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     CONSTANT indexPwidthM1 : INTEGER := index+width-1; --2.1.6.3
     ALIAS    vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0) IS vec;
     CONSTANT xxx : STD_LOGIC_VECTOR(width-1 DOWNTO 0) := (others => 'X');
   BEGIN
     IF index+width > len OR index < 0 THEN
       RETURN xxx;
     END IF;
     RETURN vec0(indexPwidthM1 DOWNTO index);
   END;

   FUNCTION writeindex(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC       ; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
     CONSTANT len : INTEGER := vec'LENGTH;
     VARIABLE vec0: STD_LOGIC_VECTOR(len-1 DOWNTO 0);
     CONSTANT xxx : STD_LOGIC_VECTOR(len-1 DOWNTO 0) := (others => 'X');
   BEGIN
     vec0 := vec;
     IF index >= len OR index < 0 THEN
       RETURN xxx;
     END IF;
     vec0(index) := dinput;
     RETURN vec0;
   END;

   FUNCTION n_bits(p: NATURAL) RETURN POSITIVE IS
     VARIABLE n_b : POSITIVE;
     VARIABLE p_v : NATURAL;
   BEGIN
     p_v := p;
     FOR i IN 1 TO 32 LOOP
       p_v := div_natural(p_v,2);
       n_b := i;
       EXIT WHEN (p_v = 0);
     END LOOP;
     RETURN n_b;
   END;


--   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; index: INTEGER) RETURN STD_LOGIC_VECTOR IS
--
--     CONSTANT vlen: INTEGER := vec'LENGTH;
--     CONSTANT ilen: INTEGER := dinput'LENGTH;
--     CONSTANT max_shift: INTEGER := vlen-ilen;
--     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
--     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
--     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
--     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
--     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
--     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
--   BEGIN
--     inp := (others => '0');
--     mask := (others => '0');
--
--     IF index > max_shift OR index < 0 THEN
--       RETURN xxx;
--     END IF;
--
--     shift := CONV_UNSIGNED(index, shift'LENGTH);
--     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
--     mask(ilen-1 DOWNTO 0) := ones;
--     inp := fshl(inp, shift, vlen);
--     mask := fshl(mask, shift, vlen);
--     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
--     RETURN vec0;
--   END;

   FUNCTION writeslice(vec: STD_LOGIC_VECTOR; dinput: STD_LOGIC_VECTOR; enable: STD_LOGIC_VECTOR; byte_width: INTEGER;  index: INTEGER) RETURN STD_LOGIC_VECTOR IS

     type enable_matrix is array (0 to enable'LENGTH-1 ) of std_logic_vector(byte_width-1 downto 0);
     CONSTANT vlen: INTEGER := vec'LENGTH;
     CONSTANT ilen: INTEGER := dinput'LENGTH;
     CONSTANT max_shift: INTEGER := vlen-ilen;
     CONSTANT ones: UNSIGNED(ilen-1 DOWNTO 0) := (others => '1');
     CONSTANT xxx : STD_LOGIC_VECTOR(vlen-1 DOWNTO 0) := (others => 'X');
     VARIABLE shift : UNSIGNED(n_bits(max_shift)-1 DOWNTO 0);
     VARIABLE vec0: STD_LOGIC_VECTOR(vlen-1 DOWNTO 0);
     VARIABLE inp: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE mask2: UNSIGNED(vlen-1 DOWNTO 0);
     VARIABLE enables: enable_matrix;
     VARIABLE cat_enables: STD_LOGIC_VECTOR(ilen-1 DOWNTO 0 );
     VARIABLE lsbi : INTEGER;
     VARIABLE msbi : INTEGER;

   BEGIN
     cat_enables := (others => '0');
     lsbi := 0;
     msbi := byte_width-1;
     inp := (others => '0');
     mask := (others => '0');

     IF index > max_shift OR index < 0 THEN
       RETURN xxx;
     END IF;

     --initialize enables
     for i in 0 TO (enable'LENGTH-1) loop
       enables(i)  := (others => enable(i));
       cat_enables(msbi downto lsbi) := enables(i) ;
       lsbi := msbi+1;
       msbi := msbi+byte_width;
     end loop;


     shift := CONV_UNSIGNED(index, shift'LENGTH);
     inp(ilen-1 DOWNTO 0) := UNSIGNED(dinput);
     mask(ilen-1 DOWNTO 0) := UNSIGNED((STD_LOGIC_VECTOR(ones) AND cat_enables));
     inp := fshl(inp, shift, vlen);
     mask := fshl(mask, shift, vlen);
     vec0 := (vec and (not STD_LOGIC_VECTOR(mask))) or STD_LOGIC_VECTOR(inp);
     RETURN vec0;
   END;


   FUNCTION ceil_log2(size : NATURAL) return NATURAL is
     VARIABLE cnt : NATURAL;
     VARIABLE res : NATURAL;
   begin
     cnt := 1;
     res := 0;
     while (cnt < size) loop
       res := res + 1;
       cnt := 2 * cnt;
     end loop;
     return res;
   END;
   
   FUNCTION bits(size : NATURAL) return NATURAL is
   begin
     return ceil_log2(size);
   END;

   PROCEDURE csa(a, b, c: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH) xor conv_std_logic_vector(c, s'LENGTH);
     cout := ( (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH)) or (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) or (conv_std_logic_vector(b, cout'LENGTH) and conv_std_logic_vector(c, cout'LENGTH)) );
   END PROCEDURE csa;

   PROCEDURE csha(a, b: IN INTEGER; s, cout: OUT STD_LOGIC_VECTOR) IS
   BEGIN
     s    := conv_std_logic_vector(a, s'LENGTH) xor conv_std_logic_vector(b, s'LENGTH);
     cout := (conv_std_logic_vector(a, cout'LENGTH) and conv_std_logic_vector(b, cout'LENGTH));
   END PROCEDURE csha;

END funcs;

--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_ioport_comps_v11.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------
--                M G C _ I O P O R T _ C O M P S
--------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE mgc_ioport_comps_v11 IS

-- INPUT COMPONENTS

COMPONENT mgc_in_wire_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_in_wire_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
   );
END COMPONENT;

COMPONENT mgc_chan_in_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT std_logic_vector(sz_width-1 DOWNTO 0);
    sld      : IN  std_logic;
    sz       : IN std_logic_vector(sz_width-1 DOWNTO 0);
    slz      : OUT std_logic
   );
END COMPONENT;

COMPONENT mgc_in_wire_wait_nb_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT   std_logic_vector(sz_width-1 DOWNTO 0);
    sld      : in    std_logic
  );
END COMPONENT;

-- OUTPUT COMPONENTS

COMPONENT mgc_out_stdreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_stdreg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;


COMPONENT mgc_out_stdreg_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_dreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_pos_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_neg_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_reg_v3
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_buf_wait_v4
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_fifo_wait_v9
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- implementation for mgc_out_fifo_wait
COMPONENT mgc_out_fifo_wait_core_v9
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN  std_logic;
    en       : IN  std_logic;
    arst     : IN  std_logic;
    srst     : IN  std_logic;
    ld       : IN  std_logic;
    vd       : OUT std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    vz       : IN  std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT std_logic_vector(sz_width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_out_prereg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- INOUT COMPONENTS

COMPONENT mgc_inout_dreg_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_stdreg_en_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_stdreg_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_hid_tribuf_v1
  GENERIC (
    width    : INTEGER
  );
  PORT ( 
    I_SIG    : IN     std_logic_vector(width-1 DOWNTO 0);
    ENABLE   : IN     boolean ;
    O_SIG    : OUT    std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_buf_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_inout_fifo_wait_v2
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    fifo_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1;
    ph_log2  : INTEGER
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    lzin     : OUT   std_logic;
    vzin     : IN    std_logic;
    zin      : IN    std_logic_vector(width-1 DOWNTO 0);
    lzout    : OUT   std_logic;
    vzout    : IN    std_logic;
    zout     : OUT   std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

-- IO SYNCHRONIZATION

COMPONENT mgc_io_sync_v1
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

-- IO SYNCHRONIZATION

COMPONENT mgc_in_sync_v1
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

-- PIPE

COMPONENT mgc_bsync_rdy_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    rz       : OUT   std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_vld_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    vd       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

COMPONENT mgc_bsync_rv_v1
  GENERIC (
    rscid    : INTEGER;
    ready    : INTEGER RANGE 0 TO 1;
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    rd       : IN    std_logic;
    vd       : OUT   std_logic;
    rz       : OUT   std_logic;
    vz       : IN    std_logic
  );
END COMPONENT;

-- PIPE

COMPONENT mgc_pipe_v10
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER;
    sz_width : INTEGER;
    fifo_sz  : INTEGER;
    log2_sz  : INTEGER;
    ph_clk   : INTEGER RANGE 0 TO 1;
    ph_en    : INTEGER RANGE 0 TO 1;
    ph_arst  : INTEGER RANGE 0 TO 1;
    ph_srst  : INTEGER RANGE 0 TO 1
  );
  PORT (
    clk      : IN    std_logic;
    en       : IN    std_logic;
    arst     : IN    std_logic;
    srst     : IN    std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    din      : OUT   std_logic_vector(width-1 DOWNTO 0);
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    dout     : IN    std_logic_vector(width-1 DOWNTO 0);
    sd       : OUT   std_logic_vector(sz_width-1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT mgc_sync_v1
  PORT (
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic;
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_chan_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    vdin     : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_in_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    vzin : IN    std_logic;
    vdin : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_event_out_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    lzout    : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_chan_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout    : IN    std_logic;
    vdout    : OUT   std_logic;
    ldin     : IN    std_logic;
    vdin     : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_in_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    vzin : IN    std_logic;
    lzin : OUT   std_logic;
    ldin : IN    std_logic;
    vdin : OUT   std_logic
  );
END COMPONENT;

COMPONENT ccs_sync_out_v1 IS
  GENERIC (
    rscid    : INTEGER
  );
  PORT (
    ldout : IN    std_logic;
    vdout : OUT   std_logic;
    lzout : OUT   std_logic;
    vzout : IN    std_logic
  );
END COMPONENT;


-- The start of the asynch CDC components
COMPONENT mgc_regfile_pos_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile_neg_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_regfile_v1
generic
(
  data_width   : integer;
  addr_width   : integer;
  num_of_words : integer;
  ph_clk       : integer RANGE 0 TO 1;
  ph_en        : integer RANGE 0 to 1;
  ph_arst      : integer RANGE 0 to 1;
  ph_srst      : integer RANGE 0 to 1
);
port
(
  clk           : IN  std_logic;
  arst          : IN  std_logic;
  srst          : IN  std_logic;
  en            : IN  std_logic;
  write_en      : IN  std_logic;
  write_address : IN  std_logic_vector (addr_width - 1 downto 0);
  write_data    : IN  std_logic_vector (data_width - 1 downto 0);
  read_address  : IN  std_logic_vector (addr_width - 1 downto 0);
  read_data     : OUT std_logic_vector (data_width - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_in_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_out_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  we_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;

COMPONENT mgc_inout_ram_v1
generic
(
  ram_id            : integer;
  words             : integer;
  width             : integer;
  addr_width        : integer;
  re_active         : integer;
  we_active         : integer;
  num_byte_enables  : integer;
  no_of_ports       : integer
);
port
(
 id  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 od  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 ad  : in  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 wd  : in  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0) ;
 iz  : in  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 oz  : out  STD_LOGIC_VECTOR((no_of_ports * width) - 1 downto 0);
 az  : out  STD_LOGIC_VECTOR((no_of_ports * addr_width) - 1 downto 0) ;
 rz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0);
 wz  : out  STD_LOGIC_VECTOR((no_of_ports * num_byte_enables) - 1 downto 0)
);
END COMPONENT;


COMPONENT funccall_inout_v1
generic
(
  ram_id           : integer;
  width           : integer;  -- models the concat of the return value (data)
  addr_width      : integer  -- models the concat of the input arguments (addr)
);
port
(
  d  : out  STD_LOGIC_VECTOR(width - 1 downto 0);
  ad : in  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bd : in  STD_LOGIC;
  z  : in  STD_LOGIC_VECTOR(width - 1 downto 0);
  az : out  STD_LOGIC_VECTOR(addr_width - 1 downto 0) ;
  bz : out  STD_LOGIC
);
END COMPONENT;

END mgc_ioport_comps_v11;

--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_in_wire_en_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_in_wire_en_v1 IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_in_wire_en_v1;

ARCHITECTURE beh OF mgc_in_wire_en_v1 IS
BEGIN

  lz <= ld;
  d <= z;

END beh;


--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_in_wire_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_in_wire_v1 IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    d        : OUT std_logic_vector(width-1 DOWNTO 0);
    z        : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_in_wire_v1;

ARCHITECTURE beh OF mgc_in_wire_v1 IS
BEGIN

  d <= z;

END beh;



--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/siflibs/mgc_out_stdreg_en_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2015 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_out_stdreg_en_v1 IS
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    ld       : IN  std_logic;
    d        : IN  std_logic_vector(width-1 DOWNTO 0);
    lz       : OUT std_logic;
    z        : OUT std_logic_vector(width-1 DOWNTO 0)
  );
END mgc_out_stdreg_en_v1;

ARCHITECTURE beh OF mgc_out_stdreg_en_v1 IS
BEGIN

  lz <= ld;
  z  <= d;

END beh;

--------> C:/PROGRA~1/MENTOR~1/CATAPU~1.0C/Mgc_home/pkgs/ccs_xilinx/hdl/BLOCK_1R1W_RBW.vhd 

LIBRARY IEEE;

   USE IEEE.STD_LOGIC_1164.ALL;
   USE IEEE.Numeric_Std.ALL;

PACKAGE BLOCK_1R1W_RBW_pkg IS

   COMPONENT BLOCK_1R1W_RBW
      GENERIC (
         data_width    : integer := 8;
         addr_width : integer := 7;
         depth         : integer := 128
      );
      PORT (
         clk  : IN  std_logic;
         radr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         wadr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         we   : IN  std_logic;
         re   : IN  std_logic;
         d    : IN  std_logic_vector(data_width-1 DOWNTO 0);
         q    : OUT std_logic_vector(data_width-1  DOWNTO 0)
      );
   END COMPONENT;

END BLOCK_1R1W_RBW_pkg;


LIBRARY IEEE;

   USE IEEE.STD_LOGIC_1164.ALL;
   USE IEEE.Numeric_Std.ALL;

ENTITY BLOCK_1R1W_RBW IS
      GENERIC (
         data_width    : integer := 8;
         addr_width : integer := 7;
         depth         : integer := 128
      );
      PORT (
         clk  : IN  std_logic;
         radr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         wadr : IN  std_logic_vector(addr_width-1 DOWNTO 0);
         we   : IN  std_logic;
         re   : IN  std_logic;
         d    : IN  std_logic_vector(data_width-1 DOWNTO 0);
         q    : OUT std_logic_vector(data_width-1  DOWNTO 0)
      );
END BLOCK_1R1W_RBW;

ARCHITECTURE rtl OF BLOCK_1R1W_RBW IS

   TYPE ram_t IS ARRAY (depth-1 DOWNTO 0) OF std_logic_vector(data_width-1 DOWNTO 0);
   SIGNAL mem : ram_t := (OTHERS => (OTHERS => '0'));

   ATTRIBUTE ram_style: STRING;
   ATTRIBUTE ram_style OF mem : SIGNAL IS "BLOCK";
   ATTRIBUTE syn_ramstyle: STRING;
   ATTRIBUTE syn_ramstyle OF mem : SIGNAL IS "block_ram";

BEGIN
   PROCESS (clk)
   BEGIN
      IF (rising_edge(clk)) THEN
         IF (we='1') THEN
           mem(to_integer(unsigned(wadr))) <= d;
         END IF;
         IF (re='1') THEN
            q <= mem(to_integer(unsigned(radr))) ; -- read port
         END IF; 
      END IF;
   END PROCESS;
END rtl;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    10.0c/745553 Production Release
--  HLS Date:       Wed Oct 11 16:38:17 PDT 2017
-- 
--  Generated by:   Fitkit@DESKTOP-NJUNEBJ
--  Generated date: Sat Dec 15 16:31:57 2018
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    re : OUT STD_LOGIC;
    q : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    we_d : IN STD_LOGIC;
    re_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
  );
END Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen;

ARCHITECTURE v1 OF Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  we <= (we_d);
  d <= (d_d);
  wadr <= (wadr_d);
  re <= (re_d);
  q_d <= q;
  radr <= (radr_d);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen IS
  PORT(
    we : OUT STD_LOGIC;
    d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    adr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    adr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
    d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    we_d : IN STD_LOGIC;
    q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    ram_rw_A_internal_RMASK_B_d : IN STD_LOGIC
  );
END Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen;

ARCHITECTURE v1 OF Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen IS
  -- Default Constants

BEGIN
  -- Default Constant Signal Assignments

  we <= (we_d);
  d <= (d_d);
  q_d <= q;
  adr <= (adr_d);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    filter_core_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY filter_core_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    buffer_buf_vinit_C_1_tr0 : IN STD_LOGIC
  );
END filter_core_core_fsm;

ARCHITECTURE v1 OF filter_core_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for filter_core_core_fsm_1
  TYPE filter_core_core_fsm_1_ST IS (core_rlp_C_0, buffer_buf_vinit_C_0, buffer_buf_vinit_C_1,
      main_C_0, main_C_1, main_C_2, main_C_3);

  SIGNAL state_var : filter_core_core_fsm_1_ST;
  SIGNAL state_var_NS : filter_core_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  filter_core_core_fsm_1 : PROCESS (buffer_buf_vinit_C_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN buffer_buf_vinit_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000010");
        state_var_NS <= buffer_buf_vinit_C_1;
      WHEN buffer_buf_vinit_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000100");
        IF ( buffer_buf_vinit_C_1_tr0 = '1' ) THEN
          state_var_NS <= buffer_buf_vinit_C_0;
        ELSE
          state_var_NS <= main_C_0;
        END IF;
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0001000");
        state_var_NS <= main_C_1;
      WHEN main_C_1 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0010000");
        state_var_NS <= main_C_2;
      WHEN main_C_2 =>
        fsm_output <= STD_LOGIC_VECTOR'( "0100000");
        state_var_NS <= main_C_3;
      WHEN main_C_3 =>
        fsm_output <= STD_LOGIC_VECTOR'( "1000000");
        state_var_NS <= main_C_0;
      -- core_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "0000001");
        state_var_NS <= buffer_buf_vinit_C_0;
    END CASE;
  END PROCESS filter_core_core_fsm_1;

  filter_core_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= core_rlp_C_0;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS filter_core_core_fsm_1_REG;

END v1;

-- ------------------------------------------------------------------
--  Design Unit:    filter_core
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY filter_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    in_data_rsc_z : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    in_data_rsc_lz : OUT STD_LOGIC;
    in_data_vld_rsc_z : IN STD_LOGIC;
    out_data_rsc_z : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    out_data_rsc_lz : OUT STD_LOGIC;
    mcu_data_rsci_adr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    mcu_data_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mcu_data_rsci_we_d : OUT STD_LOGIC;
    mcu_data_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mcu_data_rsci_ram_rw_A_internal_RMASK_B_d : OUT STD_LOGIC;
    buffer_buf_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    buffer_buf_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
    buffer_buf_rsci_d_d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    buffer_buf_rsci_we_d : OUT STD_LOGIC;
    buffer_buf_rsci_re_d : OUT STD_LOGIC;
    buffer_buf_rsci_q_d : IN STD_LOGIC_VECTOR (2 DOWNTO 0)
  );
END filter_core;

ARCHITECTURE v1 OF filter_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL in_data_rsci_ld : STD_LOGIC;
  SIGNAL in_data_rsci_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL in_data_vld_rsci_d : STD_LOGIC;
  SIGNAL out_data_rsci_ld : STD_LOGIC;
  SIGNAL out_data_rsci_d_0 : STD_LOGIC;
  SIGNAL fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL if_if_if_and_tmp : STD_LOGIC;
  SIGNAL pixel_processing_if_if_acc_tmp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_clip_window_nor_tmp : STD_LOGIC;
  SIGNAL clip_window_clip_window_nor_1_tmp : STD_LOGIC;
  SIGNAL system_input_system_input_or_tmp : STD_LOGIC;
  SIGNAL clip_window_clip_window_and_1_tmp : STD_LOGIC;
  SIGNAL clip_window_clip_window_and_tmp : STD_LOGIC;
  SIGNAL and_2_tmp : STD_LOGIC;
  SIGNAL system_input_system_input_nand_tmp : STD_LOGIC;
  SIGNAL or_dcpl : STD_LOGIC;
  SIGNAL and_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_33 : STD_LOGIC;
  SIGNAL and_dcpl_44 : STD_LOGIC;
  SIGNAL and_dcpl_45 : STD_LOGIC;
  SIGNAL and_dcpl_57 : STD_LOGIC;
  SIGNAL nor_tmp_4 : STD_LOGIC;
  SIGNAL mux_tmp_3 : STD_LOGIC;
  SIGNAL and_dcpl_64 : STD_LOGIC;
  SIGNAL or_tmp_33 : STD_LOGIC;
  SIGNAL or_tmp_42 : STD_LOGIC;
  SIGNAL or_tmp_48 : STD_LOGIC;
  SIGNAL or_tmp_56 : STD_LOGIC;
  SIGNAL mcu_ready_sva : STD_LOGIC;
  SIGNAL pixel_processing_threshold_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_frame_sva : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL system_input_c_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL system_input_r_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL system_input_c_filter_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL system_input_r_filter_sva : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL system_input_output_vld_sva : STD_LOGIC;
  SIGNAL system_input_window_4_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL system_input_window_3_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL system_input_window_5_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL system_input_window_6_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL system_input_window_7_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL system_input_window_8_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_vinit_ndx_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_sel_1_0_sva_1 : STD_LOGIC;
  SIGNAL if_if_if_and_mdf_sva_2 : STD_LOGIC;
  SIGNAL else_io_read_in_data_vld_rsc_svs : STD_LOGIC;
  SIGNAL system_input_din_sva_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_sel_1_0_sva_dfm : STD_LOGIC;
  SIGNAL buffer_t0_sva_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_first_row_0_sva_5 : STD_LOGIC;
  SIGNAL clip_window_last_row_0_sva_7 : STD_LOGIC;
  SIGNAL clip_window_last_col_0_sva_3 : STD_LOGIC;
  SIGNAL system_input_output_vld_sva_dfm : STD_LOGIC;
  SIGNAL system_input_land_1_lpi_1_dfm_1 : STD_LOGIC;
  SIGNAL median_max2_5_1_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_4_2_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_3_2_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_2_2_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_1_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_4_1_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_6_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_5_3_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_7_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs_1 : STD_LOGIC;
  SIGNAL buffer_buf_buffer_buf_nor_itm_1 : STD_LOGIC;
  SIGNAL buffer_buf_acc_itm_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL median_max_5_lpi_1_dfm_5 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL asn_itm : STD_LOGIC;
  SIGNAL else_io_read_in_data_vld_rsc_svs_st_1 : STD_LOGIC;
  SIGNAL buffer_acc_1_itm_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL buffer_acc_3_itm_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL buffer_slc_buffer_c_5_0_1_itm_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL system_input_output_vld_sva_dfm_st_1 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_3_asn_2_itm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_pixel_processing_if_if_nor_itm : STD_LOGIC;
  SIGNAL pixel_processing_if_asn_itm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_if_1_asn_itm : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL and_itm : STD_LOGIC;
  SIGNAL asn_itm_1 : STD_LOGIC;
  SIGNAL else_io_read_in_data_vld_rsc_svs_st_2 : STD_LOGIC;
  SIGNAL system_input_output_vld_sva_dfm_st_2 : STD_LOGIC;
  SIGNAL pixel_processing_if_pixel_processing_if_if_nor_itm_2 : STD_LOGIC;
  SIGNAL main_stage_0_2 : STD_LOGIC;
  SIGNAL and_2_cse : STD_LOGIC;
  SIGNAL and_116_cse : STD_LOGIC;
  SIGNAL and_120_cse : STD_LOGIC;
  SIGNAL and_128_cse : STD_LOGIC;
  SIGNAL and_143_cse : STD_LOGIC;
  SIGNAL and_146_cse : STD_LOGIC;
  SIGNAL and_147_cse : STD_LOGIC;
  SIGNAL and_148_cse : STD_LOGIC;
  SIGNAL and_154_cse : STD_LOGIC;
  SIGNAL and_141_cse : STD_LOGIC;
  SIGNAL pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs : STD_LOGIC;
  SIGNAL system_input_land_1_lpi_1_dfm : STD_LOGIC;
  SIGNAL median_max_8_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_9_lpi_1_dfm_1_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_window_8_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_window_6_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_0_lpi_1_dfm_1_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_1_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_window_2_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_window_0_lpi_1_dfm : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_4_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_8_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_5_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_9_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_4_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_6_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_7_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_5_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_6_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_qr_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_0_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_3_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_1_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_4_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_qr_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_6_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_7_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_7_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_8_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_8_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_qr_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_1_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_2_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_2_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_3_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_qr_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL reg_system_input_system_input_output_vld_and_cse : STD_LOGIC;
  SIGNAL nand_2_cse : STD_LOGIC;
  SIGNAL mcu_data_rsci_adr_d_mx0c2 : STD_LOGIC;
  SIGNAL mcu_data_rsci_adr_d_mx0c3 : STD_LOGIC;
  SIGNAL median_max_5_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_slc_L1a_if_acc_14_3_itm : STD_LOGIC;
  SIGNAL L1a_if_slc_L1a_if_acc_13_3_itm : STD_LOGIC;
  SIGNAL L1a_if_slc_L1a_if_acc_12_3_itm : STD_LOGIC;
  SIGNAL L1b_if_slc_L1b_if_acc_12_3_itm : STD_LOGIC;
  SIGNAL L1b_if_slc_L1b_if_acc_11_3_itm : STD_LOGIC;
  SIGNAL L1a_if_slc_L1a_if_acc_4_3_itm : STD_LOGIC;
  SIGNAL L1b_asn_4_mx1w1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1b_asn_44_mx0w1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_sel_1_0_sva_dfm_mx0 : STD_LOGIC;
  SIGNAL pixel_processing_if_if_acc_2_psp_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_if_acc_8_psp : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_if_acc_6_sdt : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL median_max2_2_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_switch_lp_equal_tmp : STD_LOGIC;
  SIGNAL clip_window_switch_lp_equal_tmp_1 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_equal_tmp_2 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_2_equal_tmp : STD_LOGIC;
  SIGNAL clip_window_switch_lp_2_equal_tmp_1 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_2_equal_tmp_2 : STD_LOGIC;
  SIGNAL median_max2_8_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_asn_11_mx0w1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_7_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_asn_16_mx0w1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_5_3_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_4_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_7_2_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max_5_1_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_switch_lp_1_equal_tmp : STD_LOGIC;
  SIGNAL clip_window_switch_lp_1_equal_tmp_1 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_1_equal_tmp_2 : STD_LOGIC;
  SIGNAL buffer_qr_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_switch_lp_3_equal_tmp : STD_LOGIC;
  SIGNAL clip_window_switch_lp_3_equal_tmp_1 : STD_LOGIC;
  SIGNAL clip_window_switch_lp_3_equal_tmp_2 : STD_LOGIC;
  SIGNAL median_max2_6_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL median_max2_5_lpi_1_dfm_mx0 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1b_if_acc_15_itm_3 : STD_LOGIC;
  SIGNAL L1b_if_acc_14_itm_3 : STD_LOGIC;
  SIGNAL L1b_if_acc_13_itm_3 : STD_LOGIC;
  SIGNAL and_104_rgt : STD_LOGIC;
  SIGNAL median_max_and_7_rgt : STD_LOGIC;
  SIGNAL and_108_rgt : STD_LOGIC;
  SIGNAL reg_median_median_max_or_2_cse : STD_LOGIC;
  SIGNAL reg_pixel_processing_if_pixel_processing_if_if_pixel_processing_if_if_and_cse
      : STD_LOGIC;
  SIGNAL z_out_3 : STD_LOGIC;
  SIGNAL z_out_1_3 : STD_LOGIC;
  SIGNAL z_out_2_3 : STD_LOGIC;
  SIGNAL z_out_3_3 : STD_LOGIC;
  SIGNAL z_out_4_3 : STD_LOGIC;
  SIGNAL z_out_5_3 : STD_LOGIC;
  SIGNAL z_out_6_3 : STD_LOGIC;
  SIGNAL z_out_7_3 : STD_LOGIC;
  SIGNAL z_out_8_3 : STD_LOGIC;

  SIGNAL system_input_if_2_qelse_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL system_input_if_2_system_input_if_2_nand_nl : STD_LOGIC;
  SIGNAL system_input_if_1_qelse_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL clip_window_switch_lp_2_not_4_nl : STD_LOGIC;
  SIGNAL system_input_else_2_acc_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL and_102_nl : STD_LOGIC;
  SIGNAL median_max2_and_5_nl : STD_LOGIC;
  SIGNAL median_max_and_3_nl : STD_LOGIC;
  SIGNAL median_max2_and_3_nl : STD_LOGIC;
  SIGNAL median_max_and_1_nl : STD_LOGIC;
  SIGNAL median_max2_median_max2_nor_nl : STD_LOGIC;
  SIGNAL buffer_nor_nl : STD_LOGIC;
  SIGNAL pixel_processing_if_if_acc_7_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL pixel_processing_if_if_acc_5_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL pixel_processing_if_if_acc_4_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL nor_nl : STD_LOGIC;
  SIGNAL clip_window_switch_lp_2_nor_nl : STD_LOGIC;
  SIGNAL clip_window_switch_lp_nor_nl : STD_LOGIC;
  SIGNAL clip_window_switch_lp_3_nor_nl : STD_LOGIC;
  SIGNAL clip_window_switch_lp_1_nor_nl : STD_LOGIC;
  SIGNAL L1b_if_acc_15_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1b_if_acc_14_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1b_if_acc_13_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL nand_6_nl : STD_LOGIC;
  SIGNAL L1a_if_acc_14_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1a_if_acc_13_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1a_if_acc_12_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1b_if_acc_12_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1b_if_acc_11_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL L1a_if_acc_4_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mcu_data_mcu_data_or_nl : STD_LOGIC;
  SIGNAL mcu_data_and_1_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mcu_data_mux1h_1_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL mcu_data_nor_1_nl : STD_LOGIC;
  SIGNAL mux_56_nl : STD_LOGIC;
  SIGNAL mux_55_nl : STD_LOGIC;
  SIGNAL nand_1_nl : STD_LOGIC;
  SIGNAL mcu_data_mux1h_nl : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL pixel_processing_if_if_pixel_processing_if_if_acc_1_nl : STD_LOGIC_VECTOR
      (31 DOWNTO 0);
  SIGNAL mcu_data_nor_2_nl : STD_LOGIC;
  SIGNAL buffer_buf_mux_3_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_nor_nl : STD_LOGIC;
  SIGNAL buffer_buf_mux_2_nl : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_nor_1_nl : STD_LOGIC;
  SIGNAL acc_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL thresholding_if_mux1h_3_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL thresholding_if_mux1h_4_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_1_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1b_if_mux1h_3_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1b_if_mux1h_4_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_2_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1a_if_mux1h_6_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_mux1h_7_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL clip_window_mux_2_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_3_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1a_if_mux1h_8_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_mux1h_9_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_4_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1a_if_mux_9_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_mux_10_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_5_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1a_if_mux_11_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_mux_12_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_6_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1b_if_mux_6_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1b_if_mux_7_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_7_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1a_if_mux_13_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1a_if_mux_14_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_8_nl : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL L1b_if_mux_8_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL L1b_if_mux_9_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL in_data_rsci_d_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL in_data_rsci_z : STD_LOGIC_VECTOR (2 DOWNTO 0);

  SIGNAL in_data_vld_rsci_d_1 : STD_LOGIC_VECTOR (0 DOWNTO 0);
  SIGNAL in_data_vld_rsci_z : STD_LOGIC_VECTOR (0 DOWNTO 0);

  SIGNAL out_data_rsci_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL out_data_rsci_z : STD_LOGIC_VECTOR (2 DOWNTO 0);

  COMPONENT filter_core_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
      buffer_buf_vinit_C_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL filter_core_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (6 DOWNTO 0);
  SIGNAL filter_core_core_fsm_inst_buffer_buf_vinit_C_1_tr0 : STD_LOGIC;

  FUNCTION MUX1HOT_v_32_4_2(input_3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_3_2(input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(2 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
    RETURN result;
  END;

  FUNCTION MUX1HOT_v_3_4_2(input_3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC_VECTOR(3 DOWNTO 0))
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      tmp := (OTHERS=>sel(0));
      result := input_0 and tmp;
      tmp := (OTHERS=>sel( 1));
      result := result or ( input_1 and tmp);
      tmp := (OTHERS=>sel( 2));
      result := result or ( input_2 and tmp);
      tmp := (OTHERS=>sel( 3));
      result := result or ( input_3 and tmp);
    RETURN result;
  END;

  FUNCTION MUX_s_1_2_2(input_0 : STD_LOGIC;
  input_1 : STD_LOGIC;
  sel : STD_LOGIC)
  RETURN STD_LOGIC IS
    VARIABLE result : STD_LOGIC;
    VARIABLE tmp : STD_LOGIC;

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_10_2_2(input_0 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(9 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_32_2_2(input_0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(31 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

  FUNCTION MUX_v_3_2_2(input_0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
    VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Default Constant Signal Assignments

  in_data_rsci : work.mgc_ioport_comps_v11.mgc_in_wire_en_v1
    GENERIC MAP(
      rscid => 1,
      width => 3
      )
    PORT MAP(
      ld => in_data_rsci_ld,
      d => in_data_rsci_d_1,
      lz => in_data_rsc_lz,
      z => in_data_rsci_z
    );
  in_data_rsci_d <= in_data_rsci_d_1;
  in_data_rsci_z <= in_data_rsc_z;

  in_data_vld_rsci : work.mgc_ioport_comps_v11.mgc_in_wire_v1
    GENERIC MAP(
      rscid => 2,
      width => 1
      )
    PORT MAP(
      d => in_data_vld_rsci_d_1,
      z => in_data_vld_rsci_z
    );
  in_data_vld_rsci_d <= in_data_vld_rsci_d_1(0);
  in_data_vld_rsci_z(0) <= in_data_vld_rsc_z;

  out_data_rsci : work.mgc_ioport_comps_v11.mgc_out_stdreg_en_v1
    GENERIC MAP(
      rscid => 3,
      width => 3
      )
    PORT MAP(
      ld => out_data_rsci_ld,
      d => out_data_rsci_d,
      lz => out_data_rsc_lz,
      z => out_data_rsci_z
    );
  out_data_rsci_d <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(out_data_rsci_d_0,
      1),3));
  out_data_rsc_z <= out_data_rsci_z;

  filter_core_core_fsm_inst : filter_core_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => filter_core_core_fsm_inst_fsm_output,
      buffer_buf_vinit_C_1_tr0 => filter_core_core_fsm_inst_buffer_buf_vinit_C_1_tr0
    );
  fsm_output <= filter_core_core_fsm_inst_fsm_output;
  filter_core_core_fsm_inst_buffer_buf_vinit_C_1_tr0 <= NOT buffer_buf_buffer_buf_nor_itm_1;

  reg_system_input_system_input_output_vld_and_cse <= in_data_vld_rsci_d AND mcu_ready_sva
      AND (fsm_output(3));
  reg_pixel_processing_if_pixel_processing_if_if_pixel_processing_if_if_and_cse <=
      mcu_ready_sva AND (NOT or_tmp_56);
  and_104_rgt <= mcu_ready_sva AND (NOT L1b_if_acc_15_itm_3) AND (fsm_output(5));
  median_max_and_7_rgt <= mcu_ready_sva AND (NOT L1b_if_acc_14_itm_3) AND (fsm_output(5));
  reg_median_median_max_or_2_cse <= (mcu_ready_sva AND L1b_if_acc_14_itm_3 AND (fsm_output(5)))
      OR median_max_and_7_rgt;
  and_108_rgt <= mcu_ready_sva AND (NOT L1b_if_acc_13_itm_3) AND (fsm_output(5));
  L1b_asn_4_mx1w1 <= MUX_v_3_2_2(median_max_7_2_lpi_1_dfm_mx0, L1a_asn_11_mx0w1,
      L1a_if_slc_L1a_if_acc_14_3_itm);
  median_max_5_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_6_lpi_1_dfm_mx0, median_max2_5_lpi_1_dfm_mx0,
      z_out_1_3);
  system_input_system_input_or_tmp <= system_input_output_vld_sva OR (TO_STDLOGIC(system_input_c_sva=STD_LOGIC_VECTOR'("00000000000000000000000000000001"))
      AND TO_STDLOGIC(system_input_r_sva=STD_LOGIC_VECTOR'("00000000000000000000000000000001")));
  clip_window_clip_window_and_tmp <= TO_STDLOGIC(system_input_r_filter_sva=STD_LOGIC_VECTOR'("00000000000000000000000011101111"));
  pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs <= (pixel_processing_frame_sva(0))
      AND TO_STDLOGIC(pixel_processing_if_if_acc_tmp=STD_LOGIC_VECTOR'("000"));
  system_input_land_1_lpi_1_dfm <= clip_window_clip_window_and_1_tmp AND clip_window_clip_window_and_tmp;
  L1b_asn_44_mx0w1 <= MUX_v_3_2_2(median_max2_0_lpi_1_dfm_mx0, median_max_1_1_lpi_1_dfm_mx0,
      z_out_7_3);
  clip_window_clip_window_nor_tmp <= NOT(TO_STDLOGIC(system_input_r_filter_sva/=STD_LOGIC_VECTOR'("00000000000000000000000000000000")));
  clip_window_clip_window_and_1_tmp <= TO_STDLOGIC(system_input_c_filter_sva=STD_LOGIC_VECTOR'("00000000000000000000000100111111"));
  buffer_nor_nl <= NOT(TO_STDLOGIC(system_input_c_sva/=STD_LOGIC_VECTOR'("00000000000000000000000000000000")));
  buffer_sel_1_0_sva_dfm_mx0 <= MUX_s_1_2_2(buffer_sel_1_0_sva_1, (NOT buffer_sel_1_0_sva_1),
      buffer_nor_nl);
  pixel_processing_if_if_acc_tmp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(pixel_processing_if_if_acc_2_psp_sva(2),
      1), 1), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(pixel_processing_if_if_acc_2_psp_sva(1
      DOWNTO 0)), 2), 3), 3));
  pixel_processing_if_if_acc_7_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(NOT
      (pixel_processing_if_if_acc_8_psp(2)), 1), 1), 2) + CONV_SIGNED(CONV_UNSIGNED(CONV_UNSIGNED(NOT
      (pixel_processing_if_if_acc_8_psp(1)), 1), 1), 2), 2));
  pixel_processing_if_if_acc_2_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(SIGNED(pixel_processing_if_if_acc_7_nl),
      3) + UNSIGNED'( (pixel_processing_if_if_acc_8_psp(2)) & (pixel_processing_if_if_acc_8_psp(0))
      & (pixel_processing_if_if_acc_6_sdt(0))), 3));
  pixel_processing_if_if_acc_8_psp <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pixel_processing_if_if_acc_6_sdt(3
      DOWNTO 1)) + UNSIGNED'( "101"), 3));
  pixel_processing_if_if_acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(pixel_processing_frame_sva(2
      DOWNTO 1)), 2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (pixel_processing_frame_sva(4
      DOWNTO 3))), 2), 3), 3));
  pixel_processing_if_if_acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(pixel_processing_frame_sva(6
      DOWNTO 5)), 2), 3) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT (pixel_processing_frame_sva(8
      DOWNTO 7))), 2), 3), 3));
  pixel_processing_if_if_acc_6_sdt <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(pixel_processing_if_if_acc_5_nl),
      4) + CONV_UNSIGNED(UNSIGNED(pixel_processing_if_if_acc_4_nl), 4), 4));
  median_max2_0_lpi_1_dfm_1_mx0 <= MUX_v_3_2_2(median_max_1_1_lpi_1_dfm_mx0, median_max2_0_lpi_1_dfm_mx0,
      z_out_7_3);
  median_max_1_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_2_2_lpi_1_dfm_mx0, L1b_asn_44_mx0w1,
      z_out_1_3);
  median_max2_2_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_3_1_lpi_1_dfm_mx0, median_max_2_1_lpi_1_dfm_mx0,
      z_out_5_3);
  median_max_2_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_1_1_lpi_1_dfm_mx0, median_max2_2_1_lpi_1_dfm_mx0,
      z_out_8_3);
  median_max_3_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_4_1_lpi_1_dfm_mx0, median_max2_3_1_lpi_1_dfm_mx0,
      z_out_6_3);
  median_max2_0_lpi_1_dfm_mx0 <= MUX_v_3_2_2(clip_window_qr_lpi_1_dfm_mx0, pixel_processing_window_0_lpi_1_dfm,
      z_out_3_3);
  median_max_1_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_2_1_lpi_1_dfm_mx0, median_max2_1_1_lpi_1_dfm_mx0,
      z_out_8_3);
  median_max2_3_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(pixel_processing_window_2_lpi_1_dfm,
      clip_window_qr_3_lpi_1_dfm_mx0, z_out_4_3);
  nor_nl <= NOT(clip_window_clip_window_and_tmp OR z_out_2_3);
  median_max2_4_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(system_input_window_7_sva, system_input_window_8_sva,
      nor_nl);
  median_max2_1_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(pixel_processing_window_0_lpi_1_dfm,
      clip_window_qr_lpi_1_dfm_mx0, z_out_3_3);
  median_max2_2_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(clip_window_qr_3_lpi_1_dfm_mx0, pixel_processing_window_2_lpi_1_dfm,
      z_out_4_3);
  clip_window_switch_lp_2_nor_nl <= NOT(clip_window_switch_lp_2_equal_tmp OR clip_window_switch_lp_2_equal_tmp_1
      OR clip_window_switch_lp_2_equal_tmp_2);
  pixel_processing_window_2_lpi_1_dfm <= MUX1HOT_v_3_4_2(system_input_window_7_sva,
      system_input_window_4_sva, system_input_window_8_sva, system_input_window_5_sva,
      STD_LOGIC_VECTOR'( clip_window_switch_lp_2_nor_nl & clip_window_switch_lp_2_equal_tmp
      & clip_window_switch_lp_2_equal_tmp_1 & clip_window_switch_lp_2_equal_tmp_2));
  clip_window_qr_3_lpi_1_dfm_mx0 <= MUX_v_3_2_2(system_input_window_6_sva, system_input_window_7_sva,
      clip_window_clip_window_nor_tmp);
  clip_window_switch_lp_nor_nl <= NOT(clip_window_switch_lp_equal_tmp OR clip_window_switch_lp_equal_tmp_1
      OR clip_window_switch_lp_equal_tmp_2);
  pixel_processing_window_0_lpi_1_dfm <= MUX1HOT_v_3_4_2(system_input_window_7_sva,
      system_input_window_4_sva, system_input_window_6_sva, system_input_window_3_sva,
      STD_LOGIC_VECTOR'( clip_window_switch_lp_nor_nl & clip_window_switch_lp_equal_tmp
      & clip_window_switch_lp_equal_tmp_1 & clip_window_switch_lp_equal_tmp_2));
  clip_window_qr_lpi_1_dfm_mx0 <= MUX_v_3_2_2(system_input_window_4_sva, system_input_window_7_sva,
      clip_window_clip_window_nor_1_tmp);
  clip_window_clip_window_nor_1_tmp <= NOT(TO_STDLOGIC(system_input_c_filter_sva/=STD_LOGIC_VECTOR'("00000000000000000000000000000000")));
  clip_window_switch_lp_equal_tmp <= clip_window_clip_window_nor_tmp AND (NOT clip_window_clip_window_nor_1_tmp);
  clip_window_switch_lp_equal_tmp_1 <= clip_window_clip_window_nor_1_tmp AND (NOT
      clip_window_clip_window_nor_tmp);
  clip_window_switch_lp_equal_tmp_2 <= NOT(clip_window_clip_window_nor_1_tmp OR clip_window_clip_window_nor_tmp);
  clip_window_switch_lp_2_equal_tmp <= clip_window_clip_window_and_tmp AND (NOT clip_window_clip_window_nor_1_tmp);
  clip_window_switch_lp_2_equal_tmp_1 <= clip_window_clip_window_nor_1_tmp AND (NOT
      clip_window_clip_window_and_tmp);
  clip_window_switch_lp_2_equal_tmp_2 <= NOT(clip_window_clip_window_nor_1_tmp OR
      clip_window_clip_window_and_tmp);
  system_input_system_input_nand_tmp <= NOT(TO_STDLOGIC(system_input_c_sva=STD_LOGIC_VECTOR'("00000000000000000000000100111111")));
  and_2_tmp <= in_data_vld_rsci_d AND mcu_ready_sva;
  if_if_if_and_tmp <= TO_STDLOGIC(mcu_data_rsci_q_d=STD_LOGIC_VECTOR'("00000000000000000000000000000001"));
  median_max2_8_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_9_lpi_1_dfm_1_mx0, median_max_8_lpi_1_dfm_mx0,
      z_out_3);
  L1a_asn_11_mx0w1 <= MUX_v_3_2_2(median_max_4_lpi_1_dfm_mx0, median_max2_6_2_lpi_1_dfm_mx0,
      L1b_if_slc_L1b_if_acc_11_3_itm);
  median_max2_7_lpi_1_dfm_mx0 <= MUX_v_3_2_2(L1a_asn_11_mx0w1, median_max_7_2_lpi_1_dfm_mx0,
      L1a_if_slc_L1a_if_acc_14_3_itm);
  L1a_asn_16_mx0w1 <= MUX_v_3_2_2(median_max_2_2_lpi_1_dfm, median_max_3_lpi_1_dfm_mx0,
      z_out_7_3);
  median_max2_5_3_lpi_1_dfm_mx0 <= MUX_v_3_2_2(L1a_asn_16_mx0w1, median_max_5_1_lpi_1_dfm_mx0,
      L1a_if_slc_L1a_if_acc_13_3_itm);
  median_max_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_1_lpi_1_dfm, median_max2_2_lpi_1_dfm_mx0,
      z_out_1_3);
  median_max2_4_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_5_1_lpi_1_dfm_mx0, L1a_asn_16_mx0w1,
      L1a_if_slc_L1a_if_acc_13_3_itm);
  median_max2_9_lpi_1_dfm_1_mx0 <= MUX_v_3_2_2(median_max_8_1_lpi_1_dfm_mx0, median_max2_9_lpi_1_dfm_mx0,
      L1a_if_slc_L1a_if_acc_12_3_itm);
  median_max_8_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_7_2_lpi_1_dfm_mx0, median_max2_8_2_lpi_1_dfm_mx0,
      L1b_if_slc_L1b_if_acc_12_3_itm);
  median_max_7_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_8_2_lpi_1_dfm_mx0, median_max2_7_2_lpi_1_dfm_mx0,
      L1b_if_slc_L1b_if_acc_12_3_itm);
  median_max_5_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_6_2_lpi_1_dfm_mx0, median_max_4_lpi_1_dfm_mx0,
      L1b_if_slc_L1b_if_acc_11_3_itm);
  median_max2_8_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_9_lpi_1_dfm_mx0, median_max_8_1_lpi_1_dfm_mx0,
      L1a_if_slc_L1a_if_acc_12_3_itm);
  median_max2_7_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_5_2_lpi_1_dfm_mx0, median_max_7_1_lpi_1_dfm_mx0,
      z_out_5_3);
  median_max_4_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_3_2_lpi_1_dfm, median_max2_4_2_lpi_1_dfm_mx0,
      z_out_6_3);
  median_max2_6_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_7_1_lpi_1_dfm_mx0, median_max2_5_2_lpi_1_dfm_mx0,
      z_out_5_3);
  median_max2_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_3_lpi_1_dfm_mx0, median_max_2_2_lpi_1_dfm,
      z_out_7_3);
  median_max2_9_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_7_1_lpi_1_dfm_mx0, pixel_processing_window_8_lpi_1_dfm,
      z_out_2_3);
  median_max_8_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_6_2_lpi_1_dfm_mx0, median_max2_8_1_lpi_1_dfm_mx0,
      z_out_8_3);
  median_max2_5_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_4_2_lpi_1_dfm, median_max_5_2_lpi_1_dfm_mx0,
      z_out_3_3);
  median_max_7_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_8_1_lpi_1_dfm_mx0, median_max_6_2_lpi_1_dfm_mx0,
      z_out_8_3);
  median_max_3_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_4_2_lpi_1_dfm_mx0, median_max2_3_2_lpi_1_dfm,
      z_out_6_3);
  median_max_6_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_5_1_lpi_1_dfm, median_max2_6_1_lpi_1_dfm_mx0,
      z_out_4_3);
  median_max2_8_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(pixel_processing_window_8_lpi_1_dfm,
      median_max2_7_1_lpi_1_dfm_mx0, z_out_2_3);
  median_max2_4_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_5_2_lpi_1_dfm_mx0, median_max_4_2_lpi_1_dfm,
      z_out_3_3);
  clip_window_switch_lp_3_nor_nl <= NOT(clip_window_switch_lp_3_equal_tmp OR clip_window_switch_lp_3_equal_tmp_1
      OR clip_window_switch_lp_3_equal_tmp_2);
  pixel_processing_window_8_lpi_1_dfm <= MUX1HOT_v_3_4_2(system_input_window_7_sva,
      buffer_qr_1_lpi_1_dfm_mx0, clip_window_switch_lp_3_asn_2_itm, system_input_din_sva_1,
      STD_LOGIC_VECTOR'( clip_window_switch_lp_3_nor_nl & clip_window_switch_lp_3_equal_tmp
      & clip_window_switch_lp_3_equal_tmp_1 & clip_window_switch_lp_3_equal_tmp_2));
  median_max2_7_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(pixel_processing_window_6_lpi_1_dfm,
      clip_window_qr_2_lpi_1_dfm_mx0, L1a_if_slc_L1a_if_acc_4_3_itm);
  median_max_5_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max2_6_1_lpi_1_dfm_mx0, median_max2_5_1_lpi_1_dfm,
      z_out_4_3);
  median_max2_6_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(clip_window_qr_2_lpi_1_dfm_mx0, pixel_processing_window_6_lpi_1_dfm,
      L1a_if_slc_L1a_if_acc_4_3_itm);
  clip_window_switch_lp_1_nor_nl <= NOT(clip_window_switch_lp_1_equal_tmp OR clip_window_switch_lp_1_equal_tmp_1
      OR clip_window_switch_lp_1_equal_tmp_2);
  pixel_processing_window_6_lpi_1_dfm <= MUX1HOT_v_3_4_2(system_input_window_7_sva,
      buffer_qr_1_lpi_1_dfm_mx0, system_input_window_6_sva, buffer_qr_lpi_1_dfm_mx0,
      STD_LOGIC_VECTOR'( clip_window_switch_lp_1_nor_nl & clip_window_switch_lp_1_equal_tmp
      & clip_window_switch_lp_1_equal_tmp_1 & clip_window_switch_lp_1_equal_tmp_2));
  clip_window_qr_2_lpi_1_dfm_mx0 <= MUX_v_3_2_2(buffer_qr_1_lpi_1_dfm_mx0, system_input_window_7_sva,
      clip_window_last_col_0_sva_3);
  buffer_qr_1_lpi_1_dfm_mx0 <= MUX_v_3_2_2(buffer_buf_rsci_q_d, buffer_t0_sva_1,
      buffer_sel_1_0_sva_dfm);
  clip_window_switch_lp_1_equal_tmp <= clip_window_first_row_0_sva_5 AND (NOT clip_window_last_col_0_sva_3);
  clip_window_switch_lp_1_equal_tmp_1 <= clip_window_last_col_0_sva_3 AND (NOT clip_window_first_row_0_sva_5);
  clip_window_switch_lp_1_equal_tmp_2 <= NOT(clip_window_last_col_0_sva_3 OR clip_window_first_row_0_sva_5);
  buffer_qr_lpi_1_dfm_mx0 <= MUX_v_3_2_2(buffer_t0_sva_1, buffer_buf_rsci_q_d, buffer_sel_1_0_sva_dfm);
  clip_window_switch_lp_3_equal_tmp <= clip_window_last_row_0_sva_7 AND (NOT clip_window_last_col_0_sva_3);
  clip_window_switch_lp_3_equal_tmp_1 <= clip_window_last_col_0_sva_3 AND (NOT clip_window_last_row_0_sva_7);
  clip_window_switch_lp_3_equal_tmp_2 <= NOT(clip_window_last_col_0_sva_3 OR clip_window_last_row_0_sva_7);
  median_max2_6_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_7_lpi_1_dfm, median_max_6_lpi_1_dfm,
      z_out_2_3);
  median_max2_5_lpi_1_dfm_mx0 <= MUX_v_3_2_2(median_max_4_1_lpi_1_dfm, median_max_5_3_lpi_1_dfm,
      z_out_3_3);
  L1b_if_acc_15_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max2_7_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max2_8_lpi_1_dfm_mx0), 3),
      4) + UNSIGNED'( "0001"), 4));
  L1b_if_acc_15_itm_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1b_if_acc_15_nl),
      4)), 3);
  L1b_if_acc_14_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max2_5_3_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT L1b_asn_4_mx1w1), 3), 4) + UNSIGNED'(
      "0001"), 4));
  L1b_if_acc_14_itm_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1b_if_acc_14_nl),
      4)), 3);
  L1b_if_acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max_2_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max2_4_lpi_1_dfm_mx0), 3),
      4) + UNSIGNED'( "0001"), 4));
  L1b_if_acc_13_itm_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1b_if_acc_13_nl),
      4)), 3);
  or_dcpl <= NOT(mcu_ready_sva AND in_data_vld_rsci_d);
  and_dcpl_11 <= else_io_read_in_data_vld_rsc_svs AND system_input_output_vld_sva_dfm;
  and_dcpl_33 <= mcu_ready_sva AND else_io_read_in_data_vld_rsc_svs;
  and_dcpl_44 <= asn_itm AND else_io_read_in_data_vld_rsc_svs;
  and_dcpl_45 <= and_dcpl_44 AND system_input_output_vld_sva_dfm;
  and_dcpl_57 <= system_input_land_1_lpi_1_dfm_1 AND pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs_1;
  nor_tmp_4 <= system_input_land_1_lpi_1_dfm_1 AND system_input_output_vld_sva_dfm
      AND else_io_read_in_data_vld_rsc_svs AND mcu_ready_sva;
  nand_6_nl <= NOT((NOT(system_input_land_1_lpi_1_dfm_1 AND system_input_output_vld_sva_dfm
      AND else_io_read_in_data_vld_rsc_svs)) AND mcu_ready_sva);
  mux_tmp_3 <= MUX_s_1_2_2(nor_tmp_4, nand_6_nl, if_if_if_and_tmp);
  and_dcpl_64 <= (NOT asn_itm) AND if_if_if_and_mdf_sva_2;
  L1a_if_acc_14_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_asn_11_mx0w1)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max_7_2_lpi_1_dfm_mx0), 3),
      4) + UNSIGNED'( "0001"), 4));
  L1a_if_slc_L1a_if_acc_14_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1a_if_acc_14_nl),
      4)), 3);
  L1a_if_acc_13_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_asn_16_mx0w1)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max_5_1_lpi_1_dfm_mx0), 3),
      4) + UNSIGNED'( "0001"), 4));
  L1a_if_slc_L1a_if_acc_13_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1a_if_acc_13_nl),
      4)), 3);
  L1a_if_acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max_8_1_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max2_9_lpi_1_dfm_mx0), 3),
      4) + UNSIGNED'( "0001"), 4));
  L1a_if_slc_L1a_if_acc_12_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1a_if_acc_12_nl),
      4)), 3);
  L1b_if_acc_12_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max2_7_2_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max2_8_2_lpi_1_dfm_mx0),
      3), 4) + UNSIGNED'( "0001"), 4));
  L1b_if_slc_L1b_if_acc_12_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1b_if_acc_12_nl),
      4)), 3);
  L1b_if_acc_11_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & median_max_4_lpi_1_dfm_mx0)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT median_max2_6_2_lpi_1_dfm_mx0),
      3), 4) + UNSIGNED'( "0001"), 4));
  L1b_if_slc_L1b_if_acc_11_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1b_if_acc_11_nl),
      4)), 3);
  L1a_if_acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & pixel_processing_window_6_lpi_1_dfm)
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(NOT clip_window_qr_2_lpi_1_dfm_mx0),
      3), 4) + UNSIGNED'( "0001"), 4));
  L1a_if_slc_L1a_if_acc_4_3_itm <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(L1a_if_acc_4_nl),
      4)), 3);
  and_116_cse <= and_2_tmp AND (fsm_output(3));
  and_120_cse <= and_dcpl_33 AND (fsm_output(4));
  and_128_cse <= (NOT(mcu_ready_sva AND else_io_read_in_data_vld_rsc_svs)) AND (fsm_output(4));
  and_141_cse <= and_dcpl_44 AND system_input_output_vld_sva_dfm AND pixel_processing_if_pixel_processing_if_if_nor_itm
      AND (fsm_output(6));
  and_143_cse <= pixel_processing_if_pixel_processing_if_if_nor_itm_2 AND system_input_output_vld_sva_dfm_st_2
      AND else_io_read_in_data_vld_rsc_svs_st_2 AND asn_itm_1 AND main_stage_0_2
      AND (fsm_output(3));
  and_146_cse <= and_dcpl_64 AND (fsm_output(6));
  and_147_cse <= ((NOT(pixel_processing_if_pixel_processing_if_if_nor_itm_2 AND system_input_output_vld_sva_dfm_st_2
      AND else_io_read_in_data_vld_rsc_svs_st_2)) OR (NOT(asn_itm_1 AND main_stage_0_2)))
      AND (fsm_output(3));
  and_148_cse <= (NOT mux_tmp_3) AND (fsm_output(5));
  and_154_cse <= (NOT mcu_ready_sva) AND if_if_if_and_tmp AND (fsm_output(5));
  or_tmp_33 <= nor_tmp_4 AND (fsm_output(5));
  or_tmp_42 <= and_2_cse AND (fsm_output(5));
  or_tmp_48 <= or_dcpl OR (NOT (fsm_output(3)));
  or_tmp_56 <= TO_STDLOGIC(fsm_output(5 DOWNTO 4)/=STD_LOGIC_VECTOR'("00"));
  mcu_data_rsci_adr_d_mx0c2 <= and_154_cse OR ((NOT mcu_ready_sva) AND (fsm_output(4)));
  mcu_data_rsci_adr_d_mx0c3 <= and_146_cse OR (and_dcpl_33 AND system_input_output_vld_sva_dfm
      AND and_dcpl_57 AND (fsm_output(4)));
  nand_2_cse <= NOT(system_input_output_vld_sva_dfm AND else_io_read_in_data_vld_rsc_svs);
  mcu_data_mcu_data_or_nl <= mcu_data_rsci_adr_d_mx0c2 OR mcu_data_rsci_adr_d_mx0c3
      OR or_tmp_33;
  mcu_data_mux1h_1_nl <= MUX1HOT_v_3_4_2(median_max_5_lpi_1_dfm_5, STD_LOGIC_VECTOR'(
      "001"), STD_LOGIC_VECTOR'( "010"), median_max_5_lpi_1_dfm_mx0, STD_LOGIC_VECTOR'(
      and_143_cse & mcu_data_rsci_adr_d_mx0c3 & or_tmp_33 & and_141_cse));
  nand_1_nl <= NOT(nand_2_cse AND asn_itm);
  mux_55_nl <= MUX_s_1_2_2(and_dcpl_45, nand_1_nl, if_if_if_and_mdf_sva_2);
  mux_56_nl <= MUX_s_1_2_2(and_dcpl_64, mux_55_nl, pixel_processing_if_pixel_processing_if_if_nor_itm);
  mcu_data_nor_1_nl <= NOT(and_147_cse OR and_148_cse OR TO_STDLOGIC(fsm_output(2
      DOWNTO 0)/=STD_LOGIC_VECTOR'("000")) OR ((NOT mux_56_nl) AND (fsm_output(6)))
      OR ((nand_2_cse OR (NOT(system_input_land_1_lpi_1_dfm_1 AND pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs_1)))
      AND mcu_ready_sva AND (fsm_output(4))) OR mcu_data_rsci_adr_d_mx0c2);
  mcu_data_and_1_nl <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), mcu_data_mux1h_1_nl,
      mcu_data_nor_1_nl);
  mcu_data_rsci_adr_d <= STD_LOGIC_VECTOR'( "00000") & mcu_data_mcu_data_or_nl &
      mcu_data_and_1_nl;
  pixel_processing_if_if_pixel_processing_if_if_acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(mcu_data_rsci_q_d)
      + UNSIGNED'( "00000000000000000000000000000001"), 32));
  mcu_data_mux1h_nl <= MUX1HOT_v_32_4_2(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pixel_processing_if_if_pixel_processing_if_if_acc_1_nl),
      32)), STD_LOGIC_VECTOR'( "00000000000000000000000000000010"), (STD_LOGIC_VECTOR'(
      "00000000000000000000000") & pixel_processing_if_if_1_asn_itm), STD_LOGIC_VECTOR'(
      "00000000000000000000000000000100"), STD_LOGIC_VECTOR'( and_143_cse & and_154_cse
      & or_tmp_33 & and_146_cse));
  mcu_data_nor_2_nl <= NOT(and_147_cse OR and_148_cse OR (NOT((fsm_output(6)) OR
      (fsm_output(3)) OR (fsm_output(5)))) OR ((asn_itm OR (NOT if_if_if_and_mdf_sva_2))
      AND (fsm_output(6))));
  mcu_data_rsci_d_d <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
      mcu_data_mux1h_nl, mcu_data_nor_2_nl);
  mcu_data_rsci_we_d <= and_143_cse OR (mux_tmp_3 AND (fsm_output(5))) OR and_146_cse;
  mcu_data_rsci_ram_rw_A_internal_RMASK_B_d <= and_141_cse OR ((NOT((NOT(and_dcpl_11
      AND and_dcpl_57)) AND mcu_ready_sva)) AND (fsm_output(4)));
  buffer_buf_mux_3_nl <= MUX_v_10_2_2((system_input_c_sva(9 DOWNTO 0)), (buffer_acc_1_itm_2
      & buffer_slc_buffer_c_5_0_1_itm_2), and_120_cse);
  buffer_buf_nor_nl <= NOT((or_dcpl AND (fsm_output(3))) OR (NOT(TO_STDLOGIC(fsm_output(4
      DOWNTO 3)/=STD_LOGIC_VECTOR'("00")))) OR and_128_cse);
  buffer_buf_rsci_radr_d <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), buffer_buf_mux_3_nl,
      buffer_buf_nor_nl);
  buffer_buf_mux_2_nl <= MUX_v_10_2_2(buffer_buf_vinit_ndx_sva, (buffer_acc_3_itm_2
      & buffer_slc_buffer_c_5_0_1_itm_2), and_120_cse);
  buffer_buf_nor_1_nl <= NOT((NOT((fsm_output(1)) OR (fsm_output(4)))) OR and_128_cse);
  buffer_buf_rsci_wadr_d <= MUX_v_10_2_2(STD_LOGIC_VECTOR'("0000000000"), buffer_buf_mux_2_nl,
      buffer_buf_nor_1_nl);
  buffer_buf_rsci_d_d <= MUX_v_3_2_2(STD_LOGIC_VECTOR'("000"), in_data_rsci_d, and_120_cse);
  buffer_buf_rsci_we_d <= (fsm_output(1)) OR and_120_cse;
  buffer_buf_rsci_re_d <= and_116_cse OR and_120_cse;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        out_data_rsci_d_0 <= '0';
      ELSIF ( ((fsm_output(6)) AND asn_itm AND else_io_read_in_data_vld_rsc_svs AND
          system_input_output_vld_sva_dfm) = '1' ) THEN
        out_data_rsci_d_0 <= NOT z_out_3;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        out_data_rsci_ld <= '0';
        in_data_rsci_ld <= '0';
        buffer_buf_buffer_buf_nor_itm_1 <= '0';
        buffer_buf_acc_itm_2 <= STD_LOGIC_VECTOR'( "0000000000");
        median_max_5_lpi_1_dfm_5 <= STD_LOGIC_VECTOR'( "000");
        pixel_processing_if_pixel_processing_if_if_nor_itm_2 <= '0';
        system_input_output_vld_sva_dfm_st_2 <= '0';
        else_io_read_in_data_vld_rsc_svs_st_2 <= '0';
        asn_itm_1 <= '0';
        main_stage_0_2 <= '0';
        buffer_slc_buffer_c_5_0_1_itm_2 <= STD_LOGIC_VECTOR'( "000000");
        buffer_acc_3_itm_2 <= STD_LOGIC_VECTOR'( "0000");
        buffer_acc_1_itm_2 <= STD_LOGIC_VECTOR'( "0000");
        else_io_read_in_data_vld_rsc_svs <= '0';
        clip_window_switch_lp_3_asn_2_itm <= STD_LOGIC_VECTOR'( "000");
        system_input_din_sva_1 <= STD_LOGIC_VECTOR'( "000");
        buffer_t0_sva_1 <= STD_LOGIC_VECTOR'( "000");
        if_if_if_and_mdf_sva_2 <= '0';
      ELSE
        out_data_rsci_ld <= and_dcpl_45 AND (fsm_output(6));
        in_data_rsci_ld <= and_116_cse;
        buffer_buf_buffer_buf_nor_itm_1 <= NOT(TO_STDLOGIC(buffer_buf_vinit_ndx_sva/=STD_LOGIC_VECTOR'("0000000000")));
        buffer_buf_acc_itm_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(buffer_buf_vinit_ndx_sva)
            + UNSIGNED'( "1111111111"), 10));
        median_max_5_lpi_1_dfm_5 <= MUX_v_3_2_2(median_max2_5_lpi_1_dfm_mx0, median_max2_6_lpi_1_dfm_mx0,
            and_102_nl);
        pixel_processing_if_pixel_processing_if_if_nor_itm_2 <= pixel_processing_if_pixel_processing_if_if_nor_itm;
        system_input_output_vld_sva_dfm_st_2 <= system_input_output_vld_sva_dfm_st_1;
        else_io_read_in_data_vld_rsc_svs_st_2 <= else_io_read_in_data_vld_rsc_svs_st_1;
        asn_itm_1 <= asn_itm;
        main_stage_0_2 <= NOT (fsm_output(2));
        buffer_slc_buffer_c_5_0_1_itm_2 <= system_input_c_sva(5 DOWNTO 0);
        buffer_acc_3_itm_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'(
            buffer_sel_1_0_sva_dfm_mx0 & '0' & buffer_sel_1_0_sva_dfm_mx0), 3), 4)
            + UNSIGNED(system_input_c_sva(9 DOWNTO 6)), 4));
        buffer_acc_1_itm_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(system_input_c_sva(9
            DOWNTO 6)) + UNSIGNED'( "0101"), 4));
        else_io_read_in_data_vld_rsc_svs <= MUX_s_1_2_2(in_data_vld_rsci_d, else_io_read_in_data_vld_rsc_svs,
            or_tmp_56);
        clip_window_switch_lp_3_asn_2_itm <= system_input_window_8_sva;
        system_input_din_sva_1 <= in_data_rsci_d;
        buffer_t0_sva_1 <= buffer_buf_rsci_q_d;
        if_if_if_and_mdf_sva_2 <= if_if_if_and_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        buffer_buf_vinit_ndx_sva <= STD_LOGIC_VECTOR'( "1001111111");
      ELSIF ( (fsm_output(2)) = '1' ) THEN
        buffer_buf_vinit_ndx_sva <= buffer_buf_acc_itm_2;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_window_6_sva <= STD_LOGIC_VECTOR'( "000");
        system_input_window_7_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( or_tmp_42 = '1' ) THEN
        system_input_window_6_sva <= buffer_qr_lpi_1_dfm_mx0;
        system_input_window_7_sva <= buffer_qr_1_lpi_1_dfm_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_window_8_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (and_2_cse AND (fsm_output(4))) = '1' ) THEN
        system_input_window_8_sva <= in_data_rsci_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_threshold_sva <= STD_LOGIC_VECTOR'( "100");
      ELSIF ( (and_itm AND (fsm_output(5))) = '1' ) THEN
        pixel_processing_threshold_sva <= mcu_data_rsci_q_d(2 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_r_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( (NOT(or_dcpl OR system_input_system_input_nand_tmp OR (NOT (fsm_output(3)))))
          = '1' ) THEN
        system_input_r_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_if_2_qelse_acc_nl),
            32)), system_input_if_2_system_input_if_2_nand_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_frame_sva <= STD_LOGIC_VECTOR'( "000000001");
      ELSIF ( ((NOT or_dcpl) AND system_input_system_input_or_tmp AND clip_window_clip_window_and_1_tmp
          AND clip_window_clip_window_and_tmp AND (fsm_output(3))) = '1' ) THEN
        pixel_processing_frame_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(pixel_processing_frame_sva)
            + UNSIGNED'( "000000001"), 9));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_window_4_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( or_tmp_48 = '0' ) THEN
        system_input_window_4_sva <= system_input_window_7_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_window_3_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( or_tmp_48 = '0' ) THEN
        system_input_window_3_sva <= system_input_window_6_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_window_5_sva <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( or_tmp_48 = '0' ) THEN
        system_input_window_5_sva <= system_input_window_8_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_r_filter_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( (NOT(or_dcpl OR (NOT(system_input_system_input_or_tmp AND clip_window_clip_window_and_1_tmp))
          OR (NOT (fsm_output(3))))) = '1' ) THEN
        system_input_r_filter_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_if_1_qelse_acc_nl),
            32)), clip_window_switch_lp_2_not_4_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_c_filter_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( or_tmp_48 = '0' ) THEN
        system_input_c_filter_sva <= system_input_c_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_c_sva <= STD_LOGIC_VECTOR'( "00000000000000000000000000000000");
      ELSIF ( or_tmp_48 = '0' ) THEN
        system_input_c_sva <= MUX_v_32_2_2(STD_LOGIC_VECTOR'("00000000000000000000000000000000"),
            STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_else_2_acc_nl), 32)),
            system_input_system_input_nand_tmp);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_output_vld_sva <= '0';
      ELSIF ( reg_system_input_system_input_output_vld_and_cse = '1' ) THEN
        system_input_output_vld_sva <= system_input_system_input_or_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        mcu_ready_sva <= '0';
      ELSIF ( (fsm_output(5)) = '1' ) THEN
        mcu_ready_sva <= if_if_if_and_tmp OR mcu_ready_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_if_pixel_processing_if_if_nor_itm <= '0';
        system_input_output_vld_sva_dfm_st_1 <= '0';
        else_io_read_in_data_vld_rsc_svs_st_1 <= '0';
      ELSIF ( reg_pixel_processing_if_pixel_processing_if_if_pixel_processing_if_if_and_cse
          = '1' ) THEN
        pixel_processing_if_pixel_processing_if_if_nor_itm <= NOT(TO_STDLOGIC(pixel_processing_if_if_acc_tmp/=STD_LOGIC_VECTOR'("000"))
            OR (pixel_processing_frame_sva(0)));
        system_input_output_vld_sva_dfm_st_1 <= system_input_system_input_or_tmp;
        else_io_read_in_data_vld_rsc_svs_st_1 <= in_data_vld_rsci_d;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_if_asn_itm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (mcu_ready_sva AND (fsm_output(5))) = '1' ) THEN
        pixel_processing_if_asn_itm <= pixel_processing_threshold_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max_7_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((mcu_ready_sva AND L1b_if_acc_15_itm_3 AND (fsm_output(5))) OR and_104_rgt)
          = '1' ) THEN
        median_max_7_lpi_1_dfm <= MUX_v_3_2_2(median_max2_7_lpi_1_dfm_mx0, median_max2_8_lpi_1_dfm_mx0,
            and_104_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max_5_3_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
        median_max_6_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( reg_median_median_max_or_2_cse = '1' ) THEN
        median_max_5_3_lpi_1_dfm <= MUX_v_3_2_2(median_max2_5_3_lpi_1_dfm_mx0, L1b_asn_4_mx1w1,
            median_max_and_7_rgt);
        median_max_6_lpi_1_dfm <= MUX_v_3_2_2(L1b_asn_4_mx1w1, median_max2_5_3_lpi_1_dfm_mx0,
            median_max_and_7_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max_4_1_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( ((mcu_ready_sva AND L1b_if_acc_13_itm_3 AND (fsm_output(5))) OR and_108_rgt)
          = '1' ) THEN
        median_max_4_1_lpi_1_dfm <= MUX_v_3_2_2(median_max2_4_lpi_1_dfm_mx0, median_max_2_lpi_1_dfm_mx0,
            and_108_rgt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        buffer_sel_1_0_sva_1 <= '0';
      ELSIF ( (reg_system_input_system_input_output_vld_and_cse OR (fsm_output(2)))
          = '1' ) THEN
        buffer_sel_1_0_sva_1 <= buffer_sel_1_0_sva_dfm_mx0 OR (NOT(mcu_ready_sva
            AND (fsm_output(3))));
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        asn_itm <= '0';
      ELSIF ( ((fsm_output(6)) OR (fsm_output(2))) = '1' ) THEN
        asn_itm <= mcu_ready_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        clip_window_last_row_0_sva_7 <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        clip_window_last_row_0_sva_7 <= clip_window_clip_window_and_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_if_if_1_asn_itm <= STD_LOGIC_VECTOR'( "000000000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        pixel_processing_if_if_1_asn_itm <= pixel_processing_frame_sva;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs_1 <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs_1 <= pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_land_1_lpi_1_dfm_1 <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        system_input_land_1_lpi_1_dfm_1 <= system_input_land_1_lpi_1_dfm;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max2_1_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        median_max2_1_lpi_1_dfm <= MUX_v_3_2_2(median_max2_0_lpi_1_dfm_1_mx0, median_max_1_2_lpi_1_dfm_mx0,
            median_max2_and_5_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max_2_2_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        median_max_2_2_lpi_1_dfm <= MUX_v_3_2_2(L1b_asn_44_mx0w1, median_max2_2_2_lpi_1_dfm_mx0,
            median_max_and_3_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max2_3_2_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        median_max2_3_2_lpi_1_dfm <= MUX_v_3_2_2(median_max_2_1_lpi_1_dfm_mx0, median_max_3_1_lpi_1_dfm_mx0,
            median_max2_and_3_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max_4_2_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        median_max_4_2_lpi_1_dfm <= MUX_v_3_2_2(median_max2_3_1_lpi_1_dfm_mx0, median_max2_4_1_lpi_1_dfm_mx0,
            median_max_and_1_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        median_max2_5_1_lpi_1_dfm <= STD_LOGIC_VECTOR'( "000");
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        median_max2_5_1_lpi_1_dfm <= MUX_v_3_2_2(system_input_window_8_sva, system_input_window_7_sva,
            median_max2_median_max2_nor_nl);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        clip_window_first_row_0_sva_5 <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        clip_window_first_row_0_sva_5 <= clip_window_clip_window_nor_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        clip_window_last_col_0_sva_3 <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        clip_window_last_col_0_sva_3 <= clip_window_clip_window_and_1_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        system_input_output_vld_sva_dfm <= '0';
      ELSIF ( or_tmp_56 = '0' ) THEN
        system_input_output_vld_sva_dfm <= system_input_system_input_or_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        buffer_sel_1_0_sva_dfm <= '0';
      ELSIF ( (fsm_output(4)) = '0' ) THEN
        buffer_sel_1_0_sva_dfm <= buffer_sel_1_0_sva_dfm_mx0;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        and_2_cse <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        and_2_cse <= and_2_tmp;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        and_itm <= '0';
      ELSIF ( (fsm_output(3)) = '1' ) THEN
        and_itm <= pixel_processing_if_if_1_pixel_processing_if_if_1_if_and_svs AND
            system_input_land_1_lpi_1_dfm AND system_input_system_input_or_tmp AND
            in_data_vld_rsci_d AND mcu_ready_sva;
      END IF;
    END IF;
  END PROCESS;
  and_102_nl <= and_dcpl_11 AND (NOT z_out_1_3);
  system_input_if_2_qelse_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_r_sva)
      + SIGNED'( "00000000000000000000000000000001"), 32));
  system_input_if_2_system_input_if_2_nand_nl <= NOT(TO_STDLOGIC(system_input_r_sva=STD_LOGIC_VECTOR'("00000000000000000000000011101111")));
  system_input_if_1_qelse_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_r_filter_sva)
      + SIGNED'( "00000000000000000000000000000001"), 32));
  clip_window_switch_lp_2_not_4_nl <= NOT clip_window_clip_window_and_tmp;
  system_input_else_2_acc_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(system_input_c_sva)
      + SIGNED'( "00000000000000000000000000000001"), 32));
  median_max2_and_5_nl <= z_out_3 AND (NOT (fsm_output(4)));
  median_max_and_3_nl <= z_out_1_3 AND (NOT (fsm_output(4)));
  median_max2_and_3_nl <= z_out_5_3 AND (NOT (fsm_output(4)));
  median_max_and_1_nl <= z_out_6_3 AND (NOT (fsm_output(4)));
  median_max2_median_max2_nor_nl <= NOT((NOT(clip_window_clip_window_and_tmp OR (NOT
      z_out_2_3))) OR (fsm_output(4)));
  thresholding_if_mux1h_3_nl <= MUX1HOT_v_3_3_2((NOT pixel_processing_if_asn_itm),
      median_max2_0_lpi_1_dfm_1_mx0, median_max_8_lpi_1_dfm_mx0, STD_LOGIC_VECTOR'(
      (fsm_output(6)) & (fsm_output(3)) & (fsm_output(5))));
  thresholding_if_mux1h_4_nl <= MUX1HOT_v_3_3_2(median_max_5_lpi_1_dfm_mx0, (NOT
      median_max_1_2_lpi_1_dfm_mx0), (NOT median_max2_9_lpi_1_dfm_1_mx0), STD_LOGIC_VECTOR'(
      (fsm_output(6)) & (fsm_output(3)) & (fsm_output(5))));
  acc_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & thresholding_if_mux1h_3_nl
      & '1') + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(thresholding_if_mux1h_4_nl &
      '1'), 4), 5), 5));
  z_out_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_nl), 5)), 4);
  L1b_if_mux1h_3_nl <= MUX1HOT_v_3_3_2(median_max2_1_lpi_1_dfm, median_max2_5_lpi_1_dfm_mx0,
      L1b_asn_44_mx0w1, STD_LOGIC_VECTOR'( (fsm_output(5)) & (fsm_output(6)) & (fsm_output(3))));
  L1b_if_mux1h_4_nl <= MUX1HOT_v_3_3_2((NOT median_max2_2_lpi_1_dfm_mx0), (NOT median_max2_6_lpi_1_dfm_mx0),
      (NOT median_max2_2_2_lpi_1_dfm_mx0), STD_LOGIC_VECTOR'( (fsm_output(5)) & (fsm_output(6))
      & (fsm_output(3))));
  acc_1_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1b_if_mux1h_3_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1b_if_mux1h_4_nl & '1'), 4), 5), 5));
  z_out_1_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_1_nl), 5)),
      4);
  L1a_if_mux1h_6_nl <= MUX1HOT_v_3_3_2(median_max_6_lpi_1_dfm, system_input_window_7_sva,
      median_max2_7_1_lpi_1_dfm_mx0, STD_LOGIC_VECTOR'( (fsm_output(6)) & (fsm_output(3))
      & (fsm_output(5))));
  clip_window_mux_2_nl <= MUX_v_3_2_2(system_input_window_8_sva, system_input_window_7_sva,
      clip_window_clip_window_and_tmp);
  L1a_if_mux1h_7_nl <= MUX1HOT_v_3_3_2((NOT median_max_7_lpi_1_dfm), (NOT clip_window_mux_2_nl),
      (NOT pixel_processing_window_8_lpi_1_dfm), STD_LOGIC_VECTOR'( (fsm_output(6))
      & (fsm_output(3)) & (fsm_output(5))));
  acc_2_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_if_mux1h_6_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1a_if_mux1h_7_nl & '1'), 4), 5), 5));
  z_out_2_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_2_nl), 5)),
      4);
  L1a_if_mux1h_8_nl <= MUX1HOT_v_3_3_2(median_max_4_1_lpi_1_dfm, pixel_processing_window_0_lpi_1_dfm,
      median_max_4_2_lpi_1_dfm, STD_LOGIC_VECTOR'( (fsm_output(6)) & (fsm_output(3))
      & (fsm_output(5))));
  L1a_if_mux1h_9_nl <= MUX1HOT_v_3_3_2((NOT median_max_5_3_lpi_1_dfm), (NOT clip_window_qr_lpi_1_dfm_mx0),
      (NOT median_max_5_2_lpi_1_dfm_mx0), STD_LOGIC_VECTOR'( (fsm_output(6)) & (fsm_output(3))
      & (fsm_output(5))));
  acc_3_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_if_mux1h_8_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1a_if_mux1h_9_nl & '1'), 4), 5), 5));
  z_out_3_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_3_nl), 5)),
      4);
  L1a_if_mux_9_nl <= MUX_v_3_2_2(pixel_processing_window_2_lpi_1_dfm, median_max2_5_1_lpi_1_dfm,
      fsm_output(5));
  L1a_if_mux_10_nl <= MUX_v_3_2_2((NOT clip_window_qr_3_lpi_1_dfm_mx0), (NOT median_max2_6_1_lpi_1_dfm_mx0),
      fsm_output(5));
  acc_4_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_if_mux_9_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1a_if_mux_10_nl & '1'), 4), 5), 5));
  z_out_4_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_4_nl), 5)),
      4);
  L1a_if_mux_11_nl <= MUX_v_3_2_2(median_max_2_1_lpi_1_dfm_mx0, median_max2_5_2_lpi_1_dfm_mx0,
      fsm_output(5));
  L1a_if_mux_12_nl <= MUX_v_3_2_2((NOT median_max_3_1_lpi_1_dfm_mx0), (NOT median_max_7_1_lpi_1_dfm_mx0),
      fsm_output(5));
  acc_5_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_if_mux_11_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1a_if_mux_12_nl & '1'), 4), 5), 5));
  z_out_5_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_5_nl), 5)),
      4);
  L1b_if_mux_6_nl <= MUX_v_3_2_2(median_max2_3_1_lpi_1_dfm_mx0, median_max2_3_2_lpi_1_dfm,
      fsm_output(5));
  L1b_if_mux_7_nl <= MUX_v_3_2_2((NOT median_max2_4_1_lpi_1_dfm_mx0), (NOT median_max2_4_2_lpi_1_dfm_mx0),
      fsm_output(5));
  acc_6_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1b_if_mux_6_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1b_if_mux_7_nl & '1'), 4), 5), 5));
  z_out_6_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_6_nl), 5)),
      4);
  L1a_if_mux_13_nl <= MUX_v_3_2_2(median_max2_0_lpi_1_dfm_mx0, median_max_2_2_lpi_1_dfm,
      fsm_output(5));
  L1a_if_mux_14_nl <= MUX_v_3_2_2((NOT median_max_1_1_lpi_1_dfm_mx0), (NOT median_max_3_lpi_1_dfm_mx0),
      fsm_output(5));
  acc_7_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1a_if_mux_13_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1a_if_mux_14_nl & '1'), 4), 5), 5));
  z_out_7_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_7_nl), 5)),
      4);
  L1b_if_mux_8_nl <= MUX_v_3_2_2(median_max2_1_1_lpi_1_dfm_mx0, median_max_6_2_lpi_1_dfm_mx0,
      fsm_output(5));
  L1b_if_mux_9_nl <= MUX_v_3_2_2((NOT median_max2_2_1_lpi_1_dfm_mx0), (NOT median_max2_8_1_lpi_1_dfm_mx0),
      fsm_output(5));
  acc_8_nl <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED('1' & L1b_if_mux_8_nl & '1')
      + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(L1b_if_mux_9_nl & '1'), 4), 5), 5));
  z_out_8_3 <= readindex(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(acc_8_nl), 5)),
      4);
END v1;

-- ------------------------------------------------------------------
--  Design Unit:    filter
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.funcs.ALL;
USE work.mgc_ioport_comps_v11.ALL;
USE work.BLOCK_1R1W_RBW_pkg.ALL;


ENTITY filter IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    in_data_rsc_z : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    in_data_rsc_lz : OUT STD_LOGIC;
    in_data_vld_rsc_z : IN STD_LOGIC;
    out_data_rsc_z : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
    out_data_rsc_lz : OUT STD_LOGIC;
    mcu_data_rsc_adr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    mcu_data_rsc_q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    mcu_data_rsc_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    mcu_data_rsc_we : OUT STD_LOGIC
  );
END filter;

ARCHITECTURE v1 OF filter IS
  -- Default Constants
  SIGNAL PWR : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL mcu_data_rsci_adr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mcu_data_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mcu_data_rsci_we_d : STD_LOGIC;
  SIGNAL mcu_data_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mcu_data_rsci_ram_rw_A_internal_RMASK_B_d : STD_LOGIC;
  SIGNAL buffer_buf_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_d_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsci_we_d : STD_LOGIC;
  SIGNAL buffer_buf_rsci_re_d : STD_LOGIC;
  SIGNAL buffer_buf_rsci_q_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsc_we : STD_LOGIC;
  SIGNAL buffer_buf_rsc_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsc_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsc_re : STD_LOGIC;
  SIGNAL buffer_buf_rsc_q : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsc_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);

  SIGNAL buffer_buf_rsc_comp_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsc_comp_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsc_comp_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsc_comp_q : STD_LOGIC_VECTOR (2 DOWNTO 0);

  COMPONENT Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      q : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      adr : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      adr_d : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      we_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      ram_rw_A_internal_RMASK_B_d : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL mcu_data_rsci_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mcu_data_rsci_q : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mcu_data_rsci_adr : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mcu_data_rsci_adr_d_1 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mcu_data_rsci_d_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL mcu_data_rsci_q_d_1 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  COMPONENT Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen
    PORT(
      we : OUT STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      wadr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      re : OUT STD_LOGIC;
      q : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      radr : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      radr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      wadr_d : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      d_d : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      we_d : IN STD_LOGIC;
      re_d : IN STD_LOGIC;
      q_d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL buffer_buf_rsci_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsci_wadr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_q : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsci_radr : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_radr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_wadr_d_1 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL buffer_buf_rsci_d_d_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL buffer_buf_rsci_q_d_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);

  COMPONENT filter_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      in_data_rsc_z : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
      in_data_rsc_lz : OUT STD_LOGIC;
      in_data_vld_rsc_z : IN STD_LOGIC;
      out_data_rsc_z : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      out_data_rsc_lz : OUT STD_LOGIC;
      mcu_data_rsci_adr_d : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      mcu_data_rsci_d_d : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      mcu_data_rsci_we_d : OUT STD_LOGIC;
      mcu_data_rsci_q_d : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      mcu_data_rsci_ram_rw_A_internal_RMASK_B_d : OUT STD_LOGIC;
      buffer_buf_rsci_radr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      buffer_buf_rsci_wadr_d : OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
      buffer_buf_rsci_d_d : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
      buffer_buf_rsci_we_d : OUT STD_LOGIC;
      buffer_buf_rsci_re_d : OUT STD_LOGIC;
      buffer_buf_rsci_q_d : IN STD_LOGIC_VECTOR (2 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL filter_core_inst_in_data_rsc_z : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL filter_core_inst_out_data_rsc_z : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL filter_core_inst_mcu_data_rsci_adr_d : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL filter_core_inst_mcu_data_rsci_d_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL filter_core_inst_mcu_data_rsci_q_d : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL filter_core_inst_buffer_buf_rsci_radr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL filter_core_inst_buffer_buf_rsci_wadr_d : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL filter_core_inst_buffer_buf_rsci_d_d : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL filter_core_inst_buffer_buf_rsci_q_d : STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN
  -- Default Constant Signal Assignments
  PWR <= '1';

  buffer_buf_rsc_comp : work.block_1r1w_rbw_pkg.BLOCK_1R1W_RBW
    GENERIC MAP(
      data_width => 3,
      addr_width => 10,
      depth => 640
      )
    PORT MAP(
      radr => buffer_buf_rsc_comp_radr,
      wadr => buffer_buf_rsc_comp_wadr,
      d => buffer_buf_rsc_comp_d,
      we => buffer_buf_rsc_we,
      re => buffer_buf_rsc_re,
      clk => clk,
      q => buffer_buf_rsc_comp_q
    );
  buffer_buf_rsc_comp_radr <= buffer_buf_rsc_radr;
  buffer_buf_rsc_comp_wadr <= buffer_buf_rsc_wadr;
  buffer_buf_rsc_comp_d <= buffer_buf_rsc_d;
  buffer_buf_rsc_q <= buffer_buf_rsc_comp_q;

  mcu_data_rsci : Xilinx_RAMS_BLOCK_SPRAM_RBW_rwport_32_9_512_4_gen
    PORT MAP(
      we => mcu_data_rsc_we,
      d => mcu_data_rsci_d,
      q => mcu_data_rsci_q,
      adr => mcu_data_rsci_adr,
      adr_d => mcu_data_rsci_adr_d_1,
      d_d => mcu_data_rsci_d_d_1,
      we_d => mcu_data_rsci_we_d,
      q_d => mcu_data_rsci_q_d_1,
      ram_rw_A_internal_RMASK_B_d => mcu_data_rsci_ram_rw_A_internal_RMASK_B_d
    );
  mcu_data_rsc_d <= mcu_data_rsci_d;
  mcu_data_rsci_q <= mcu_data_rsc_q;
  mcu_data_rsc_adr <= mcu_data_rsci_adr;
  mcu_data_rsci_adr_d_1 <= mcu_data_rsci_adr_d;
  mcu_data_rsci_d_d_1 <= mcu_data_rsci_d_d;
  mcu_data_rsci_q_d <= mcu_data_rsci_q_d_1;

  buffer_buf_rsci : Xilinx_RAMS_BLOCK_1R1W_RBW_rwport_3_10_640_7_gen
    PORT MAP(
      we => buffer_buf_rsc_we,
      d => buffer_buf_rsci_d,
      wadr => buffer_buf_rsci_wadr,
      re => buffer_buf_rsc_re,
      q => buffer_buf_rsci_q,
      radr => buffer_buf_rsci_radr,
      radr_d => buffer_buf_rsci_radr_d_1,
      wadr_d => buffer_buf_rsci_wadr_d_1,
      d_d => buffer_buf_rsci_d_d_1,
      we_d => buffer_buf_rsci_we_d,
      re_d => buffer_buf_rsci_re_d,
      q_d => buffer_buf_rsci_q_d_1
    );
  buffer_buf_rsc_d <= buffer_buf_rsci_d;
  buffer_buf_rsc_wadr <= buffer_buf_rsci_wadr;
  buffer_buf_rsci_q <= buffer_buf_rsc_q;
  buffer_buf_rsc_radr <= buffer_buf_rsci_radr;
  buffer_buf_rsci_radr_d_1 <= buffer_buf_rsci_radr_d;
  buffer_buf_rsci_wadr_d_1 <= buffer_buf_rsci_wadr_d;
  buffer_buf_rsci_d_d_1 <= buffer_buf_rsci_d_d;
  buffer_buf_rsci_q_d <= buffer_buf_rsci_q_d_1;

  filter_core_inst : filter_core
    PORT MAP(
      clk => clk,
      rst => rst,
      in_data_rsc_z => filter_core_inst_in_data_rsc_z,
      in_data_rsc_lz => in_data_rsc_lz,
      in_data_vld_rsc_z => in_data_vld_rsc_z,
      out_data_rsc_z => filter_core_inst_out_data_rsc_z,
      out_data_rsc_lz => out_data_rsc_lz,
      mcu_data_rsci_adr_d => filter_core_inst_mcu_data_rsci_adr_d,
      mcu_data_rsci_d_d => filter_core_inst_mcu_data_rsci_d_d,
      mcu_data_rsci_we_d => mcu_data_rsci_we_d,
      mcu_data_rsci_q_d => filter_core_inst_mcu_data_rsci_q_d,
      mcu_data_rsci_ram_rw_A_internal_RMASK_B_d => mcu_data_rsci_ram_rw_A_internal_RMASK_B_d,
      buffer_buf_rsci_radr_d => filter_core_inst_buffer_buf_rsci_radr_d,
      buffer_buf_rsci_wadr_d => filter_core_inst_buffer_buf_rsci_wadr_d,
      buffer_buf_rsci_d_d => filter_core_inst_buffer_buf_rsci_d_d,
      buffer_buf_rsci_we_d => buffer_buf_rsci_we_d,
      buffer_buf_rsci_re_d => buffer_buf_rsci_re_d,
      buffer_buf_rsci_q_d => filter_core_inst_buffer_buf_rsci_q_d
    );
  filter_core_inst_in_data_rsc_z <= in_data_rsc_z;
  out_data_rsc_z <= filter_core_inst_out_data_rsc_z;
  mcu_data_rsci_adr_d <= filter_core_inst_mcu_data_rsci_adr_d;
  mcu_data_rsci_d_d <= filter_core_inst_mcu_data_rsci_d_d;
  filter_core_inst_mcu_data_rsci_q_d <= mcu_data_rsci_q_d;
  buffer_buf_rsci_radr_d <= filter_core_inst_buffer_buf_rsci_radr_d;
  buffer_buf_rsci_wadr_d <= filter_core_inst_buffer_buf_rsci_wadr_d;
  buffer_buf_rsci_d_d <= filter_core_inst_buffer_buf_rsci_d_d;
  filter_core_inst_buffer_buf_rsci_q_d <= buffer_buf_rsci_q_d;

END v1;



