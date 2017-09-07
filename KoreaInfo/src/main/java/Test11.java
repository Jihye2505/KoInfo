import java.util.Scanner;

public class Test11 {

	public static void main(String[] args) {
		int a,b;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("두 개의 정수를 입력하세요 : ");
		a = sc.nextInt();					//변수 a는 입력받은 첫번째 수
		b = sc.nextInt();					//변수 b는 입력받은 두번째 수
		System.out.println(a+"와"+b+"중 큰 수는 "+max(a,b)+"이고, 작은 수는 "+min(a,b)+"이다.");
	}	//각각의 메소드에 변수를 넣어 호출하여 출력

	public static int max(int x, int y) {	//int x와 y를 매개변수로 하는 매소드 max
		if (x > y) {						//x가 클경우 실행
			return x;						//x를 반환
		} else {							//x가 크지 않은 경우
			return y;						//y를 반환
		}
	}

	public static int min(int x, int y) {	//int x와 y를 매개변수로 하는 매소드 min
		if (x < y) {						//y가 클경우 실행
			return x;						//x를 반환
		} else {							//y가 크지 않을 경우
			return y;						//y를 반환
		}
	}
}
// [문제11] 두 정수를 매개변수로 받아 큰 수를 반환하는 max() 메소드와 작은 수를 반환하는 min() 메소드를 작성하시오.