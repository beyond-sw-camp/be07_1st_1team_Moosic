<div align="center">
<img width="1280" alt="스크린샷 2024-06-02 오후 4 32 52" src="https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/87ef7c0f-c871-4ede-85c7-9364c0fd3ab5">
</div>


    
# 🎵 프로젝트 개요
작성 예정입니다.


---
# ✨ 프로젝트 중점 사항

- 많이 사용되는 음원 스트리밍 서비스의 기능을 꼼꼼히 분석하고 DB가 어떤 식으로 구성돼 있을지 생각해봄으로써, 서비스 설계에 대한 경험을 쌓고 이해도를 높이기 위해 노력했습니다.
- 음악 스트리밍 서비스에 존재하는 여러 `N:M`, `1:N` 관계를 해결하며 데이터베이스 설계에 대한 이해도를 높이기 위해 노력했습니다.

---
# 📝 요구사항 정의서

[요구사항 정의서 노션에서 보기](https://clean01.notion.site/Moosic-ac9c31c3d0234ed5acb1b175acf572bd?pvs=4)

<div>
<img width="638" alt="스크린샷 2024-06-02 오후 4 22 25" src="https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/e5b58297-6274-4f90-a507-31ed1f6e31f4">
<img width="642" alt="스크린샷 2024-06-02 오후 4 22 54" src="https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/d1af80ec-2473-4df1-9c5d-16dc5e0c5e87">
</div>


---
# 🧩 ERD

 [ERD 클라우드에서 보기](https://www.erdcloud.com/d/DPiPTZryaNWEzfLcM)

![moosic-erd](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/39020b39-9b2e-4102-b22d-8bf6f85d7608) 

---
# 📑 Schema
Moosic은 총 15개의 테이블로 구성되어 있습니다.
  
자세한 내용은 [여기](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/blob/main/schema/team1_moosic_schema.sql)에서 보실 수 있습니다.
  
### 1. 음원
```sql
CREATE TABLE `music` (
`music_id`	bigint PRIMARY KEY AUTO_INCREMENT,
`music_title`	varchar(255) NOT NULL,
`lyrics`	varchar(10000),
`music_file_url`	varchar(2083) NOT NULL,
`playtime`	int unsigned NOT NULL,
`like_count`	bigint	NOT NULL	DEFAULT 0,
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`album_id`	bigint	NOT NULL,
`genre`    enum('k-pop', 'pop', 'j-pop', 'dance', 'ballad', 'hip-hop', 'trot')    NOT NULL,
FOREIGN KEY music(album_id) REFERENCES album(album_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 2. 앨범
```sql
CREATE TABLE `album` (
`album_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`album_title`	varchar(255)	NOT NULL,
`music_count`	int	NOT NULL DEFAULT 0,
`release_date`	timestamp	NOT NULL,
`album_art_image_url`	varchar(2083) NOT NULL DEFAULT '?',
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`distributor_id`	int	NOT NULL,
FOREIGN KEY album(distributor_id) REFERENCES album_distributor(distributor_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 3. 플레이리스트
```sql
CREATE TABLE `member_playlist` (
`playlist_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`playlist_title`	varchar(255)	NOT NULL,
`created_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`updated_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`playlist_thumbnail_url`	varchar(2083)	NOT NULL,
`del_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
`member_id`	bigint	NOT NULL,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 4. 플레이리스트 세부 내역
```sql
CREATE TABLE `member_playlist_detail` (
	`detail_id`	bigint	PRIMARY KEY	AUTO_INCREMENT,
	`playlist_id`	bigint	NOT NULL,
	`music_id`	bigint	NOT NULL,
	FOREIGN KEY (playlist_id) REFERENCES member_playlist(playlist_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 5. 음원 재생 이력
```sql
CREATE TABLE `member_play_history` (
`play_cnt_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
`member_id`	bigint	NOT NULL,
`music_id`	bigint	NOT NULL,
`start_time`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
`end_time`	timestamp	NULL	DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 6. 좋아요
```sql
CREATE TABLE `music_like` (
`music_id`	bigint	NOT NULL,
`member_id`	bigint	NOT NULL,
`created_date`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (music_id) REFERENCES music(music_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 7. 싫어요
```sql
CREATE TABLE `music_dislike` (
	`member_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`music_id` bigint NOT NULL,
	FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 8. 관리자
```sql
CREATE TABLE `admin` (
	`admin_id`	int	PRIMARY KEY AUTO_INCREMENT,
	`admin_name`	varchar(30)	NOT NULL,
	`admin_email`	varchar(100)	NOT NULL UNIQUE,
	`password`	varchar(30)	NOT NULL,
	`phone_num`	varchar(20)	NOT NULL
);
```

  
### 9. 배급사
```sql
CREATE TABLE `album_distributor` (
	`distributor_id`	int	PRIMARY KEY AUTO_INCREMENT,
	`distributor_name`	varchar(30)	NOT NULL,
	`distributor_email`	varchar(100)	NOT NULL	UNIQUE,
	`password`	varchar(30)	NOT NULL,
	`distributor_num`	varchar(20)	NOT NULL
);
```
  

### 10. 회원
```sql
CREATE TABLE `member` (
	`member_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`member_name` varchar(20) NOT NULL,
	`member_email` varchar(100) NOT NULL unique,
	`password` varchar(30) NOT NULL,
	`phonenum` varchar(20) NOT NULL unique,
	`birthdate` date NOT NULL,
	`gender` varchar(10) NOT NULL,
	`payment_method_id` bigint NULL,
	`member_profile_image_url` varchar(2083) NULL,
	`membership` tinyint(1) NOT NULL DEFAULT 0,
	`del_yn` tinyint(1) NOT NULL DEFAULT 0,
	`regular_payment_date` tinyint(1),
	FOREIGN KEY (`payment_method_id`) REFERENCES `member_payment_method` (`payment_method_id`)
);
```

  
### 11. 아티스트
```sql
CREATE TABLE `artist` (
	`artist_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`artist_name` varchar(30) NOT NULL,
	`artist_profile_image_url` varchar(2083) NULL
);
```

  
### 12. 결제 수단
```sql
CREATE TABLE `member_payment_method` (
	`payment_method_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`bank_name` enum('국민은행', '신한은행', '우리은행', '하나은행', '카카오뱅크') NOT NULL,
	`account_number` varchar(30) NOT NULL unique,
	`del_yn` tinyint(1) NOT NULL DEFAULT 0,
	`member_id` bigint NOT NULL,
	FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
```

  
### 13. 결제 이력
```sql
CREATE TABLE `member_payment_history` (
	`payment_history_id`	bigint	PRIMARY KEY AUTO_INCREMENT,
	`created_at`	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`canceled_at`	timestamp	NULL,
	`cancel_yn`	tinyint(1)	NOT NULL	DEFAULT 0,
	`member_id`	bigint	NOT NULL,
	`payment_method_id`	bigint	NOT NULL,
    FOREIGN KEY (member_id) REFERENCES `member`(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (payment_method_id) REFERENCES member_payment_method(payment_method_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```
  

### 14. 음원에 참여한 아티스트
```sql
CREATE TABLE music_artist (
    music_artist_id    bigint    PRIMARY KEY AUTO_INCREMENT,
    artist_type    enum('메인 아티스트', '작곡가', '작사가', '편곡자', '실연자')    NOT NULL,
    music_id    bigint    NOT NULL,
    artist_id    bigint    NOT NULL,
    foreign key (music_id) references music(music_id) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (artist_id) references artist(artist_id) ON DELETE CASCADE ON UPDATE CASCADE
);
```

### 15. 인기 차트
```sql
CREATE TABLE `music_chart` (
	`chart_id` bigint PRIMARY KEY AUTO_INCREMENT,
	`music_id` bigint NOT NULL,
	`rank` bigint NOT NULL,
	FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
```

---

# 🎵 프로젝트 시나리오

평소 음악에 관심이 많던 김세리씨는 음악 프로그램을 듣기위해 **moosic 어플**에 관심이 생겨 어플을 이용하기로 마음을 먹었다.

김세리씨는 먼저 **moosic 어플**에서 **로그인**을 위해 **회원가입**을 진행하기로 하였다.
  
**회원가입**을 한 김세리 씨는 **moosic 어플**에서 **로그인후** 음악을 듣기 위해 평소 듣고 싶었던 **음악을 검색**하였다.
   
**음악을 검색**하고 원하던 음악을 감상하던 김세리씨는 음악을 1분밖에 들을수 없는 것올 보고 무엇이 문제인지 찾아보았다.
  
**멤버쉽에 가입**을 하지 않으면 음악을 1분 밖에 들을수 없는 것을 알게된 김세리 씨는 먼저 **멤버쉽에 가입**을 하기 위해 **결제 정보를 등록**하기로 하였다.
  
자신의 **결제 정보**에 은행명과, 계좌번호를 입력하고 계좌 정보를 등록한 김세리 씨는 **moosic**에 가입을 하였고, 자신이 원하는 노래를 자신의 **플레이리스트**에 마음껏 넣고 이를 마음껏 들을 수 있었다.
  
노래를 듣던 김세리 씨는 문득 자신의 **플레이리스트**에 들어있는 노래들의 **재생 수**와 **좋아요 수**가 궁금해져서 찾아보게 되었다.
  
또한 **어떠한 아티스트 들이 내가 듣는 노래에 참가**를 하였는지 확인해 보기 위해 **노래에 대한 정보**를 보았다.
  
계속해서 노래를 듣던 김세리 씨는 프로듀서 였었던 경험을 떠올렸고, 그때의 행복했던 시절을 회상하며 자신도 노래를 등록해 보고자 **moosic**에 **배급사**로 등록을 하기로 하였다.
  
구독하고 3일이 지나지 않으면 취소와 환불이 가능하다는 것을 알게 된 김세리씨는 **취소와 환불**을 진행 후 자신의 회원 **아이디를 탈퇴하고**, 자신이 만든 노래를 등록하기 위해 **배급사로 회원가입**을 진행하였다.
  
다른 한편 오늘 막 취업을 한 최세호 씨는 자신의 관리자 계정을 얻기 위해 **관리자 계정 회원가입**을 진행하였고, 로그인을 하였는데 막 배급사 요청한 김세리 씨의 요청을 수락하였다(**급하게 오늘 떠올라서 가정으로 하겠습니다.ㅠㅠ**).
  
그리고 얼마나 많은 회원들이 멤버십 가입을 오래 했는지 궁금해진 최세호 씨는 **유저들의 정기 결제 내역**을 확인해 보았다. 한편 배급사 수락을 확인한 김세리 씨는 허가된 **아이디로 로그인** 하였다.
  
김세리 씨는 노래를 등록하기 전에 최근 음악 트렌드와 사람들이 싫어하는 노래를 조사하기 위해 **최근 인기차트**를 찾아보고 **노래를 등록**하였다.
  
---

# 💻 프로시저 실행 결과


<details>
<summary><b>1. 회원 가입</b></summary>
<div markdown="1">

```sql
CALL team1_moosic.멤버넣기('김세리', 'seir@naver.com', '1234', '010-1221-2132', '00-01-01', 'Femail', null, null);
```
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/fd60ccc0-cb53-4dd7-bfe2-f93a0463ea10)
</div>
</details>


<details>
<summary><b>2. 로그인</b></summary>
<div markdown="1">

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/b9ff8279-c305-40e6-bb50-3add5aa3173a)

```sql
call team1_moosic.멤버로그인('seir@naver.com', '1234');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/773d7496-b877-4e98-9a65-c9b9749ebcaf)
</div>
</details>


<details>
<summary><b>3. 음원 검색</b></summary>
<div markdown="1">
음원 데이터:

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/68c2c915-2abd-43d1-b16b-67e24c2111fd)

```sql
call team1_moosic.음원검색('Song of Freedom');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/9addabea-b1f9-4eee-8741-dc69fea1429f)

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/311f5565-c28c-4bfa-87de-e55ae2b4b60c)
</div>
</details>

<details>
<summary><b>4. 결제 정보 등록</b></summary>
<div markdown="1">

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/37ccf13d-d301-4f23-9bf1-152eaafa9089)

```sql
call team1_moosic.결제정보등록('seir@naver.com', '1234', '국민은행', '942222--00-333444');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/3fd6adc8-491e-462d-990a-143cde1c23ec)

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/927ef383-752e-4276-a2b8-5ee9e4f2da48)

</div>
</details>


<details>
<summary><b>5. 구독하기</b></summary>
<div markdown="1">

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/f3aecaf4-c73a-410c-9cb5-37e7e94312e9)

```sql
call team1_moosic.구독('seir@naver.com', '1234');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/4780a066-e1b6-4f71-ae6f-7f15194250d4)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/fbb6c5a9-1fc4-45ab-a36a-8641abc153eb)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/19f7fb68-d235-4a74-9b31-ed663221f2eb)

</div>
</details>

<details>
<summary><b>6. 플레이리스트 만들기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/e18357d2-37a5-4aa1-9e41-e188db91c6a0)

```sql
call team1_moosic.플레이리스트만들기(1, '내가 좋아하는 노래', null);
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/771b28bd-89e9-4620-a968-4fa74900eea3)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/b99c682f-6f1d-4e5e-82b4-2c314ec35119)


</div>
</details>


<details>
<summary><b>7. 플레이리스트에 음원 추가하기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/e0b4ad65-5dde-4997-bcb9-5722a80148a3)

```sql
call team1_moosic.플레이리스트에음원추가하기(1, 81);
call team1_moosic.플레이리스트에음원추가하기(1, 82);
call team1_moosic.플레이리스트에음원추가하기(1, 83);
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/44c0b1a9-6de9-4399-80f0-f6a9c0dfdc6a)
</div>
</details>


<details>
<summary><b>8.플레이리스트에 들어있는 음원 조회하기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/c8f70c4e-b748-40f1-9d54-ecad99b1d683)

```sql
call team1_moosic.플레이리스트조회하기(1);
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/6a8b5a05-812f-4df0-898f-767f78b05445)

```sql
select playtime as 재생수, like_count as "좋아요 수" from music where music_id = 81;
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/71e749ff-ef7a-481c-9019-5ce5ea4aa5ed)

</div>
</details>


<details>
<summary><b>9. 듣고 있는 곡의 아티스트 조회하기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/c955518a-fc63-4e50-ad79-98a19e6b32c1)
	
```sql
call team1_moosic.select_artist(81);
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/ff8bbabe-a801-4855-a07b-2f76c30ffa51)
</div>
</details>


<details>
<summary><b>10. 구독 취소하고 환불 받기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/2651fac5-68e9-4732-ae3e-e51384a45d85)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/080e1921-4f7e-4bcb-9a49-2ebe1d4725da)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/2edb1cb6-b760-4143-8389-21b88f37a143)

