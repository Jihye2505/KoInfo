import java.util.Scanner;

/*[문제13] 배열에 값 입력 및 입력된 데이터 검색하여 삭제하기
아래 샘플코드를 바탕으로 비어있는 두 개 메서드를 완성하시오. (테스트 클래스는 별도 작성)*/
public class Test13 {
	
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		DataTest dt = new DataTest();			//클래스 객체 생성
		int choice;
		String s;

		while (true) {							//메뉴 출력 & 선택을 반복
			System.out.println("======================");
			System.out.printf("번호를 선택하세요\n1. 입력\n2. 검색\n3. 삭제\n ");
			System.out.println("======================");
			choice = sc.nextInt();
			
			switch (choice) {
			case 1:
				System.out.print("저장할 값을 입력하세요: ");
				s = sc.next();								//문자열을 입력받기 위한 변수
				dt.addData(s);								//받은 문자열을 저장
				System.out.println(dt.getData()[dt.getIndex() - 1]+"가 저장되었습니다.");
				break;
			case 2:
				System.out.print("검색할 값을 입력하세요: ");		
				s = sc.next();
				dt.searchData(s); 							// dt.searchData(s) 검색 메소드 실행
				break;
			case 3:
				System.out.print("삭제할 값을 입력하세요: ");
				s = sc.next();
				dt.deleteData(s); 							// dt.deleteData(s) 삭제 메소드 실행
				break;
			default:
				System.out.println("번호를 다시 입력하세요."); 	// 번호를 잘못 입력했을 때 다시 입력하도록 함
				break;
			}
		}
	}
}
