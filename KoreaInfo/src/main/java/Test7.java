
public class Test7 {

	public static void main(String[] args) {
		
		int i = 1; // 줄바꿈을 위한 변수
		int j = 0; // 공백을 위한 변수
		int k = 0; // 별찍기 위한 변수

		for (i = 1; i <= 4; i++) 				// 줄바꿈을 해주기위한 반복문
		{
			for (j = 3; j >= i; j--) 			// 공백을 위한 반복문
				System.out.print(" ");		 	// 공백 출력
			for (k = 1; k <= i * 2 - 1; k++)	// 홀수의 별을 위한 for문
				System.out.print("*");		 	// 별 출력
			System.out.println(); 				// 줄바꿈
		}

		for (i = 1; i <= 3; i++) 				// 별이 줄어드는 나머지 세줄을 위한 반복문
		{
			for (j = 1; j <= i; j++) 			// 공백을 위한 빈복문
				System.out.print(" "); 			// 공백 출력
			for (k = 5; k >= i * 2 - 1; k--) 	// 홀수의 별을 위한 for문
				System.out.print("*"); 			// 별 출력
				System.out.println(); 			// 줄바꿈
		}
	}
}