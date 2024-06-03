<div align="center">
<img width="1280" alt="스크린샷 2024-06-02 오후 4 32 52" src="https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/87ef7c0f-c871-4ede-85c7-9364c0fd3ab5">
</div>


    
# 🎵 프로젝트 개요
작성 예정입니다.

---
# 🎵 프로젝트 시나리오

평소 음악에 관심이 많던 김세리씨는 음악 프로그램을 듣기위해 **moosic 어플**에 관심이 생겨 어플을 이용하기로 마음을 먹었다.

김세리씨는 먼저 **moosic 어플**에서 **로그인**을 위해 **회원가입**을 진행하기로 하였다. **회원가입**을 한 김세리 씨는 **moosic 어플**에서 **로그인후** 음악을 듣기 위해 평소 듣고 싶었던 **음악을 검색**하였다. **음악을 검색**하고 원하던 음악을 감상하던 김세리씨는 음악을 1분밖에 들을수 없는 것올 보고 무엇이 문제인지 찾아보았다. **멤버쉽에 가입**을 하지 않으면 음악을 1분 밖에 들을수 없는 것을 알게된 김세리 씨는 먼저 **멤버쉽에 가입**을 하기 위해 **결제 정보를 등록**하기로 하였다. 자신의 **결제 정보**에 은행명과, 계좌번호를 입력하고 계좌 정보를 등록한 김세리 씨는 **moosic**에 가입을 하였고, 자신이 원하는 노래를 자신의 **플레이리스트**에 마음껏 넣고 이를 마음껏 들을 수 있었다. 노래를 듣던 김세리 씨는 문득 자신의 **플레이리스트**에 들어있는 노래들의 **재생 수**와 **좋아요 수**가 궁금해져서 찾아보게 되었다. 또한 **어떠한 아티스트 들이 내가 듣는 노래에 참가**를 하였는지 확인해 보기 위해 **노래에 대한 정보**를 보았다. 계속해서 노래를 듣던 김세리 씨는 프로듀서 였었던 경험을 떠올렸고, 그때의 행복했던 시절을 회상하며 자신도 노래를 등록해 보고자 **moosic**에 **배급사**로 등록을 하기로 하였다. 구독하고 3일이 지나지 않으면 취소와 환불이 가능하다는 것을 알게 된 김세리씨는 **취소와 환불**을 진행 후 자신의 회원 **아이디를 탈퇴하고**, 자신이 만든 노래를 등록하기 위해 **배급사로 회원가입**을 진행하였다. 다른 한편 오늘 막 취업을 한 최세호 씨는 자신의 관리자 계정을 얻기 위해 **관리자 계정 회원가입**을 진행하였고, 로그인을 하였는데 막 배급사 요청한 김세리 씨의 요청을 수락하였다(**급하게 오늘 떠올라서 가정으로 하겠습니다.ㅠㅠ**) 그리고 얼마나 많은 회원들이 멤버십 가입을 오래 했는지 궁금해진 최세호 씨는 **유저들의 정기 결제 내역**을 확인해 보았다. 한편 배급사 수락을 확인한 김세리 씨는 허가된 **아이디로 로그인** 하였다. 김세리 씨는 노래를 등록하기 전에 최근 음악 트렌드와 사람들이 싫어하는 노래를 조사하기 위해 **최근 인기차트**를 찾아보고 **노래를 등록**하였다.

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
# 💻 프로시저 실행 결과


 작성 예정입니다.
 
---
# 🤔 설계에 대한 고민
- 작성 예정입니다.

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
