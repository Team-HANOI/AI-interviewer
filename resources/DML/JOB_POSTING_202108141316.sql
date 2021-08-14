-- HR.JOB_POSTING definition

CREATE TABLE "HR"."JOB_POSTING" 
   (	"COMPANY" VARCHAR2(100), 
	"URL" VARCHAR2(100), 
	"LOGOURL" VARCHAR2(500), 
	"STACKS" VARCHAR2(200) DEFAULT 0, 
	"JOBPOSITION" VARCHAR2(100), 
	 CONSTRAINT "ALLPAGE_PK" PRIMARY KEY ("URL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "HR"."ALLPAGE_PK" ON "HR"."JOB_POSTING" ("URL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

COMMENT ON TABLE HR.JOB_POSTING IS '모든 페이지 정보(회사이름, url, logourl)';

INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('리본즈 코리아','https://programmers.co.kr/job_positions/6470','https://grepp-programmers.s3.amazonaws.com/production/company/logo/143/img-ci-reebonz_dcohbl.png','CSS JavaScript HTML jQuery ReactJS Ruby on Rails Git ','웹 서비스 개발자'),
	 ('오피지지(OP.GG)','https://programmers.co.kr/job_positions/6814','https://grepp-programmers.s3.amazonaws.com/production/company/logo/675/opgg_profile_basic_blue.png','Kotlin ','Android Engineer'),
	 ('아이담비즈','https://programmers.co.kr/job_positions/6462','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5553/IDAM-LOGO_1-1.png',NULL,'앱 개발자'),
	 ('리디','https://programmers.co.kr/job_positions/6787','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png',NULL,'시니어 백엔드 엔지니어'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3294','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','JavaScript HTML CSS Redux.js TypeScript ReactJS ','프론트엔드 엔지니어(리더급)'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3292','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','HTML CSS Redux.js TypeScript JavaScript ReactJS ','프론트엔드 엔지니어'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3882','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg',NULL,'데이터 엔지니어'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3291','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','AWS Simple Notification Service(AWS SNS) AWS ECS Apache Aurora AWS S3 AWS Simple Queue Service(AWS SQS) Git Docker MySQL Node.js ','백엔드 엔지니어'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3958','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','Git Node.js MySQL Docker ','주니어 백엔드 엔지니어(산업기능요원 보충역, 전직)'),
	 ('모두싸인','https://programmers.co.kr/job_positions/4548','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','ReactJS JavaScript HTML CSS Redux.js TypeScript ','주니어 프론트엔드 엔지니어');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('모두싸인','https://programmers.co.kr/job_positions/5303','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg',NULL,'주니어 프론트엔드 엔지니어(산업기능요원 보충역, 전직)'),
	 ('모두싸인','https://programmers.co.kr/job_positions/3884','https://grepp-programmers.s3.amazonaws.com/production/company/logo/364/SYMBOL.jpg','MySQL Node.js Git Docker ','주니어 백엔드 엔지니어'),
	 ('엔엑스씨','https://programmers.co.kr/job_positions/6786','https://grepp-programmers.s3.amazonaws.com/production/company/logo/4294/NXC150.jpg','Android Kotlin Firebase ','NXLab 안드로이드 어플리케이션 개발자'),
	 ('두잉랩','https://programmers.co.kr/job_positions/6166','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5695/%EC%BA%A1%EC%B2%98.PNG','Tensorflow Keras PyTorch ','인공지능 딥러닝 엔지니어(연구원)'),
	 ('레이언스','https://programmers.co.kr/job_positions/5490','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5258/ry%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9_programmers.png','Java JIRA C# C++ ','SW 개발자'),
	 ('딥네츄럴','https://programmers.co.kr/job_positions/6381','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2787/02._%EB%A1%9C%EA%B3%A0_200x200.png','Vue.js REST API Webpack CSS JavaScript ','프론트엔드 엔지니어 (주니어)'),
	 ('소리를보는통로','https://programmers.co.kr/job_positions/6443','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1978/SOVORO_LOGO_%EB%8F%99%EA%B8%80.png','REST API Android iOS Kotlin React Native ','모바일 개발자'),
	 ('소리를보는통로','https://programmers.co.kr/job_positions/6442','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1978/SOVORO_LOGO_%EB%8F%99%EA%B8%80.png','AWS EC2 Node.js Git REST API ','백엔드 개발자'),
	 ('소리를보는통로','https://programmers.co.kr/job_positions/6441','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1978/SOVORO_LOGO_%EB%8F%99%EA%B8%80.png','JavaScript jQuery ReactJS ','웹 프론트엔드 개발자'),
	 ('패스트파이브','https://programmers.co.kr/job_positions/6571','https://grepp-programmers.s3.amazonaws.com/production/company/logo/4458/FASTFIVE_F_icon_rgb_320wh.jpg',NULL,'Product Owner (파트장급)');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('패스트파이브','https://programmers.co.kr/job_positions/4324','https://grepp-programmers.s3.amazonaws.com/production/company/logo/4458/FASTFIVE_F_icon_rgb_320wh.jpg','Firebase AWS ECS PostgreSQL MariaDB AWS RDS AWS ElastiCache Node.js Vue.js ','서버/인프라 개발자'),
	 ('글로컬라이즈','https://programmers.co.kr/job_positions/6428','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5927/Logotype1_BG_White_3x.png','PostgreSQL AWS Cloud9 ','Backend Developer (Senior)'),
	 ('iPortfolio','https://programmers.co.kr/job_positions/1441','https://grepp-programmers.s3.amazonaws.com/production/company/logo/785/%ED%81%AC%EA%B8%B0%EB%B3%80%ED%99%98_iPortfolio_200x200.png','ES6 Node.js JavaScript HTML CSS ReactJS Java ','Front-end 개발자'),
	 ('iPortfolio','https://programmers.co.kr/job_positions/1685','https://grepp-programmers.s3.amazonaws.com/production/company/logo/785/%ED%81%AC%EA%B8%B0%EB%B3%80%ED%99%98_iPortfolio_200x200.png','Spring Git Java MySQL Node.js ','Back-end 개발자'),
	 ('릴리커버 ','https://programmers.co.kr/job_positions/6785','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5125/%EB%A6%B4%EB%A6%AC%EC%BB%A4%EB%B2%84_%EB%A1%9C%EA%B3%A0.png','REST API MySQL MVVM(Model-View-ViewModel) WPF ','Windows App 개발'),
	 ('릴리커버 ','https://programmers.co.kr/job_positions/6775','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5125/%EB%A6%B4%EB%A6%AC%EC%BB%A4%EB%B2%84_%EB%A1%9C%EA%B3%A0.png','Python SQL Django MySQL PHP ','백엔드 서비스 개발'),
	 ('릴리커버 ','https://programmers.co.kr/job_positions/6783','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5125/%EB%A6%B4%EB%A6%AC%EC%BB%A4%EB%B2%84_%EB%A1%9C%EA%B3%A0.png','REST API Swift iOS ','iOS 앱 개발'),
	 ('스튜디오씨드코리아','https://programmers.co.kr/job_positions/5923','https://grepp-programmers.s3.amazonaws.com/production/company/logo/4578/ProtoPie_120_120__1_.png','Storybook HTML CSS JavaScript TypeScript Next.js ','Frontend Software Engineer (DevOps Team)'),
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/6784','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png','REST API Java Kotlin ','백엔드 엔지니어 (Kotlin/Java)'),
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/4043','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png','Node.js MySQL Spring Kotlin Python Django ','백엔드 엔지니어 (Python/Django)');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/6778','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png',NULL,'시니어 소프트웨어 엔지니어'),
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/6780','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png','Spring Apache Kafka Kotlin Django Python ','엔지니어링 매니저'),
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/6782','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png',NULL,'SRE(Site Reliability Engineering) 엔지니어'),
	 ('피플펀드컴퍼니','https://programmers.co.kr/job_positions/6781','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1494/symbol_resized.png','Shell Python Linux ','클라우드 시스템 엔지니어'),
	 ('데이터뱅크','https://programmers.co.kr/job_positions/6776','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2594/logo2.png','PostgreSQL Python JavaScript ','Application Support 엔지니어'),
	 ('투핸즈게임즈','https://programmers.co.kr/job_positions/1490','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2053/%EC%86%8C%EA%B0%9C%EC%9A%A9B.jpg','Android Unity C# C++ iOS ','클라이언트 프로그래머'),
	 ('투핸즈게임즈','https://programmers.co.kr/job_positions/1491','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2053/%EC%86%8C%EA%B0%9C%EC%9A%A9B.jpg','Git JavaScript Amazon Web Services(AWS) Node.js ','서버 프로그래머'),
	 ('노타','https://programmers.co.kr/job_positions/6774','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1598/Nota_OndeviceAI_Logo_gray_250px.png',NULL,'ATTF Frontend Engineer'),
	 ('한화테크윈','https://programmers.co.kr/job_positions/6705','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2888/img_w_logo_ko.png','C++ C ','카메라 Application(BE)'),
	 ('에이스프로젝트','https://programmers.co.kr/job_positions/6395','https://grepp-programmers.s3.amazonaws.com/production/company/logo/110/AceProject-CI_%EA%B8%80%EC%9E%90%EB%A7%8C.png','Python Java SQL ','시뮬레이션 엔진 개발자');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('비즈니스캔버스','https://programmers.co.kr/job_positions/4098','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3176/Business_Canvas_Logo_black_square.png','ExpressJS GCP(Google Cloud Platform) Node.js Terraform Docker ','서버 개발자'),
	 ('티오더','https://programmers.co.kr/job_positions/6773','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5584/%ED%8B%B0%EC%98%A4%EB%8D%94-%EC%82%AC%EA%B0%81%ED%98%95-%EA%B3%A0%ED%99%94%EC%A7%88jpg.jpg','CSS TypeScript NoSQL Git GitHub Vuex JavaScript HTML5 ','프론트엔드 시니어 개발자'),
	 ('비즈니스캔버스','https://programmers.co.kr/job_positions/3555','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3176/Business_Canvas_Logo_black_square.png','HTML CSS Webpack ES6 ReactJS JavaScript ','웹 프론트엔드 개발자'),
	 ('스냅스','https://programmers.co.kr/job_positions/4771','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2298/%EC%8A%A4%EB%83%85%EC%8A%A4.png','Kotlin Java MVP ','모바일 개발자 (안드로이드)'),
	 ('스냅스','https://programmers.co.kr/job_positions/4599','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2298/%EC%8A%A4%EB%83%85%EC%8A%A4.png','ReactJS JavaScript ES6 ','웹편집기 개발자 시니어급'),
	 ('스냅스','https://programmers.co.kr/job_positions/4600','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2298/%EC%8A%A4%EB%83%85%EC%8A%A4.png','JavaScript ReactJS ES6 ','프론트엔드'),
	 ('스냅스','https://programmers.co.kr/job_positions/5256','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2298/%EC%8A%A4%EB%83%85%EC%8A%A4.png','Java MySQL Redis Git Spring ','백엔드'),
	 ('스냅스','https://programmers.co.kr/job_positions/4601','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2298/%EC%8A%A4%EB%83%85%EC%8A%A4.png','Swift iOS Objective-C ','모바일 개발 (iOS)'),
	 ('티오더','https://programmers.co.kr/job_positions/6771','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5584/%ED%8B%B0%EC%98%A4%EB%8D%94-%EC%82%AC%EA%B0%81%ED%98%95-%EA%B3%A0%ED%99%94%EC%A7%88jpg.jpg','Spring Boot Spring Cloud Spring Data JPA AWS ECS Aurora DB AWS CodePipeline ','백엔드 팀장급 개발자'),
	 ('유진로봇','https://programmers.co.kr/job_positions/6772','https://grepp-programmers.s3.amazonaws.com/production/company/logo/6044/yujinrobot_ci_PNG.png','AngularJS Java CI/CD Angular CSS JavaScript HTML ','Front-End  개발자 (경력)');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('노타','https://programmers.co.kr/job_positions/6688','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1598/Nota_OndeviceAI_Logo_gray_250px.png',NULL,'RL(Reinforcement Learning) Researcher (전문연 가능)'),
	 ('CJ올리브영','https://programmers.co.kr/job_positions/6138','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3483/CJOY%EB%A1%9C%EA%B3%A0.jpg',NULL,'TPM(Technical Project Manager)'),
	 ('모니터코퍼레이션','https://programmers.co.kr/job_positions/5629','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2497/monitorcorp_logo_square_white_bg_.png','MySQL Java Python Linux Git Node.js ','백엔드 (Back-end) 엔지니어'),
	 ('워드바이스','https://programmers.co.kr/job_positions/6770','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1778/wordvice_logo.jpg','Java Spring Git MySQL ','[Wordvice] JAVA 개발자 채용'),
	 ('엑스이허브','https://programmers.co.kr/job_positions/5897','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5443/company-logo.png','MySQL Laravel PHP ','보충역 개발자'),
	 ('멸치','https://programmers.co.kr/job_positions/6541','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3964/%EB%A9%B8%EC%B9%98%EB%A1%9C%EA%B3%A0_1080x720.jpg','Kotlin RxSwift MVVM(Model-View-ViewModel) iOS Glide Retrofit RxJava ','IOS 개발'),
	 ('멸치','https://programmers.co.kr/job_positions/6542','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3964/%EB%A9%B8%EC%B9%98%EB%A1%9C%EA%B3%A0_1080x720.jpg',NULL,'미디어엔진 개발'),
	 ('멸치','https://programmers.co.kr/job_positions/6540','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3964/%EB%A9%B8%EC%B9%98%EB%A1%9C%EA%B3%A0_1080x720.jpg','iOS Glide Retrofit RxJava Android Kotlin ','Android 개발'),
	 ('에이블리코퍼레이션','https://programmers.co.kr/job_positions/814','https://grepp-programmers.s3.amazonaws.com/production/company/logo/673/%EC%97%90%EC%9D%B4%EB%B8%94%EB%A6%AC%EB%A1%9C%EA%B3%A0.png','Apache Django Python AWS Backup Nginx ExpressJS Node.js ','백엔드 개발자'),
	 ('드림에이스','https://programmers.co.kr/job_positions/6661','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5691/DRIMAES_LOGO_300x97_RGB.png','C C++ Linux kernel Java ','Automotive, AGL , PM, 연구개발 (PM/FRAMEWORK/UI) 채용');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('핀다(FINDA)','https://programmers.co.kr/job_positions/6690','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1452/Finda_Logo_New-square.png','iOS ','iOS 개발자'),
	 ('핀다(FINDA)','https://programmers.co.kr/job_positions/6549','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1452/Finda_Logo_New-square.png','JPA(Java Persistent API) Spring Boot Java ','백엔드 개발자 (시니어)'),
	 ('핀다(FINDA)','https://programmers.co.kr/job_positions/6548','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1452/Finda_Logo_New-square.png','Java Spring Boot AWS RDS AWS EC2 JPA(Java Persistent API) ','백엔드 개발자 (주니어)'),
	 ('퍼즐벤처스','https://programmers.co.kr/job_positions/6567','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3473/Logo_oilnow_symbolText_blue.png','JavaScript MySQL Node.js ','서비스 플랫폼 개발자 (백엔드, Node.js)'),
	 ('아티언스','https://programmers.co.kr/job_positions/6336','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5843/_%EC%A3%BC_%EC%95%84%ED%8B%B0%EC%96%B8%EC%8A%A4_CI.jpg','ReactJS ','프론트엔드 개발자'),
	 ('아티언스','https://programmers.co.kr/job_positions/6295','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5843/_%EC%A3%BC_%EC%95%84%ED%8B%B0%EC%96%B8%EC%8A%A4_CI.jpg','Elasticsearch MySQL R AWS Redshift Python ','서버개발자'),
	 ('크라우드웍스','https://programmers.co.kr/job_positions/6384','https://grepp-programmers.s3.amazonaws.com/production/company/logo/686/BI_4_rectangle.png','Hibernate MySQL Spring MyBatis Java Spring Boot JPA(Java Persistent API) ','Java 백엔드 개발자'),
	 ('파이브락스','https://programmers.co.kr/job_positions/6769','https://grepp-programmers.s3.amazonaws.com/production/company/logo/799/TJ_logo_red.png',NULL,'소프트웨어 엔지니어 (프론트엔드 개발자)'),
	 ('딥바이오','https://programmers.co.kr/job_positions/4183','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2330/CI3.png','Python RabbitMQ Redis TypeScript Docker ExpressJS Node.js Git PostgreSQL ','백엔드 엔지니어'),
	 ('딥바이오','https://programmers.co.kr/job_positions/4182','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2330/CI3.png','Node.js Redux-Saga Redux.js AWS EC2 Electron TypeScript Docker Webpack ES6 ReactJS CSS JavaScript HTML ','프론트엔드 엔지니어');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('모아이스','https://programmers.co.kr/job_positions/6303','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5842/%EC%95%B1%EB%9F%B0%EC%B2%98%EC%95%84%EC%9D%B4%EC%BD%98_%EC%B5%9C%EC%A2%85_32.png','Swift iOS ','iOS 개발자'),
	 ('큐로드','https://programmers.co.kr/job_positions/6588','https://grepp-programmers.s3.amazonaws.com/production/company/logo/6011/qroad_logo__%ED%81%AC%EA%B8%B0_%EC%A1%B0%EC%A0%95_.jpg','XML Java Spring MyBatis JavaScript Git jQuery SQL MySQL ','  웹/서버 개발자'),
	 ('에이블리코퍼레이션','https://programmers.co.kr/job_positions/5140','https://grepp-programmers.s3.amazonaws.com/production/company/logo/673/%EC%97%90%EC%9D%B4%EB%B8%94%EB%A6%AC%EB%A1%9C%EA%B3%A0.png','Kotlin ','Android 개발리드 (안드로이드 리드)'),
	 ('에이블리코퍼레이션','https://programmers.co.kr/job_positions/910','https://grepp-programmers.s3.amazonaws.com/production/company/logo/673/%EC%97%90%EC%9D%B4%EB%B8%94%EB%A6%AC%EB%A1%9C%EA%B3%A0.png','Android Kotlin ','Android 개발자 (병특/산업기능요원 가능)'),
	 ('Sendbird(센드버드)','https://programmers.co.kr/job_positions/3059','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3417/Sendbird_Symbol_RGB.png','ES6 ReactJS JavaScript CSS HTML TypeScript ','Software Engineer, Web Applications (Front End) '),
	 ('폴라리스오피스','https://programmers.co.kr/job_positions/6765','https://grepp-programmers.s3.amazonaws.com/production/company/logo/628/Polaris_Office_portrait.png',NULL,'Data Engineer '),
	 ('자버','https://programmers.co.kr/job_positions/6764','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1913/Jober_Logo_-_favicon_400.png','JavaScript MySQL Node.js ','풀스택 개발자 (Full-Stack Developer)'),
	 ('폴라리스오피스','https://programmers.co.kr/job_positions/6763','https://grepp-programmers.s3.amazonaws.com/production/company/logo/628/Polaris_Office_portrait.png',NULL,'DevOps 엔지니어'),
	 ('Smart Jack','https://programmers.co.kr/job_positions/3554','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2319/logo_black.png','JavaScript CSS ES6 Vue.js ','웹 프론트엔트 개발자'),
	 ('자버','https://programmers.co.kr/job_positions/6762','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1913/Jober_Logo_-_favicon_400.png','JavaScript ReactJS Vue.js ','프론트엔드 개발자');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('핏투게더','https://programmers.co.kr/job_positions/5931','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2087/_PNG__Fitogether.png','AWS Lambda JPA(Java Persistent API) Spring Boot Java Elasticsearch AWS ECS AWS RDS ','백엔드 개발자'),
	 ('트릿지','https://programmers.co.kr/job_positions/6197','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2970/Logo_blue.jpg','HTML JavaScript CSS React Native GraphQL styled-components ','(Youpick) Software Engineer - Frontend'),
	 ('스몰티켓','https://programmers.co.kr/job_positions/6628','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5591/SMT_Logo_Box_Hot_Pink_190712.png',NULL,'QA 엔지니어'),
	 ('이지스토리지','https://programmers.co.kr/job_positions/6637','https://grepp-programmers.s3.amazonaws.com/production/company/logo/3970/ic_launcher.png','Docker GraphQL Node.js TypeScript Redis Git MySQL ES6 ','백엔드 개발자'),
	 ('바텍 네트웍스','https://programmers.co.kr/job_positions/4128','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2589/CI_vatech_primary_PNG_180123-02.png','GraphQL JavaScript ReactJS ','바텍 미국법인 연구소 프론트엔드 개발자(주재원)'),
	 ('바텍 네트웍스','https://programmers.co.kr/job_positions/2504','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2589/CI_vatech_primary_PNG_180123-02.png','Deep Learning Tensorflow ','바텍 미국법인 연구소 AI 개발자(주재원)'),
	 ('바텍 네트웍스','https://programmers.co.kr/job_positions/2147','https://grepp-programmers.s3.amazonaws.com/production/company/logo/2589/CI_vatech_primary_PNG_180123-02.png','Kubernetes Node.js MongoDB AWS DynamoDB Docker ','바텍 미국법인 연구소 Back-end/Infra 개발자(주재원)'),
	 ('노타','https://programmers.co.kr/job_positions/6757','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1598/Nota_OndeviceAI_Logo_gray_250px.png',NULL,'ITS Backend Engineer'),
	 ('델레오코리아','https://programmers.co.kr/job_positions/6078','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1409/deleo.png','Laravel AWS S3 AWS RDS AWS EC2 PHP ','PHP 백엔드개발자'),
	 ('테크타카(ARGO)','https://programmers.co.kr/job_positions/6598','https://grepp-programmers.s3.amazonaws.com/production/company/logo/4325/Artboard_1_4x.png',NULL,'Infra Engineer - 데브옵스 엔지니어');
INSERT INTO HR.JOB_POSTING (COMPANY,URL,LOGOURL,STACKS,JOBPOSITION) VALUES
	 ('홈스토리 생활','https://programmers.co.kr/job_positions/2646','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1772/%EC%95%B1_%EC%95%84%EC%9D%B4%EC%BD%98_-__1_.png','Java Laravel PHP MySQL ','PHP 웹 개발자'),
	 ('구루미','https://programmers.co.kr/job_positions/6220','https://grepp-programmers.s3.amazonaws.com/production/company/logo/5751/logo__1_.png','ES6 ReactJS CI/CD Node.js CSS HTML JavaScript Vue.js ','프론트엔드 개발자'),
	 ('리디','https://programmers.co.kr/job_positions/6752','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png',NULL,'Tech Lead Manager'),
	 ('한국축산데이터','https://programmers.co.kr/job_positions/6750','https://grepp-programmers.s3.amazonaws.com/production/company/logo/1888/%ED%95%9C%EC%B6%95%EB%8D%B0_%EC%8B%AC%EB%B3%BC%EB%A1%9C%EA%B3%A0.png',NULL,'[Infra] Infra 엔지니어'),
	 ('리디','https://programmers.co.kr/job_positions/6751','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png',NULL,'QA 테스터'),
	 ('리디','https://programmers.co.kr/job_positions/5848','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png',NULL,'정보보안 엔지니어'),
	 ('리디','https://programmers.co.kr/job_positions/5847','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png','Terraform Python TypeScript ','DevOps 엔지니어'),
	 ('리디','https://programmers.co.kr/job_positions/6561','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png','SQL ','[Manta] 데이터분석가'),
	 ('리디','https://programmers.co.kr/job_positions/2620','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png',NULL,'검색 엔지니어'),
	 ('리디','https://programmers.co.kr/job_positions/5846','https://grepp-programmers.s3.amazonaws.com/production/company/logo/168/profile_500_500_%E1%84%85%E1%85%A9%E1%84%80%E1%85%A9__2_.png','Python Terraform TypeScript ','Cloud 엔지니어');