</div>
</details>


<details>
<summary><b>11. 구독 취소하고 환불 받기</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/2651fac5-68e9-4732-ae3e-e51384a45d85)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/080e1921-4f7e-4bcb-9a49-2ebe1d4725da)
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/2edb1cb6-b760-4143-8389-21b88f37a143)

</div>
</details>


<details>
<summary><b>12. 회원 탈퇴</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/79439edd-279e-4c3e-be41-ca48779a39c2)

```sql
call team1_moosic.회원탈퇴('seir@naver.com', '1234');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/3c3430e1-9da6-4647-bfd1-337d96c0a99f)

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/a814f016-a10f-49a2-9615-06280f9174b2)

</div>
</details>


<details>
<summary><b>13. 배급사 회원 가입</b></summary>
<div markdown="1">
	
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/593e72af-f184-44c6-8840-83f3224ccbe6)

```sql
call team1_moosic.배급사등록('김세리', 'serimusic@naver.com', '1234', '02-1234-1234');
```

</div>
</details>


<details>
<summary><b>14. 관리자 회원 가입</b></summary>
<div markdown="1">
	
```sql
call team1_moosic.배급사등록('김세리', 'serimusic@naver.com', '1234', '02-1234-1234');
call team1_moosic.관리자 넣기('최세호', 'seho@moosic.com', '1234', '010-1234-4443');
```

![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/91be5148-97c5-4dbe-8a83-75f7ae19d6a7)


관리자가 배급사 "김세리" 씨의 회원가입 요청을 수락
![image](https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/178f3ef8-651d-45e6-ba26-4d430503d7f7)

</div>
</details>


<details>
<summary><b>15. 관리자가 회원들의 구독 현황, 횟수를 조회</b></summary>
<div markdown="1">


</div>
</details>


<details>
<summary><b>16. 인기 차트 조회</b></summary>
<div markdown="1">


</div>
</details>

<details>
<summary><b>17. 노래를 등록</b></summary>
<div markdown="1">


</div>
</details>

---
# 🤔 설계에 대한 고민
- **좋아요, 싫어요 테이블을 만들 때, fk 2개를 복합키로 쓸지, 별도의 인조 pk를 둘지에 대한 고민**
    - 좋아요, 싫어요에 대한 정보는 보통 어떤 유저가 좋아요 누른 노래가 뭔지, 어떤 노래에 좋아요 누른 개수 등을 조회할 때 사용되고, 별도의 pk로 조회해야하는 경우는 존재하지 않습니다.
    - 따라서 인조 pk를 두는 것보다는 fk 2개를 복합키로 쓰는 것이 더 적절하다고 판단하였습니다.
- **음원에 참여한 아티스트를 표시하는 방법에 대한 고민**
    - 음원에 참여한 아티스트를 표기하는 것이 저희 서비스의 대표적인 N:M 관계였습니다.
    - 그리고 아티스트도 ‘메인 아티스트’, ‘작곡가’, ‘작사가’, ‘편곡자’, ‘실연자’로 여러 분류로 나뉘어져 있어서 이 관계를 잘 표현하는 것이 중요했습니다.
    - 저희는 음원과 아티스트 사이에 ‘음원에 참여한 아티스트’ 테이블을 두고, 그곳에 음원 아이디, 아티스트 아이디, 아티스트 분류 컬럼을 두어 여러 아티스트와 여러 음원 사이의 관계를 표현할 수 있었습니다.

---
# 🍀 팀

<figure>
    <table>
      <tr>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/90437809?v=4" width="180px"/></td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/117874745?v=4" width="180px"/></td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/64718002?v=4" width="180px"/></td>
      </tr>
      <tr>
        <td align="center">팀장: <a href="https://github.com/Choi-Moori">최무리</a></td>
        <td align="center">팀원: <a href="https://github.com/jiho3634">김지호</a></td>
        <td align="center">팀원: <a href="https://github.com/clean2001" >김세정</a></td>
      </tr>
    </table>
</figure>
<br>
