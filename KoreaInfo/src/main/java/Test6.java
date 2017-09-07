import java.util.*;

public class Test6 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        
        System.out.println("정수 5개를 입력하세요 . ");
        System.out.printf("값1 : ");
        int num1 = sc.nextInt();
        System.out.printf("값2 : ");
        int num2 = sc.nextInt();
        System.out.printf("값3 : ");
        int num3 = sc.nextInt();
        System.out.printf("값4 : ");
        int num4 = sc.nextInt();
        System.out.printf("값5 : ");
        int num5 = sc.nextInt();

        int i = 0; 			//정수를 두개씩 비교하기 위한 변수
        
        if(num1>num2){		//값1과 2를 비교하여 값1이 클 경우 실행
            i = num1;		//값1을 변수 i에 대입
            num1 = num2;	//값2를 값1에 대입
            num2 = i;		//변수 i에 담겨있던 사용자가 입력한 값1을 값2에 대입하여 출력과 나머지 숫자들과의 비교를 준비
        }					//나머지 변수들도 똑같은 방법으로 진행하여 모든 수를 두개씩 짝지어 한번씩 비교
        if(num1>num3){
            i = num1;
            num1 = num3;
            num3 = i;
        }
        if(num1>num4){
            i = num1;
            num1 = num4;
            num4 = i;
        }
        if(num1>num5){
            i = num1;
            num1 = num5;
            num5 = i;
        }
        if(num2>num3){
            i = num2;
            num2 = num3;
            num3 = i;
        }
        
        if(num2>num4){
            i = num2;
            num2 = num4;
            num4 = i;
        }
        if(num2>num5){
            i = num2;
            num2 = num5;
            num5 = i;
        }
        if(num3>num4){
            i = num3;
            num3 = num4;
            num4 = i;
        }
        if(num3>num5){
            i = num3;
            num3 = num5;
            num5 = i;
        }
        if(num4>num5){
            i = num4;
            num4 = num5;
            num5 = i;
        }
              
        System.out.printf("정렬 후 : %d,%d,%d,%d,%d",num1,num2,num3,num4,num5); //오름차순으로 출력.
        
    }
}