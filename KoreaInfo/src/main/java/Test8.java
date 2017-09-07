
public class Test8 {

	public static void main(String[] args) {

		int a;
		int b;
		boolean isPrime = true;				//소수인지 아닌지 판별하기 위한 boolean형 변수

		for (a = 2; a <= 100; a++) {		//1은 소수가 아니므로 2부터 시작해서 100까지 비교
			for (b = 2; b <= a - 1; b++) {	//2부터 a-1까지의 수로 나눌 수를 b로 준비
				if (a % b == 0 && a != b) {	//변수a를 b로 나누어서 나머지가 0인 것이 하나라도 있으면 그 수는 소수가 아님
					isPrime = false;		
				}
			}
			if (isPrime == true) {			//isPrime 변수가 true일 때 a를 출력
				System.out.println(a);		
			}
			isPrime = true;					//비교를 위해 소수변수를 다시 true로 바꿔줌
		}

	}

}
/*
 * [문제8] 1~100 사이의 소수를 계산하는 프로그램을 작성하시오. (참고)소수 : 1과 자기 자신 외에는 나누어 떨어지지 않는 수
 */