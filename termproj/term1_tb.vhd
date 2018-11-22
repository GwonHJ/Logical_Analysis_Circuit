LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY term1_tb IS
END term1_tb;
 
ARCHITECTURE behavior OF term1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT term1
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         c50 : IN  std_logic;
         c100 : IN  std_logic;
         c500 : IN  std_logic;
         coffee : IN  std_logic;
         LED_coffee : OUT  std_logic;
         return50 : OUT  std_logic;
         return100 : OUT  std_logic;
         return500 : OUT  std_logic;
         give_coffee : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal c50 : std_logic := '0';
   signal c100 : std_logic := '0';
   signal c500 : std_logic := '0';
   signal coffee : std_logic := '0';

    --Outputs
   signal LED_coffee : std_logic;
   signal return50 : std_logic;
   signal return100 : std_logic;
   signal return500 : std_logic;
   signal give_coffee : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: term1 PORT MAP (
          clk => clk,
          reset => reset,
          c50 => c50,
          c100 => c100,
          c500 => c500,
          coffee => coffee,
          LED_coffee => LED_coffee,
          return50 => return50,
          return100 => return100,
          return500 => return500,
          give_coffee => give_coffee
        );

   -- Clock process definitions
   clk_process :process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin      
      -- hold reset state for 100 ns.
      wait for 100 ns;   

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
   proc1: process
   begin
      wait for 100ns;
      wait for clk_period*10;
      c50 <= '0';
      wait for clk_period;
      c50 <= '1';
      wait for clk_period;
      c50 <= '0';
      wait for clk_period;
      c50 <= '0';
      wait for clk_period;
      
      c50 <= '0';
      wait for clk_period;
      wait;
      end process;
      
   proc2: process
   begin
      wait for 100ns;
      wait for clk_period*10;
      c100 <= '1';
      wait for clk_period;
      c100 <= '0';
      wait for clk_period;
      c100 <= '1';
      wait for clk_period;
      c100 <= '0';
      wait for clk_period;
      c100 <= '1';
      wait for clk_period;
      c100 <= '0';
      wait for clk_period;
      
      c100 <= '0';
      wait for clk_period;
      wait;
      end process;
   
   proc3: process
   begin
      wait for 100ns;
      wait for clk_period*10;
      c500 <= '0';
      wait for clk_period;
      c500 <= '0';
      wait for clk_period;
      c500 <= '0';
      wait for clk_period;
      c500 <= '0';
      wait for clk_period;
      c500 <= '0';
      wait for clk_period;
      c500 <= '1';
      wait for clk_period;
      
      c500 <= '0';
      wait for clk_period;
      wait;
      end process;
      
   pro4 : process
   begin
      wait for 100ns;
      wait for clk_period*30;
      
      coffee <= '1';
      wait for clk_period;
      coffee <= '0';
      wait;
      
      end process;
      
      
END;