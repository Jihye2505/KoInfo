public class Test10 {

	public static void main(String[] args) {
		int i, sum=0;					//1~100의 정수를 위한 변수 i, 3과 5의 공배수를 더한 값을 넣기 위한 변수 sum
		for (i = 1; i <= 100; i++) {	//정수 i를 증가시켜 100까지 살피기 위한 반복문
			if (i%3 == 0 || i%5 == 0) {	//3과 5의 배수를 구하기 위한 조건문
				sum += i;				//sum변수에 sum+i를 대입
			}							//반복문을 돌아 1~100까지 정수 중 3과 5의 공배수를 구하고 더하여 sum에 대입
		}
		System.out.println(sum);		//변수i가 100을 넘으면 for문을 나와서 sum을 출력
	}
}
/* [문제10] 1~100까지의 정수 중 3의 배수 이거나 5의 배수인 정수의 합을 구하는 프로그램을 작성하시오. */