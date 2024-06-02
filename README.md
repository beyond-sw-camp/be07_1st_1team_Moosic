<div align="center">
<img width="1280" alt="스크린샷 2024-06-02 오후 4 32 52" src="https://github.com/beyond-sw-camp/be07_1st_1team_Moosic/assets/64718002/87ef7c0f-c871-4ede-85c7-9364c0fd3ab5">
</div>


    
# 🎵 프로젝트 개요



작성 예정입니다.

---
# ✨ 프로젝트 중점 사항

- 음악 스트리밍 서비스에 존재하는 여러 N:M, 1:N 관계를 해결하며 데이터베이스 설계에 대한 이해도를 높이기 위해 노력했습니다.
- 

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
