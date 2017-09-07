
public class Test12 {

	public static void main(String[] args) {
		
		 long n1, n2, n3;					//수열을 계산하기 위한 3개의 변수, 숫자가 커질 것을 고려하여 자료형은 long
		  n1 = 1;							//수열의 첫번째 항인 변수 n1을 1로 고정
		  n2 = 1;							//두번째 항인 변수 n2도 1로 선언
		 long sum = n1+n2;					//모든 수열의 항을 더하기 위한 변수 sum 또한 자료형은 long
		  
		  for(int i = 3 ; i <= 50 ; i++){	//항의 갯수를 세기위한 변수 i는 첫번째항과 두번째 항을 셋으므로 3부터 시작
		   n3 = n1 + n2;					//3번째 항인 n3는 첫번째와 두번째 항을 더한 값
		   sum += n3;						//변수 sum에 세번째 항도 더해주기
		   n1 = n2;							//두번째 항을 첫번째 항 자리로 옮기기
		   n2 = n3;							//세번째 항은 두번째 항으로 옮기기
		  }									//반복문을 반복..
		  System.out.println("피보나치 수열의 50번 째 항 까지의 합은 "+sum);

	}
}
/*
 * [문제12] 피보나치(Fibonacci) 수열 (1 + 1 + 2 + 3 + 5 + 8 + 13 + ...)의 50번 째 항 까지의 합을
 * 구하는 프로그램을 작성하시오.
 */