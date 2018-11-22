 library ieee;
use ieee.std_logic_1164.all;

entity term1 is
  port ( clk, reset : in std_logic;
         c50, c100, c500, coffee : in std_logic; --c : 동전 넣는거
         LED_coffee, return50, return100, return500 : out std_logic;--LED_coffee : 커피를 뽑을수 있는 상태인지 확인, return : 650원이상의 돈을 넣으면 return으로 반환
         give_coffee : out std_logic ) ; --give_coffe : 커피출력
end term1 ;

architecture Behavioral of term1 is

type states is ( won0, won50, won100, won150, won200, won250, won300, won350, won400, won450, won500, won550, won600, won650 ); -- 모든 경우

signal won_state: states;  

begin

      state : process( clk,reset,c50,c100,c500,coffee ) 
         begin
         if reset = '1' then   --reset이면 다 영으로 만든다
            won_state   <= won0;
            LED_coffee   <= '0';
            return50      <= '0';
            return100   <= '0';
            return500   <=   '0';
            give_coffee  <= '0';
         
         elsif (clk'event and clk = '1') then
            case won_state is
               when won0 =>        -- 주화 총액이 0         
                  if ( c50 = '1' ) then 
                     won_state   <= won50;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won100;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    --500원을 넣으면 이제 커피를 뽑을수 있는 상태가 되었기 때문에 LED에 불이 들어온다
                     won_state   <=   won500;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won0;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  end if;
               
               when won50 =>     -- 주화 총액이 50   
                  if ( c50 = '1' ) then 
                     won_state   <= won100;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won150;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won50;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';   
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;
                  
               when won100 =>      --주화 총액이 100
                  if ( c50 = '1' ) then 
                     won_state   <= won150;
                     LED_coffee  <= '0';
                     return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won200;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';   
                     return500   <=   '0'; 
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won600;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';  
                     return500   <=   '0';  
                     give_coffee   <= '0';
                  else
                     won_state   <= won100;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0'; 
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;      
                  
               when won150 =>      --주화 총액이 150
                  if ( c50 = '1' ) then 
                     won_state   <= won200;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won250;
                     LED_coffee   <= '0';
                     return50   <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won150;
                     LED_coffee   <= '0';
                     return50   <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;      
                  
               when won200 =>      --주화 총액이 200
                  if ( c50 = '1' ) then 
                     won_state   <= won200;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won250;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    -- 650원 이상 넣을 수 없기 때문에 200원일때 500원을 넣으면 500원이 그대로 반환된다.
                     won_state   <=   won200;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won200;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                                 
               when won250 =>      --주화 총액이 250
                  if ( c50 = '1' ) then 
                     won_state   <= won250;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won300;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won250;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won250;
                     LED_coffee   <= '0';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
               when won300 =>      --주화 총액이 300
                  if ( coffee = '1' ) then
                     won_state   <= won0;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won350;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won400;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won300;   --650원 이상을 넣을 수 없어서 500원을 다시 반환
                     LED_coffee   <= '1';   --반환하고 나서도 남은 돈이 300원이니까 LED에 불이 계속 들어온다
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won300;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
               when won350 =>      --주화 총액이 350
                  if ( coffee = '1' ) then
                     won_state   <= won50;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won400;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won350;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won350;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
                  
               when won400 =>      --주화 총액이 400
                  if ( coffee = '1' ) then
                     won_state   <= won100;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won450;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won500;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won400;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won400;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
                                 
               when won450 =>      --주화 총액이 450
                  if ( coffee = '1' ) then
                     won_state   <= won150;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won500;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won450;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won450;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
               when won500 =>      --주화 총액이 500
                  if ( coffee = '1' ) then
                     won_state   <= won200;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won600;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won500;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won500;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;
               when won550 =>      --주화 총액이 550
                  if ( coffee = '1' ) then
                     won_state   <= won250;
                     LED_coffee  <= '0';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won600;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won550;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   

               when won600 =>      --주화 총액이 600
                  if ( coffee = '1' ) then
                     won_state   <= won300;
                     LED_coffee  <= '1';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won600;   --100원을 넣으면 700원이라서 100원을 다시 반환함
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '1';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won600;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won600;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;

               when won650 =>      --주화 총액이 650
                  if ( coffee = '1' ) then
                     won_state   <= won350;
                     LED_coffee  <= '1';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won650;   --50원을 넣으면 700원이 되서 50원을 반환함
                     LED_coffee   <= '1';
                     return50      <= '1';  
                     return100   <= '0';
                     return500   <=   '0';    
                     give_coffee   <= '0';
                  elsif (c100 = '1') then    
                     won_state   <=   won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '1';    
                     return500   <=   '0';
                     give_coffee   <= '0';
                  elsif (c500 = '1') then    
                     won_state   <=   won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '1';                     
                     give_coffee   <= '0';
                  else
                     won_state   <= won650;
                     LED_coffee   <= '1';
                     return50      <= '0';  
                     return100   <= '0';
                     return500   <=   '0';                     
                     give_coffee   <= '0';
                  end if;   
                  
               end case;
           end if;
      end process;

end Behavioral;