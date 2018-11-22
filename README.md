# Logical_Analysis_Circuit(논리회로설계)
# Vendingmachine

구현기능
          ● 필수 기능
          - 프로젝트 주제 : 50원, 100원, 500원짜리 동전을 이용하여 300원짜리 커피를 뽑는 자판기 설계하기
          - 필수 요소 : (입력) c50, c100, c500, reset, coffee
              (출력) give_coffee
          - 최대 입력 가능 금액 : 650원

          ● 추가 기능
          -  LED coffee (출력) : 커피를 뽑을 수 있는 상태가 되면, LED에 불이 들어옴
                   => 현재 상태 확인 가능
          - return50, return100, return500 (출력) : 최대 입력 가능 금액인 650원 이상의 돈을 넣으면 return되도록 만들었다
            ex) 현재 200원이 입력된 상태 + 500원을 추가로 입력 => 500원이 그대로 반환
            
            
            
개요도

![vending](https://user-images.githubusercontent.com/45057466/48911086-1f837400-eeb5-11e8-9c49-4b622c4dda0e.png)


코드 분석

![1](https://user-images.githubusercontent.com/45057466/48911088-1f837400-eeb5-11e8-8563-005be140f66f.png)


      - INPUT : clk, reset, c50, c100, c500, coffee

      - OUTPUT : LED_coffee (뽑을 수 있을 상태인지 확인) 
          give_coffee (커피 출력)
          return50, return100, return500 (최고 금액을 초과 시 return)

      - state를 활용 -> 모든 동전 투입 state가 선언되어야 함. (won0~won650)

      - RESET을 누르면 모든 값을 초기화 해준다.

![2](https://user-images.githubusercontent.com/45057466/48911089-201c0a80-eeb5-11e8-9a61-106283a4f9c8.png)


      - case 문을 이용하여 state활용

      - when won0 => 현재 금액 0원

      - c50 = ‘1’ : 원래 있는 금액 +50원 -> state를  won50으로 변경

      - c100 = ‘1’) : 원래 있는 금액 +100원 -> state를  won100으로 변경

      - c500 = ‘1’) : 원래 있는 금액 +500원 -> state를  won500으로 변경
                  ->LED에 불이들어옴.(300원이 넘었으니까)

      - else : 버튼을 누르지 않을 경우 -> 상태 변화x 
      
      
 ![3](https://user-images.githubusercontent.com/45057466/48911091-201c0a80-eeb5-11e8-880d-3177e6d6ff96.png)
  
      - state가 won300일 때 -> 커피를 뽑을 수 있음

      - if ( coffee = ‘1’ ) <- 앞에서는 커피버튼의 입력을 고려할 일이 없지만 state가 won300일 때 부터는 coffee버튼도 고려해줘야함

      - coffee = ‘1’ -> 커피가 출력(give_coffee <= ‘1’)되고 현재 상태는 won0이된다

      - c500 = ‘1’ -> 최대 입력 가능 금액이 650원인데 현재 상태가 300이므로 500원을 입력할 수 없다 
              -> return500
                (state가 won200일 때부터 500원을 입력하면 반환됨)


![4](https://user-images.githubusercontent.com/45057466/48911084-1f837400-eeb5-11e8-8e8e-96a661955e9f.png)   
      - state가 won600일때는 coffee버튼을 눌러도 여전히 300원이 남아있음
         -> 커피를 뽑을 수 있는 상태이다.
          -> LED에 불이 꺼지지 않는다.

      - 600원에 100원을 더 넣으면 700원 -> 최고금액 초과
                  ->return100
