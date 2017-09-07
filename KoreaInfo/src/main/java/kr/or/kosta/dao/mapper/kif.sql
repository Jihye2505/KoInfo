DROP TABLE POST_TB;
DROP TABLE ATTRACTION_TB;
DROP TABLE STATE_TB;
DROP TABLE USER_TB;
DROP TABLE favorites_tb;
DROP TABLE comment_tb;

 commit;

CREATE TABLE user_tb (
  id varchar(10) NOT NULL,
  password varchar(20),
  name varchar(20),
  phoneNum varchar(20),
  sex varchar(10),
  birth varchar(20),
  email varchar(30),
  rank char,
 PRIMARY KEY (id)
);

CREATE TABLE ATTRACTION_TB 
(
  id int NOT NULL,
  state_id int,
  title varchar(200),
  address varchar(100),
  content varchar(4000),
  image varchar(50),
  writer_id varchar(10) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE post_tb (
  id int NOT NULL,
  title varchar(200),
  content varchar(4000),
  image varchar(50),
  star_point number,
  writer_id varchar(10),
  attraction_id INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE comment_tb (
  id int NOT NULL,
  content varchar(500),
  writer_id varchar(10),
  post_id int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE favorites_tb (
  user_id VARCHAR(10),
  attraction_id int
);

CREATE TABLE state_tb (
  id int,
  name VARCHAR(10)
);

CREATE SEQUENCE ATTRACTION_TB_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE POST_TB_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE COMMENT_TB_SEQ START WITH 1 INCREMENT BY 1;

commit;

--지역정보
insert into state_tb values(1, '경기도');
insert into state_tb values(2, '강원도');
insert into state_tb values(3, '충청도');
insert into state_tb values(4, '전라도');
insert into state_tb values(5, '경상도');

--관리자
insert into user_tb values('root', '1234', '안드레박', '010-1111-2222', '1980-11-22', 'root@naver.com', 'M');

--충청도
commit;
INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)                        
VALUES (attraction_tb_seq.nextval, 3, '천안_독립기념관', '충남 천안시 동남구 목천읍 삼방로 95', '독립기념관은 우리민족의 5천년 역사 속에서 무수한 외세의 침략에도 굴하지 않고 강인한 독립의 의지와 자주의 정신으로 오늘의 대한민국을 물려주신 선열들의 빛나는 역사를 기록하고 있다', '독립기념관.jpg', 'root');
INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)                        
VALUES (attraction_tb_seq.nextval, 3, '공주_임립미술관', '충남 공주시 계룡면 봉곡길 77-13', '임립미술관은 사설미술관으로 대ㆍ소전시실, 야외조각공원과 호수, 휴게실과 세미나실이 주변의 아름답고 조용한 자연경관과 조화를 이루고 있으며 그야말로 한 폭의 그림과도 같다.', '임립미술관.jpg', 'root');
INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)                        
VALUES (attraction_tb_seq.nextval, 3, '공주_동학사', '충남 공주시 반포면 동학사1로 462', '동학사는 공주에서 약 25km, 대전에서 8km정도 떨어진 반포면 학봉리에 자리잡고 있다. 계룡산 동쪽 골짜기에 싸여 있는 천년고찰 동학사는 우리나라에서 가장 오래된 최초의 비구니 강원이다.', '동학사.jpg', 'root');
INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)                        
VALUES (attraction_tb_seq.nextval, 3, '보령_에너지월드', '충남 보령시 오천면 오천해안로 89-37', '보령에너지월드는 국내 최대규모의 화력발전단지인 보령화력본부의 홍보전시관으로, 우리가 매일같이 사용하는 전기가 어떤 과정을 거쳐 생산되고, 이렇게 생산된 전기에너지를 올바르게 사용하는 방법을 배워 볼 수 있는 종합 전기에너지 체험관이다.', '에너지월드.jpg', 'root');

--경상도
INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)
VALUES (attraction_tb_seq.nextval, 5, '바람의 언덕', '경상남도 거제시 남부면 도장포마을', '거제도 곳곳이 자연이 빚은 아름다움으로 가득하지만 이름보다 더욱 아름다운 바람의 언덕을 놓치지 말자. 마치 영화의 제목처럼 불리는 언덕은 실제 많은 드라마 속 배경으로 유명해졌다. 해금강 유람선 선착장이 자리하는 도장포 작은 항구 오른편으로 자연 방파제처럼 낮게 누워 있는 언덕은 파란 잔디로 뒤덮여 그림처럼 아름답다. 나무 계단으로 연결된 산책로를 따라 언덕을 오르면 몸을 가누기 힘들 정도의 바람이 마치 힘겨루기라도 하듯 불어온다. 이름대로 바람이 주인 되는 장소임을 대번에 느낄 수 있다. 정상 부근 벤치에 앉으면 지중해의 경치가 부럽지 않은 우리 국토의 또 다른 아름다움이 눈앞으로 펼쳐진다. 사진기에 담을 수 없는 바람의 노래 소리는 한적한 포구와 바다 위에 떠 있는 듯 작은 섬들의 조화로운 모습을 칭송하는 자연의 울림이다. 바람결 따라 누워 자라는 동백꽃의 인사까지 남도의 포근함을 느낄 수 있다. 바람의 언덕과 연결되는 도장포항구는 작고 아담한 남도의 아름다움을 가득 간직한다. 주변에는 세찬 바람에 가지를 단련시킨 듯 굵은 동백나무가 지천이다. 해금강을 돌아보는 유람선 관광이나 외도를 찾아가는 여객선의 출발점이기도 하다. 선착장 주변으로 거제 바다의 향기를 듬뿍 담은 신선한 해산물들을 맛보거나 구입할 수 있다.', '바람의언덕.jpg', 'root');

INSERT INTO attraction_tb (id, state_id, title, address, content, image, writer_id)
VALUES (attraction_tb_seq.nextval, 5, '고령 장기리 암각화', '경상북도 고령군 고령읍 장기리 532', '고령은 울산의 대곡리, 천천리와 함께 암각화로 유명한 지역이다. 고령 장기리에는 커다란 바위에 그림이 새겨져 있는데, 새겨진 모양이 제법 선명하며 가까이 다가가 볼 수 있어 탁본 등을 통하지 않고서도 눈으로 확인할 수 있다. 가로 6m, 세로 3m의 바위에는 동그라미, 동심원, 십자 모양 등의 기하학적인 무늬가 새겨져 있으며, 방패모양 안에 사람 얼굴을 그려놓은 듯 보이는 문양 등 30여 점의 그림이 그려져 있다. 동심원으로 그려진 원형의 무늬는 태양을 상징하는 것으로 해석된다. 새겨진 그림들을 가만히 보고 있으면 옛 사람들이 남겨 놓은 이야기가 들리는 것 같다. 대곡리 반구대의 암각화가 사람, 물고기 등 사물의 형태를 구체적으로 그려 놓았다면 이곳 암각화는 조금 더 추상화된 형태이다. 태양을 숭배하고 자연을 경외하던 당시 사람들의 마음을 읽을 수 있다. 장기리에서 그리 멀리 떨어지지 않은 안화리에도 암각화가 있으니 함께 찾아보자.', '고령장기리암각화.jpg', 'root');



