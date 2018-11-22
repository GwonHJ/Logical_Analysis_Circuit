 library ieee;
use ieee.std_logic_1164.all;

entity term1 is
  port ( clk, reset : in std_logic;
         c50, c100, c500, coffee : in std_logic; --c : ���� �ִ°�
         LED_coffee, return50, return100, return500 : out std_logic;--LED_coffee : Ŀ�Ǹ� ������ �ִ� �������� Ȯ��, return : 650���̻��� ���� ������ return���� ��ȯ
         give_coffee : out std_logic ) ; --give_coffe : Ŀ�����
end term1 ;

architecture Behavioral of term1 is

type states is ( won0, won50, won100, won150, won200, won250, won300, won350, won400, won450, won500, won550, won600, won650 ); -- ��� ���

signal won_state: states;  

begin

      state : process( clk,reset,c50,c100,c500,coffee ) 
         begin
         if reset = '1' then   --reset�̸� �� ������ �����
            won_state   <= won0;
            LED_coffee   <= '0';
            return50      <= '0';
            return100   <= '0';
            return500   <=   '0';
            give_coffee  <= '0';
         
         elsif (clk'event and clk = '1') then
            case won_state is
               when won0 =>        -- ��ȭ �Ѿ��� 0         
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
                  elsif (c500 = '1') then    --500���� ������ ���� Ŀ�Ǹ� ������ �ִ� ���°� �Ǿ��� ������ LED�� ���� ���´�
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
               
               when won50 =>     -- ��ȭ �Ѿ��� 50   
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
                  
               when won100 =>      --��ȭ �Ѿ��� 100
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
                  
               when won150 =>      --��ȭ �Ѿ��� 150
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
                  
               when won200 =>      --��ȭ �Ѿ��� 200
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
                  elsif (c500 = '1') then    -- 650�� �̻� ���� �� ���� ������ 200���϶� 500���� ������ 500���� �״�� ��ȯ�ȴ�.
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
                                 
               when won250 =>      --��ȭ �Ѿ��� 250
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
                  
               when won300 =>      --��ȭ �Ѿ��� 300
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
                     won_state   <=   won300;   --650�� �̻��� ���� �� ��� 500���� �ٽ� ��ȯ
                     LED_coffee   <= '1';   --��ȯ�ϰ� ������ ���� ���� 300���̴ϱ� LED�� ���� ��� ���´�
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
                  
               when won350 =>      --��ȭ �Ѿ��� 350
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
                  
                  
               when won400 =>      --��ȭ �Ѿ��� 400
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
                  
                                 
               when won450 =>      --��ȭ �Ѿ��� 450
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
                  
               when won500 =>      --��ȭ �Ѿ��� 500
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
               when won550 =>      --��ȭ �Ѿ��� 550
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

               when won600 =>      --��ȭ �Ѿ��� 600
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
                     won_state   <=   won600;   --100���� ������ 700���̶� 100���� �ٽ� ��ȯ��
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

               when won650 =>      --��ȭ �Ѿ��� 650
                  if ( coffee = '1' ) then
                     won_state   <= won350;
                     LED_coffee  <= '1';
                       return50    <= '0';  
                     return100   <= '0';
                     return500   <=   '0';
                     give_coffee <= '1';
                  elsif ( c50 = '1' ) then 
                     won_state   <= won650;   --50���� ������ 700���� �Ǽ� 50���� ��ȯ��
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