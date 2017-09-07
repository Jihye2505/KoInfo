
public class DataTest {
	private String[] data = new String[50];
	private int index;

	public String[] getData() { // data get메소드
		return data;
	}

	public int getIndex() { // index get메소드
		return index;
	}

	public void addData(String s) {

		for (int i = 0; i < data.length; i++) {
			if (index > 49) { // 데이터가 50개를 초과하면 안내문 출력
				System.out.println("더 이상 데이터를 저장할 수 없습니다.");
			} else if (s.equals(data[i])) { // 중복 데이터가 존재하는 경우
				System.out.println("이미 등록된 데이터입니다.");
			} else { // 데이터를 입력하고 index값을 1 증가시킨다.
				data[index] = s;
				index += 1;
			}
		}
	}

	public void searchData(String key) {

		int find_index = -1; // 초기값을 -1로 설정

		for (int i = 0; i < index; i++) { // 찾고자하는 데이터가 존재하는 경우 그 값이 저장되어 있는
			if (data[i].equals(key)) { // index값을 find_index 값으로 설정한다.
				find_index = i;
				break;
			}
		}

		if (find_index == -1) { // findData 메소드를 통해 검색 결과가 없으므로 -1을 리턴받음
			System.out.println("검색 결과가 없습니다.");
		} else {
			System.out.println(key + "가 저장되어 있습니다.");
		}
	}

	public void deleteData(String key) {

		for (int i = 0; i < data.length; i++) {
			if (key.equals(data[i])) {
				String[] newdata = new String[data.length];
				for (int j = 0; j < i; j++) {
					newdata[j] = data[j];
				}
				for (int j = i; j < newdata.length; j++) {
					newdata[j] = data[j + 1];
				}
				data = newdata;
			}
		}
		System.out.println("데이터가 삭제되었습니다.");

	}

}
