--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
  GENERIC(
   pixels_y :  INTEGER := 478;   --row that first color will persist until
   pixels_x :  INTEGER := 600);  --column that first color will persist until
  PORT(
	 jumpE : IN STD_LOGIC;
	 dirSw : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	 initSw : IN STD_LOGIC;
	 image_gen_clk: IN STD_LOGIC;
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0') );
    
	 END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS

SIGNAL MAX : INTEGER := 50000000;
SIGNAL MED : INTEGER := MAX/2;

SIGNAL conteo,conteo1,conteo2,conteo3,conteo4,conteo5,conteo6 : INTEGER RANGE 0 TO MAX;
SIGNAL subClk : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
SIGNAL sense : INTEGER := 0;

SIGNAL luffx0,luffx1,luffx2,luffx3,luffx4,luffx5,luffx6,luffx7,luffx8 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffx9,luffx10,luffx11,luffx12,luffx13,luffx14,luffx15,luffx16,luffx17 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffx18,luffx19,luffx20,luffx21,luffx22,luffx23,luffx24,luffx25,luffx26 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffx27,luffx28,luffx29,luffx30,luffx31,luffx32,luffx33,luffx34,luffx35 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffx36,luffx37,luffx38,luffx39,luffx40,luffx41,luffx42,luffx43,luffx44 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffx45,luffx46,luffx47,luffx48 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy0,luffy1,luffy2,luffy3,luffy4,luffy5,luffy6,luffy7,luffy8 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy9,luffy10,luffy11,luffy12,luffy13,luffy14,luffy15,luffy16,luffy17 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy18,luffy19,luffy20,luffy21,luffy22,luffy23,luffy24,luffy25,luffy26 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy27,luffy28,luffy29,luffy30,luffy31,luffy32,luffy33,luffy34,luffy35 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy36,luffy37,luffy38,luffy39,luffy40,luffy41,luffy42,luffy43,luffy44 : INTEGER RANGE -100 TO 640 :=0;
SIGNAL luffy45,luffy46,luffy47,luffy48 : INTEGER RANGE -100 TO 640 :=0;

SIGNAL plat0x1 : INTEGER RANGE 0 TO 640 :=540;
SIGNAL plat1x1 : INTEGER RANGE 0 TO 640;
SIGNAL plat0y1 : INTEGER RANGE 0 TO 478 :=108;
SIGNAL plat1y1 : INTEGER RANGE 0 TO 478;

SIGNAL fall : STD_LOGIC := '0';

SIGNAL jumpD : INTEGER RANGE 0 TO 10;
SIGNAL jumping : STD_LOGIC :='0';

BEGIN

  PROCESS(image_gen_clk)
	
	BEGIN
		
		IF(image_gen_clk'EVENT AND image_gen_clk = '1') THEN
			IF(conteo < MAX) THEN
				conteo <= conteo+1;
			ELSE
				conteo <= 1;
			END IF;
			IF(conteo <= MED) THEN
				subClk(0) <= '0';
			ELSE
				subClk(0) <= '1';
			END IF;
		END IF;
  END PROCESS;
  

  PROCESS(image_gen_clk,disp_ena, row, column)
   
 BEGIN



 IF(disp_ena = '1') THEN        --display time
     
		
	              
      IF ((row >= 20 and row <=28) and (column>=288 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 20 and row <=28) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 20 and row <=28) and (column>=312 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 20 and row <=28) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 20 and row <=28) and (column>=344 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 28 and row <=36) and (column>=272 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 28 and row <=36) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 28 and row <=36) and (column>=320 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 28 and row <=36) and (column>=344 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 36 and row <=44) and (column>=256 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 36 and row <=44) and (column>=272 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');		
      ELSIF ((row >= 36 and row <=44) and (column>=288 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 36 and row <=44) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 36 and row <=44) and (column>=312 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 36 and row <=44) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 36 and row <=44) and (column>=344 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 36 and row <=44) and (column>=368 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 44 and row <=52) and (column>=248 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 44 and row <=52) and (column>=264 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 44 and row <=52) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 44 and row <=52) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 44 and row <=52) and (column>=336 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 44 and row <=52) and (column>=384 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 52 and row <=60) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 52 and row <=60) and (column>=256 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 52 and row <=60) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 52 and row <=60) and (column>=304 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 52 and row <=60) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 52 and row <=60) and (column>=328 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 52 and row <=60) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 60 and row <=68) and (column>=240 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 60 and row <=68) and (column>=240 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 60 and row <=68) and (column>=264 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 60 and row <=68) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 60 and row <=68) and (column>=312 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 60 and row <=68) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 60 and row <=68) and (column>=336 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 60 and row <=68) and (column>=392 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 68 and row <=76) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 68 and row <=76) and (column>=256 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 68 and row <=76) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 68 and row <=76) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 68 and row <=76) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 68 and row <=76) and (column>=336 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 68 and row <=76) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 76 and row <=84) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 76 and row <=84) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=280 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 76 and row <=84) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 76 and row <=84) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=344 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 76 and row <=84) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 76 and row <=84) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 84 and row <=92) and (column>=232 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 84 and row <=92) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=264 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 84 and row <=92) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=336 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=352 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 84 and row <=92) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 84 and row <=92) and (column>=408 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 92 and row <=100) and (column>=232 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 92 and row <=100) and (column>=264 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=272 and column<=304)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=344 and column<=376)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=376 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 92 and row <=100) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 92 and row <=100) and (column>=400 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=232 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 100 and row <=108) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=264 and column<=312)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 100 and row <=108) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=336 and column<=384)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 100 and row <=108) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 100 and row <=108) and (column>=408 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=232 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');		
		ELSIF ((row >= 108 and row <=116) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 108 and row <=116) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 108 and row <=116) and (column>=408 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=232 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=272 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 116 and row <=124) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=352 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=368 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 116 and row <=124) and (column>=408 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 124 and row <=132) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 124 and row <=132) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 124 and row <=132) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=232 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=240 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 132 and row <=140) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 132 and row <=140) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 132 and row <=140) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=352 and column<=384)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 132 and row <=140) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 132 and row <=140) and (column>=392 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 132 and row <=140) and (column>=408 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 140 and row <=148) and (column>=232 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=248 and column<=256)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=264 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 140 and row <=148) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 140 and row <=148) and (column>=336 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=352 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 140 and row <=148) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 140 and row <=148) and (column>=400 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=240 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=256 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 148 and row <=156) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=352 and column<=392)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 148 and row <=156) and (column>=392 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 156 and row <=164) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 156 and row <=164) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 156 and row <=164) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 156 and row <=164) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 156 and row <=164) and (column>=344 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 164 and row <=172) and (column>=280 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 164 and row <=172) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 164 and row <=172) and (column>=304 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 164 and row <=172) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 164 and row <=172) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 164 and row <=172) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 164 and row <=172) and (column>=352 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=264 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=288 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=304 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 172 and row <=180) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 172 and row <=180) and (column>=344 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=360 and column<=384)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 172 and row <=180) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=256 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=264 and column<=280)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 180 and row <=188) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 180 and row <=188) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 180 and row <=188) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=264 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=272 and column<=280)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 188 and row <=196) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 188 and row <=196) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 188 and row <=196) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 188 and row <=196) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=368 and column<=384)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 188 and row <=196) and (column>=384 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=264 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=272 and column<=296)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=352 and column<=376)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 196 and row <=204) and (column>=376 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 204 and row <=212) and (column>=264 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 204 and row <=212) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 204 and row <=212) and (column>=288 and column<=360)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 204 and row <=212) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 204 and row <=212) and (column>=376 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 212 and row <=220) and (column>=264 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 212 and row <=220) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 212 and row <=220) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 212 and row <=220) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 212 and row <=220) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 212 and row <=220) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 212 and row <=220) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 212 and row <=220) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 212 and row <=220) and (column>=368 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=272 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 220 and row <=228) and (column>=280 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=312 and column<=320)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 220 and row <=228) and (column>=352 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 228 and row <=236) and (column>=280 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 228 and row <=236) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 228 and row <=236) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 228 and row <=236) and (column>=312 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 228 and row <=236) and (column>=352 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 228 and row <=236) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 236 and row <=244) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 236 and row <=244) and (column>=296 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 236 and row <=244) and (column>=320 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 236 and row <=244) and (column>=336 and column<=352)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
		ELSIF ((row >= 236 and row <=244) and (column>=352 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 244 and row <=252) and (column>=304 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 244 and row <=252) and (column>=320 and column<=328)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 244 and row <=252) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		
			ELSIF ((row >= luffy0+100 and row <=luffy0+108) and (column>=luffx0+50 and column<=luffx0+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy1+100 and row <=luffy1+108) and (column>=luffx1+54 and column<=luffx1+58)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy2+100 and row <=luffy2+108) and (column>=luffx2+58 and column<=luffx2+62)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy3+92 and row <=luffy3+96) and (column>=luffx3+38 and column<=luffx3+42)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy4+92 and row <=luffy4+100) and (column>=luffx4+50 and column<=luffx4+62)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy5+92 and row <=luffy5+96) and (column>=luffx5+70 and column<=luffx5+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy6+88 and row <=luffy6+92) and (column>=luffx6+42 and column<=luffx6+46)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy7+84 and row <=luffy7+92) and (column>=luffx7+46 and column<=luffx7+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy8+80 and row <=luffy8+92) and (column>=luffx8+54 and column<=luffx8+58)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy9+84 and row <=luffy9+92) and (column>=luffx9+58 and column<=luffx9+66)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy10+88 and row <=luffy10+92) and (column>=luffx10+66 and column<=luffx10+70)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy11+80 and row <=luffy11+84) and (column>=luffx11+50 and column<=luffx11+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy12+80 and row <=luffy12+84) and (column>=luffx12+58 and column<=luffx12+62)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy13+72 and row <=luffy13+76) and (column>=luffx13+42 and column<=luffx13+70)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy14+64 and row <=luffy14+72) and (column>=luffx14+38 and column<=luffx14+46)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy15+60 and row <=luffy15+72) and (column>=luffx15+46 and column<=luffx15+50)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy16+60 and row <=luffy16+72) and (column>=luffx16+50 and column<=luffx16+62)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy17+60 and row <=luffy17+72) and (column>=luffx17+62 and column<=luffx17+66)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy18+60 and row <=luffy18+72) and (column>=luffx18+66 and column<=luffx18+70)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy19+60 and row <=luffy19+64) and (column>=luffx19+42 and column<=luffx19+46)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy20+64 and row <=luffy20+72) and (column>=luffx20+70 and column<=luffx20+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy21+60 and row <=luffy21+64) and (column>=luffx21+28 and column<=luffx21+36)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy22+60 and row <=luffy22+64) and (column>=luffx22+78 and column<=luffx22+86)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy23+56 and row <=luffy23+60) and (column>=luffx23+24 and column<=luffx23+32)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy24+56 and row <=luffy24+60) and (column>=luffx24+82 and column<=luffx24+90)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy25+56 and row <=luffy25+60) and (column>=luffx25+46 and column<=luffx25+50)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy26+56 and row <=luffy26+60) and (column>=luffx26+50 and column<=luffx26+54)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy27+56 and row <=luffy27+60) and (column>=luffx27+54 and column<=luffx27+58)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy28+56 and row <=luffy28+60) and (column>=luffx28+58 and column<=luffx28+62)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy30+56 and row <=luffy30+60) and (column>=luffx30+62 and column<=luffx30+66)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '1');
			ELSIF ((row >= luffy29+52 and row <=luffy29+56) and (column>=luffx29+32 and column<=luffx29+42)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy31+52 and row <=luffy31+56) and (column>=luffx31+74 and column<=luffx31+82)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy32+48 and row <=luffy32+52) and (column>=luffx32+62 and column<=luffx32+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy34+48 and row <=luffy34+52) and (column>=luffx34+74 and column<=luffx34+82)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy33+48 and row <=luffy33+52) and (column>=luffx33+70 and column<=luffx33+74)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy34+48 and row <=luffy34+52) and (column>=luffx34+42 and column<=luffx34+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy34+48 and row <=luffy34+52) and (column>=luffx34+38 and column<=luffx34+42)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy35+44 and row <=luffy35+48) and (column>=luffx35+38 and column<=luffx35+42)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy36+44 and row <=luffy36+48) and (column>=luffx36+42 and column<=luffx36+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy37+44 and row <=luffy37+48) and (column>=luffx37+54 and column<=luffx37+62)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy38+44 and row <=luffy38+48) and (column>=luffx38+62 and column<=luffx38+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+44 and row <=luffy39+48) and (column>=luffx39+74 and column<=luffx39+82)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+40 and row <=luffy39+44) and (column>=luffx39+42 and column<=luffx39+54)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+40 and row <=luffy39+44) and (column>=luffx39+54 and column<=luffx39+62)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+40 and row <=luffy39+44) and (column>=luffx39+62 and column<=luffx39+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+36 and row <=luffy39+40) and (column>=luffx39+42 and column<=luffx39+74)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
			ELSIF ((row >= luffy39+32 and row <=luffy39+36) and (column>=luffx39+46 and column<=luffx39+70)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
				
			
			
		ELSIF ((row >= plat1y1+108 and row <=plat1y1+124) and (column>=plat1x1+0 and column<=plat1y1+100)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= plat0y1 and row <=plat0y1+16) and (column>=plat0x1 and column<=plat0x1+100)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
				
				
		ELSIF ((row >= 470 and row <=478) and (column>=8 and column<=24)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=24 and column<=104)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=104 and column<=120)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=120 and column<=136)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=136 and column<=152)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=152 and column<=176)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=176 and column<=192)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=192 and column<=216)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=216 and column<=224)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=224 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=344 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=376 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=392 and column<=424)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=424 and column<=448)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=448 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=464 and column<=496)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=496 and column<=520)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=520 and column<=544)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=544 and column<=560)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=560 and column<=584)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=584 and column<=600)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=600 and column<=616)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 470 and row <=478) and (column>=616 and column<=632)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=8 and column<=16)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=16 and column<=56)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=56 and column<=64)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=64 and column<=112)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=112 and column<=128)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=128 and column<=136)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=136 and column<=144)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=144 and column<=184)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=184 and column<=200)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=200 and column<=208)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=208 and column<=216)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=216 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=264 and column<=288)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=288 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=344 and column<=360)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=368 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=400 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=416 and column<=456)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 462 and row <=470) and (column>=456 and column<=472)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=8 and column<=16)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=16 and column<=48)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=48 and column<=64)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=64 and column<=120)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=120 and column<=128)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=128 and column<=136)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=136 and column<=144)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=144 and column<=184)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=184 and column<=200)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=200 and column<=208)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=208 and column<=216)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=216 and column<=256)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=256 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=272 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=296 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=336 and column<=352)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=352 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=360 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=408 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 454 and row <=462) and (column>=464 and column<=472)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=8 and column<=16)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=16 and column<=40)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=40 and column<=80)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=80 and column<=120)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=120 and column<=128)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=128 and column<=136)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=136 and column<=152)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=152 and column<=184)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=184 and column<=200)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=200 and column<=208)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=208 and column<=224)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=224 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=264 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=280 and column<=296)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=296 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=304 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=352 and column<=360)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=360 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=392 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=416 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 446 and row <=454) and (column>=464 and column<=472)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=8 and column<=48)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=48 and column<=56)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=56 and column<=80)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=80 and column<=112)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=112 and column<=128)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=128 and column<=144)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=144 and column<=160)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=160 and column<=176)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=176 and column<=192)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=192 and column<=216)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=216 and column<=232)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=232 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=272 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=288 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=304 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=328 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=344 and column<=352)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=352 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=368 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=384 and column<=400)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=400 and column<=408)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=408 and column<=424)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=424 and column<=456)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 438 and row <=446) and (column>=456 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=8 and column<=40)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=40 and column<=56)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=56 and column<=64)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=64 and column<=72)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=72 and column<=120)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=120 and column<=152)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=152 and column<=184)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=184 and column<=224)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=224 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=240 and column<=264)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=264 and column<=280)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=280 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=288 and column<=296)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=296 and column<=320)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=320 and column<=336)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=336 and column<=360)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=360 and column<=368)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=368 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=376 and column<=392)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=392 and column<=400)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=400 and column<=416)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=416 and column<=448)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 430 and row <=438) and (column>=448 and column<=456)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=16 and column<=32)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=32 and column<=72)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=72 and column<=80)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=80 and column<=88)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=88 and column<=104)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=104 and column<=112)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=112 and column<=120)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=120 and column<=160)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=160 and column<=176)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=176 and column<=224)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=224 and column<=232)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=232 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=248 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=272 and column<=288)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=288 and column<=304)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=304 and column<=312)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=312 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=328 and column<=360)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=360 and column<=384)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=384 and column<=424)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=424 and column<=440)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=440 and column<=456)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 422 and row <=430) and (column>=456 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=16 and column<=32)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=32 and column<=96)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=96 and column<=104)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=104 and column<=152)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=152 and column<=160)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=160 and column<=168)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=168 and column<=176)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=176 and column<=184)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=184 and column<=192)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=192 and column<=224)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=224 and column<=240)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=240 and column<=248)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=248 and column<=272)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=272 and column<=304)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=304 and column<=328)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=328 and column<=336)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=336 and column<=344)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=344 and column<=360)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=368 and column<=376)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=376 and column<=432)) THEN 
			   red <= (OTHERS => '0');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=432 and column<=448)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=448 and column<=464)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '1');
				blue<=(OTHERS => '0');
		ELSIF ((row >= 414 and row <=422) and (column>=464 and column<=472)) THEN 
			   red <= (OTHERS => '1');
				green<=(OTHERS => '0');
				blue<=(OTHERS => '0');
		
		
		
		
		
		else		
				red <= (OTHERS => '0');  --es el fondo
				green	<= (OTHERS => '0');
				blue <= (OTHERS => '0');
		end if; 
		
		if (image_gen_clk'EVENT AND image_gen_clk='1' AND sense = 0 AND initSw = '1') THEN
			
			conteo1 <= conteo1+10;
			if(conteo1 >= 22000000) THEN
				conteo1 <= 0;
				plat1x1 <= plat1x1+1;
				plat1y1 <= plat1y1+1;
				plat0x1 <= plat0x1-1;
				plat0y1 <= plat0y1+1;
				if(plat1y1 > 186) THEN
					sense <= 1;
				END IF;
			END IF;
		ELSIF(image_gen_clk'EVENT AND image_gen_clk='1' AND sense = 1 AND initSw = '1') THEN
			conteo1 <= conteo1+10;
			if(conteo1 >= 22000000) THEN
				conteo1 <= 0;
				plat1x1 <= plat1x1-1;
				plat1y1 <= plat1y1-1;
				plat0x1 <= plat0x1+1;
				plat0y1 <= plat0y1-1;
				END IF;
				if(plat1y1 < 1) THEN
					sense <= 0;
					plat1x1 <= 0;
					plat1y1 <= 0;
					plat0x1 <= 540;
					plat0y1 <= 108;
			END IF;
		END IF;
		
		if (image_gen_clk'EVENT AND image_gen_clk='1' AND dirSw(0) = '1') THEN
			conteo2 <= conteo2+10;
			IF(conteo2 >= 22000000) THEN 
				conteo2 <= 0;
				luffx0 <= luffx0-1;
				luffx1 <= luffx1-1;
				luffx2 <= luffx2-1;
				luffx3 <= luffx3-1;
				luffx4 <= luffx4-1;
				luffx5 <= luffx5-1;
				luffx6 <= luffx6-1;
				luffx7 <= luffx7-1;
				luffx8 <= luffx8-1;
				luffx9 <= luffx9-1;
				luffx10 <= luffx10-1;
				luffx11 <= luffx11-1;
				luffx12 <= luffx12-1;
				luffx13 <= luffx13-1;
				luffx14 <= luffx14-1;
				luffx15 <= luffx15-1;
				luffx16 <= luffx16-1;
				luffx17 <= luffx17-1;
				luffx18 <= luffx18-1;
				luffx19 <= luffx19-1;
				luffx20 <= luffx20-1;
				luffx21 <= luffx21-1;
				luffx22 <= luffx22-1;
				luffx23 <= luffx23-1;
				luffx24 <= luffx24-1;
				luffx25 <= luffx25-1;
				luffx26 <= luffx26-1;
				luffx27 <= luffx27-1;
				luffx28 <= luffx28-1;
				luffx29 <= luffx29-1;
				luffx30 <= luffx30-1;
				luffx31 <= luffx31-1;
				luffx32 <= luffx32-1;
				luffx33 <= luffx33-1;
				luffx34 <= luffx34-1;
				luffx35 <= luffx35-1;
				luffx36 <= luffx36-1;
				luffx37 <= luffx37-1;
				luffx38 <= luffx38-1;
				luffx39 <= luffx39-1;
				END IF;
				IF(luffx0 < -100) THEN
					luffx0 <= 0;
					luffx1 <= 0;
					luffx2 <= 0;
					luffx3 <= 0;
					luffx4 <= 0;
					luffx5 <= 0;
					luffx6 <= 0;
					luffx7 <= 0;
					luffx8 <= 0;
					luffx9 <= 0;
					luffx10 <= 0;
					luffx11 <= 0;
					luffx12 <= 0;
					luffx13 <= 0;
					luffx14 <= 0;
					luffx15 <= 0;
					luffx16 <= 0;
					luffx17 <= 0;
					luffx18 <= 0;
					luffx19 <= 0;
					luffx20 <= 0;
					luffx21 <= 0;
					luffx22 <= 0;
					luffx23 <= 0;
					luffx24 <= 0;
					luffx25 <= 0;
					luffx26 <= 0;
					luffx27 <= 0;
					luffx28 <= 0;
					luffx29 <= 0;
					luffx30 <= 0;
					luffx31 <= 0;
					luffx32 <= 0;
					luffx33 <= 0;
					luffx34 <= 0;
					luffx35 <= 0;
					luffx36 <= 0;
					luffx37 <= 0;
					luffx38 <= 0;
					luffx39 <= 0;
				END IF;
			END IF;
		if (image_gen_clk'EVENT AND image_gen_clk='1' AND dirSw(1) = '1') THEN
			conteo3 <= conteo3+10;
			IF(conteo3 >= 22000000) THEN 
				conteo3 <= 0;
				luffx0 <= luffx0+1;
				luffx1 <= luffx1+1;
				luffx2 <= luffx2+1;
				luffx3 <= luffx3+1;
				luffx4 <= luffx4+1;
				luffx5 <= luffx5+1;
				luffx6 <= luffx6+1;
				luffx7 <= luffx7+1;
				luffx8 <= luffx8+1;
				luffx9 <= luffx9+1;
				luffx10 <= luffx10+1;
				luffx11 <= luffx11+1;
				luffx12 <= luffx12+1;
				luffx13 <= luffx13+1;
				luffx14 <= luffx14+1;
				luffx15 <= luffx15+1;
				luffx16 <= luffx16+1;
				luffx17 <= luffx17+1;
				luffx18 <= luffx18+1;
				luffx19 <= luffx19+1;
				luffx20 <= luffx20+1;
				luffx21 <= luffx21+1;
				luffx22 <= luffx22+1;
				luffx23 <= luffx23+1;
				luffx24 <= luffx24+1;
				luffx25 <= luffx25+1;
				luffx26 <= luffx26+1;
				luffx27 <= luffx27+1;
				luffx28 <= luffx28+1;
				luffx29 <= luffx29+1;
				luffx30 <= luffx30+1;
				luffx31 <= luffx31+1;
				luffx32 <= luffx32+1;
				luffx33 <= luffx33+1;
				luffx34 <= luffx34+1;
				luffx35 <= luffx35+1;
				luffx36 <= luffx36+1;
				luffx37 <= luffx37+1;
				luffx38 <= luffx38+1;
				luffx39 <= luffx39+1;
				END IF;
				IF(luffx0 > 640) THEN
					luffx0 <= 0;
					luffx1 <= 0;
					luffx2 <= 0;
					luffx3 <= 0;
					luffx4 <= 0;
					luffx5 <= 0;
					luffx6 <= 0;
					luffx7 <= 0;
					luffx8 <= 0;
					luffx9 <= 0;
					luffx10 <= 0;
					luffx11 <= 0;
					luffx12 <= 0;
					luffx13 <= 0;
					luffx14 <= 0;
					luffx15 <= 0;
					luffx16 <= 0;
					luffx17 <= 0;
					luffx18 <= 0;
					luffx19 <= 0;
					luffx20 <= 0;
					luffx21 <= 0;
					luffx22 <= 0;
					luffx23 <= 0;
					luffx24 <= 0;
					luffx25 <= 0;
					luffx26 <= 0;
					luffx27 <= 0;
					luffx28 <= 0;
					luffx29 <= 0;
					luffx30 <= 0;
					luffx31 <= 0;
					luffx32 <= 0;
					luffx33 <= 0;
					luffx34 <= 0;
					luffx35 <= 0;
					luffx36 <= 0;
					luffx37 <= 0;
					luffx38 <= 0;
					luffx39 <= 0;
				END IF;
			END IF;
			
			if (image_gen_clk'EVENT AND image_gen_clk='1') THEN
			conteo4 <= conteo4+10;
			IF(conteo4 >= 22000000) THEN 
				conteo4 <= 0;
				IF(luffy0 = plat1y1) THEN
					fall <= '0';
				ELSE
					fall <= '1';
				END IF;
			END IF;
			END IF;
			
			if (image_gen_clk'EVENT AND image_gen_clk='1' AND fall = '1' AND jumping = '0') THEN
			conteo5 <= conteo5+10;
			IF(conteo5 >= 22000000) THEN 
				conteo5 <= 0;
				luffy0 <= luffy0+1;
				luffy1 <= luffy1+1;
				luffy2 <= luffy2+1;
				luffy3 <= luffy3+1;
				luffy4 <= luffy4+1;
				luffy5 <= luffy5+1;
				luffy6 <= luffy6+1;
				luffy7 <= luffy7+1;
				luffy8 <= luffy8+1;
				luffy9 <= luffy9+1;
				luffy10 <= luffy10+1;
				luffy11 <= luffy11+1;
				luffy12 <= luffy12+1;
				luffy13 <= luffy13+1;
				luffy14 <= luffy14+1;
				luffy15 <= luffy15+1;
				luffy16 <= luffy16+1;
				luffy17 <= luffy17+1;
				luffy18 <= luffy18+1;
				luffy19 <= luffy19+1;
				luffy20 <= luffy20+1;
				luffy21 <= luffy21+1;
				luffy22 <= luffy22+1;
				luffy23 <= luffy23+1;
				luffy24 <= luffy24+1;
				luffy25 <= luffy25+1;
				luffy26 <= luffy26+1;
				luffy27 <= luffy27+1;
				luffy28 <= luffy28+1;
				luffy29 <= luffy29+1;
				luffy30 <= luffy30+1;
				luffy31 <= luffy31+1;
				luffy32 <= luffy32+1;
				luffy33 <= luffy33+1;
				luffy34 <= luffy34+1;
				luffy35 <= luffy35+1;
				luffy36 <= luffy36+1;
				luffy37 <= luffy37+1;
				luffy38 <= luffy38+1;
				luffy39 <= luffy39+1;
				END IF;
				IF(luffy0 > 640) THEN
					luffy1 <= 0;
					luffy2 <= 0;
					luffy3 <= 0;
					luffy4 <= 0;
					luffy5 <= 0;
					luffy6 <= 0;
					luffy7 <= 0;
					luffy8 <= 0;
					luffy9 <= 0;
					luffy10 <= 0;
					luffy11 <= 0;
					luffy12 <= 0;
					luffy13 <= 0;
					luffy14 <= 0;
					luffy15 <= 0;
					luffy16 <= 0;
					luffy17 <= 0;
					luffy18 <= 0;
					luffy19 <= 0;
					luffy20 <= 0;
					luffy21 <= 0;
					luffy22 <= 0;
					luffy23 <= 0;
					luffy24 <= 0;
					luffy25 <= 0;
					luffy26 <= 0;
					luffy27 <= 0;
					luffy28 <= 0;
					luffy29 <= 0;
					luffy30 <= 0;
					luffy31 <= 0;
					luffy32 <= 0;
					luffy33 <= 0;
					luffy34 <= 0;
					luffy35 <= 0;
					luffy36 <= 0;
					luffy37 <= 0;
					luffy38 <= 0;
					luffy39 <= 0;
				END IF;
			END IF;
			
			if (image_gen_clk'EVENT AND image_gen_clk='1' AND (jumpE = '0' OR jumping='1')) THEN
			conteo6 <= conteo6+10;
			IF(conteo6 >= 22000000) THEN 
				conteo6 <= 0;
				jumping <= '1';
				jumpD <= jumpD+1;
				luffy0 <= luffy0-1;
				luffy1 <= luffy1-1;
				luffy2 <= luffy2-1;
				luffy3 <= luffy3-1;
				luffy4 <= luffy4-1;
				luffy5 <= luffy5-1;
				luffy6 <= luffy6-1;
				luffy7 <= luffy7-1;
				luffy8 <= luffy8-1;
				luffy9 <= luffy9-1;
				luffy10 <= luffy10-1;
				luffy11 <= luffy11-1;
				luffy12 <= luffy12-1;
				luffy13 <= luffy13-1;
				luffy14 <= luffy14-1;
				luffy15 <= luffy15-1;
				luffy16 <= luffy16-1;
				luffy17 <= luffy17-1;
				luffy18 <= luffy18-1;
				luffy19 <= luffy19-1;
				luffy20 <= luffy20-1;
				luffy21 <= luffy21-1;
				luffy22 <= luffy22-1;
				luffy23 <= luffy23-1;
				luffy24 <= luffy24-1;
				luffy25 <= luffy25-1;
				luffy26 <= luffy26-1;
				luffy27 <= luffy27-1;
				luffy28 <= luffy28-1;
				luffy29 <= luffy29-1;
				luffy30 <= luffy30-1;
				luffy31 <= luffy31-1;
				luffy32 <= luffy32-1;
				luffy33 <= luffy33-1;
				luffy34 <= luffy34-1;
				luffy35 <= luffy35-1;
				luffy36 <= luffy36-1;
				luffy37 <= luffy37-1;
				luffy38 <= luffy38-1;
				luffy39 <= luffy39-1;
				IF(jumpD = 10) THEN
					jumpD <= 0;
					jumping <= '0';
				END IF;
				END IF;
				END IF;
				
END IF;  --del enable
  
  END PROCESS;
END behavior;