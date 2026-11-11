-- 절대값 계산
SELECT ABS(1), ABS(-1);
SELECT ABS(1) as '절대값(1)', ABS(-1) as '절대값(-1)';
-- 문자의 길이 구하기
SELECT LENGTH("groomi");
SELECT LENGTH("groomi") as 'groomi 길이';

-- 나누기에서 나머지 연산
SELECT 7 % 2;
SELECT 7 MOD 2;

-- 나누기 몫 연산
SELECT 7 DIV 2;

-- 가장 가까운 정수로 올림 및 내림
SELECT CEIL (4.5);
SELECT FLOOR (4.5);

-- 지수 6-5 6-6 6-7
-- 밑이 e인 x의 로그. 자연 상수 e는 약 2.71828의 값을 가지는 무리수
SELECT LN(100);

-- 6-5
SELECT LN(100), LOG(100), LOG(10, 100), LOG10(100);

-- 6-6
SELECT MOD(5,4), 5 MOD 4, 5 % 4 ;

-- 6-7
SELECT POWER(4,3), SQRT(3), SIGN(5), SIGN(-7);

SQL에서 SIGN 함수는 전달된 숫자 값이나 수식의 부호(양수, 음수, 0)를 판별하여 특정 값을 반환하는 내장 함수입니다. [1] (https://devchaeyoung.tistory.com/entry/SQL-%EC%9D%8C%EC%88%98-%EC%96%91%EC%88%98-%ED%99%95%EC%9D%B8%ED%95%98%EA%B8%B0-SIGN-%ED%95%A8%EC%88%98)

반환값

• 1 : 입력값이 양수일 때 (> 0)
• 0 : 입력값이 0일 때 (= 0)
• -1 : 입력값이 음수일 때 (< 0)
• NULL : 입력값이 NULL일 때 (대부분의 SQL에서 NULL 반환) [1] (https://doris.apache.org/ko/docs/dev/sql-manual/sql-functions/scalar-functions/numeric-functions/sign/), [2] (https://gent.tistory.com/566)

기본 문법

sql
SIGN(numeric_expression)
코드를 사용할 때는 주의가 필요합니다.
• 인수(numeric_expression): 부호를 판별할 숫자, 컬럼, 혹은 연산 수식
• 지원하는 주요 데이터베이스: Oracle, MS-SQL (Transact-SQL), MySQL, PostgreSQL, IBM Db2 등 대부분의 주요 SQL에서 지원합니다. 공식 사용법은 Microsoft Learn SIGN 함수 문서 등에서 확인하실 수 있습니다. [1] (https://blog.naver.com/regenesis90/222252923499), [2] (https://www.youtube.com/watch?v=kxfrg09K_1A&t=15), [3] (https://www.ibm.com/docs/ko/db2-for-zos/13.0.0?topic=functions-sign), [4] (https://m.blog.naver.com/seek316/222111832628), [5] (https://learn.microsoft.com/ko-kr/sql/t-sql/functions/sign-transact-sql?view=sql-server-ver17)

사용 예시

1. 상수값 판별sql
SELECT SIGN(50), SIGN(-15), SIGN(0);
-- 결과: 1, -1, 0
코드를 사용할 때는 주의가 필요합니다.
2. 수식 결과의 부호 판별sql
SELECT SIGN(10 - 20) AS res1, SIGN(30 - 30) AS res2, SIGN(50 - 10) AS res3;
-- 결과: res1 = -1, res2 = 0, res3 = 1
코드를 사용할 때는 주의가 필요합니다.
3. 테이블 컬럼 및 데이터 비교 활용
	• 특정 기준값과의 차이가 양수인지 음수인지 분류하거나, GROUP BY 또는 ORDER BY, CASE 문과 조합하여 데이터의 증감 추세를 판별할 때 유용하게 쓰입니다. [1] (https://blog.naver.com/regenesis90/222252923499), [2] (https://gent.tistory.com/566), [3] (https://devchaeyoung.tistory.com/entry/SQL-%EC%9D%8C%EC%88%98-%EC%96%91%EC%88%98-%ED%99%95%EC%9D%B8%ED%95%98%EA%B8%B0-SIGN-%ED%95%A8%EC%88%98)
만약 특정 데이터베이스(Oracle, MySQL, MS-SQL 등)에서 실제로 적용하려는 쿼리나 테이블 구조가 있다면 알려주세요. 맞춤형 예시를 작성해 드릴 수 있습니다.


-- 6-8 round (x, d)는 x를 소수점 이하 d자리까지 반올림. TRUNCATE (x, d)는 x를 소수점 이하 d 자리에서 잘라냄.
SELECT ROUND(1153.456, -1), ROUND(1153.456, -2), 
       TRUNCATE(2.4536, 2), TRUNCATE(1153.456, -2);

-- RAND([n])은 0보다 크거나 같고 1보다 작은 난수(실수) 반환함. n 값을 명시하면, 여러번 실행시에도 같은 값을 반환함.
SELECT RAND(), RAND(3), RAND(5);

-- 6-11 한글을 3바이트씩 LENGTH는 바이트 수 반환
SELECT CHAR_LENGTH('SQL'), LENGTH('SQL'), CHAR_LENGTH('홍길동'), LENGTH('홍길동');

-- CONCAT은 문자를 연결해 주는거 중간에 NULL 끼어 있으면, NULL 값 반환 WS는 첫번째꺼가 sep AS 생략 가능
SELECT CONCAT('This','Is','MySQL') CONCAT1, 
       CONCAT('SQL',NULL, 'Books') AS CONCAT2,
       CONCAT_WS(',','This','Is','MySQL') AS CONCAT_WS;
       
-- 문자형 함수 여기 뒤에 AS는 생략해도 됨.
/*
FORMAT (x, d)는 숫자 x의 정수 부분 3자리마다 콤마를 추가해 문자열로 반환, 소수점 이하 d자리 기준으로 반올림
INSTR(str, substr)는 str 문자열에서 substr 문자(열)를 찾아 시작위치 반환.
LOCATE(substr, str, pos), POSITION(substr IN str)는 str 문자열에서 substr 문자(열)를 찾아 시작 위치반환,pos 입력시 해당 위치부터 검색
*/
SELECT FORMAT(123456789.123456, 3) fmt, 
       INSTR('ThisIsSQL', 'sql') instring, 
       LOCATE('my', 'TheMyDBMSMySQL', 5) locates,
       POSITION('my' IN 'TheMyDBMSMySQL') pos
;

-- 6-14 대소문자 변환
SELECT LOWER('ABcD'), LCASE('ABcD'),
       UPPER('abcD'), UCASE('abcD');
       
-- 6-15 LPAD(str, len, padstr)는 str 문자열을 len 길이만큼 반환하는데, 자리가 남으면 왼쪽을 padstr 문자로 채움


-- 6-21
SELECT STRCMP('MySQL','mysql') SAME,
       STRCMP('MySQL1','mysql2') SMALL,
       STRCMP('MySQL2','mysql1') LARGE;
       
-- 6-22
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE,
       CURTIME(), CURRENT_TIME(), CURRENT_TIME,
       NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP;
       
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE, -- 현재 날짜 반환
       CURTIME(), CURRENT_TIME(), CURRENT_TIME, -- 현재 시간을 시분초 형태로 반환
       NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP; -- 현재 날짜와 시간을 반환
       
SELECT DAYNAME('2021-03-10'), -- date의 요일 반환
       DAYOFMONTH('2021-03-10'), DAY('2021-03-10'), -- date에서 일을 반환
       DAYOFWEEK('2021-04-06'), -- date에서 일을 요일별숫자로반환(1:일요일, 7: 토요일)
       DAYOFYEAR('2021-04-06'); -- date에서 1년 기준으로 날짜를 일수로 반환, 반환값의범위는1~366
       
       SELECT STR_TO_DATE('21,01,2021','%d,%m,%Y') CONV1,
       STR_TO_DATE('19:30:17','%H:%i:%s') CONV2,
       STR_TO_DATE('19:30:17','%h:%i:%s') CONV3;
       
SELECT SYSDATE(), SLEEP(2), SYSDATE();

SELECT WEEK('2021-01-03', 0) MODE0,
       WEEK('2021-01-03', 1) MODE1,
       WEEK('2021-01-03', 2) MODE2,
       WEEK('2021-01-03', 3) MODE3,
       WEEK('2021-01-03', 4) MODE4,
       WEEK('2021-01-03', 5) MODE5,
       WEEK('2021-01-03', 6) MODE6,
       WEEK('2021-01-03', 7) MODE7;
       
SELECT CAST(10 AS CHAR)                CONV_CHAR,
       CAST('-10' AS SIGNED )          CONV_INT,
       CAST('10.2131' AS DECIMAL)      CONV_DEC1,
       CAST('10.2131' AS DECIMAL(6,4)) CONV_DEC2,
       CAST('10.2131' AS DOUBLE)       CONV_DOUBLE,
       CAST('2021-10-31' AS DATE)      CONV_DATE,
       CAST('2021-10-31' AS DATETIME)  CONV_DATETIME;
       
SELECT IFNULL( 1, 0) IFNULL1,
       IFNULL(NULL * 3, 0) IFNULL2;
       
SELECT CASE 1 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
       END CASE1,
       CASE 9 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
              ELSE 'None'
       END CASE2,
       CASE WHEN 25 BETWEEN 1  AND 19 THEN '10대'
            WHEN 25 BETWEEN 20 AND 29 THEN '20대'
            WHEN 25 BETWEEN 30 AND 39 THEN '30대'
            ELSE '30대 이상'
       END CASE3;

USE groomi;
SELECT DATABASE(), SCHEMA(), USER();

USE world;

SELECT code, CONCAT(name, ' (', continent, ')', '+',  region) names, population
  FROM country
 WHERE population BETWEEN 45000000 AND 55000000 ;

-- 6-1
SELECT ABS(1), ABS(-1);

-- 6-2
SELECT LENGTH('mysql');

-- 6-3
SELECT 7 % 2, 7 MOD 2, 7 / 2, 7 DIV 2;

-- 6-4
SELECT CEIL(4.5), FLOOR(4.5);

-- 6-5
SELECT LN(100), LOG(100), LOG(10, 100), LOG10(100);

-- 6-6
SELECT MOD(5,4), 5 MOD 4, 5 % 4 ;

-- 6-7
SELECT POWER(4,3), SQRT(3), SIGN(5), SIGN(-7);

-- 6-8
SELECT ROUND(2.4536, 1), ROUND(2.4536, 2), ROUND(2.4536, 3), ROUND(2.4536,0), ROUND(2.4536);

-- 6-9 이거 시험 문제!!!!!!!
SELECT ROUND(1153.456, -1), ROUND(1153.456, -2), 
       TRUNCATE(2.4536, 2), TRUNCATE(1153.456, -2);
       
-- 6-10
SELECT RAND(), RAND(3), RAND(5);

-- 6-11
SELECT CHAR_LENGTH('SQL'), LENGTH('SQL'), CHAR_LENGTH('홍길동'), LENGTH('홍길동');

-- 6-12
SELECT CONCAT('This','Is','MySQL') AS CONCAT1, 
       CONCAT('SQL',NULL, 'Books') AS CONCAT2,
       CONCAT_WS(',','This','Is','MySQL') AS CONCAT_WS;

-- 6-13
SELECT FORMAT(123456789.123456, 3) fmt, 
       INSTR('ThisIsSQL', 'sql') instring, 
       LOCATE('my', 'TheMyDBMSMySQL', 5) locates,
       POSITION('my' IN 'TheMyDBMSMySQL') pos
; 

-- 6-14
SELECT LOWER('ABcD'), LCASE('ABcD'),
       UPPER('abcD'), UCASE('abcD');

-- 6-15
SELECT LPAD('SQL',7,'#'),
       RPAD('SQL',7,'#');


-- 6-16
SELECT LTRIM('     SQL     '),
       RTRIM('     SQL     ');
       
-- 6-17
SELECT LEFT('ThisIsMySQL', 4),
       RIGHT('ThisIsMySQL', 3);
       
-- 6-18
SELECT REPEAT('SQL',3),
       REPLACE('생일 축하해 철수야', '철수', '영희') REP,
       REVERSE('SQL');
       
       
-- 6-19
SELECT SUBSTR('This Is MySQL', 6,2) FIRST,
       SUBSTRING('This Is MySQL', 6) SECOND,
       MID('This Is MySQL',-5) THIRD;
       
       
-- 6-20
SELECT TRIM('  MySQL  ') BASIC,
       TRIM(LEADING '*' FROM '***SQL***') LEFT_TRIM,
       TRIM(TRAILING '*' FROM '***SQL***') RIGHT_TRIM,
       TRIM(BOTH '*' FROM '***SQL***') BOTHS;
       
       
-- 6-21
SELECT STRCMP('MySQL','mysql') SAME,
       STRCMP('MySQL1','mysql2') SMALL,
       STRCMP('MySQL2','mysql1') LARGE;
       
-- 6-22
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE, -- 현재 날짜 반환
       CURTIME(), CURRENT_TIME(), CURRENT_TIME, -- 현재 시간을 시분초 형태로 반환
       NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP; -- 현재 날짜와 시간을 반환
       
-- 6-23
SELECT DAYNAME('2021-03-10'), -- date의 요일 반환
       DAYOFMONTH('2021-03-10'), DAY('2021-03-10'), -- date에서 일을 반환
       DAYOFWEEK('2021-03-10'), -- date에서 일을 요일별숫자로반환(1:일요일, 7: 토요일)
       DAYOFYEAR('2021-03-10'); -- date에서 1년 기준으로 날짜를 일수로 반환, 반환값의범위는1~366
       
       
-- 6-24
SELECT LAST_DAY('2021-03-10'),
       YEAR('2021-03-10'), 
       MONTH('2021-03-10'), 
       QUARTER('2021-03-10'),
       WEEKOFYEAR('2021-03-10');
       
-- 6-25
SELECT DATE('2021-03-10 10:23:31'),
       TIME('2021-03-10 10:23:31');       
       
-- 6-26
SELECT DATE_ADD('2021-01-20', INTERVAL 5 DAY) DATEADD,
       ADDDATE('2021-01-20', INTERVAL 5 DAY) ADD_DATE1,
       ADDDATE('2021-01-20', 5 ) ADD_DATE2;    
       
-- 6-27 시험에 많이 나옴
SELECT DATE_ADD('2021-01-20', INTERVAL '1 2' YEAR_MONTH) DATEADD,
       ADDDATE('2021-01-20', INTERVAL '1 2' DAY_HOUR ) ADD_DATE;
       
-- 6-28
SELECT DATE_SUB('2021-01-20', INTERVAL 5 DAY) DATESUB,
       SUBDATE('2021-01-20', INTERVAL 5 DAY) SUB_DATE1,
       SUBDATE('2021-01-20', 5 ) SUB_DATE2;
       
-- 6-29 EXTRACT(unitFROMdate) date에서 unit으로 지정된 부분 반환
SELECT EXTRACT(YEAR_MONTH    FROM '2020-01-20 13:32:03') YEARMON,
       EXTRACT(DAY_HOUR      FROM '2020-01-20 13:32:03') DAYHOUR,
       EXTRACT(MINUTE_SECOND FROM '2020-01-20 13:32:03') MINSEC;
       
       
-- 6-30 DATEDIFF(expr1,expr2)  expr1에서 expr2를 뺀 날짜를 일수로 반환
SELECT DATEDIFF('2021-01-31','2021-01-21') Diff1,
       DATEDIFF('2021-01-31','2021-02-01') Diff2,
       DATEDIFF('2021-01-31 00:00:00','2021-01-30 23:59:59') Diff3;
       
       
-- 6-31 DATE_FORMAT(date, format) 
SELECT DATE_FORMAT('2021-01-20 13:42:54','%d-%b-%Y') Fmt1,
       DATE_FORMAT('2021-02-20 13:42:54','%U %W %j') Fmt2;

/*
%d 일 (2자리)
%b 월(영어로) 1월 Jan
%Y 4자리 연도
%d
%b
%Y
%U
%W
%j
*/    
       
-- 6-32
SELECT STR_TO_DATE('21,01,2021','%d,%m,%Y') CONV1,
       STR_TO_DATE('19:30:17','%H:%i:%s') CONV2,
       STR_TO_DATE('19:30:17','%h:%i:%s') CONV3;


-- 6-33
SELECT MAKEDATE(2021,1) MDATE1,
       MAKEDATE(2021,100) MDATE2,
       MAKEDATE(2020,365) MDATE3;


-- 6-34
SELECT SYSDATE(), SLEEP(2), SYSDATE();

/*
아래 있는 NOW는 한 query 내에서 같은 값을 유지함.
*/

SELECT NOW(), SLEEP(2), NOW();


-- 6-35 잘 나오지 않지만 봐보기...
SELECT WEEK('2021-01-03', 0) MODE0, --일요일
       WEEK('2021-01-03', 1) MODE1, 
       WEEK('2021-01-03', 2) MODE2,
       WEEK('2021-01-03', 3) MODE3,
       WEEK('2021-01-03', 4) MODE4,
       WEEK('2021-01-03', 5) MODE5,
       WEEK('2021-01-03', 6) MODE6,
       WEEK('2021-01-03', 7) MODE7;
       
-- 6-36 위에꺼랑 비슷함.
SELECT YEARWEEK('2021-01-03')    NOMODE,
       YEARWEEK('2021-01-03', 0) MODE0,
       YEARWEEK('2021-01-03', 1) MODE1,
       YEARWEEK('2021-01-03', 2) MODE2,
       YEARWEEK('2021-01-03', 3) MODE3,
       YEARWEEK('2021-01-03', 4) MODE4,
       YEARWEEK('2021-01-03', 5) MODE5,
       YEARWEEK('2021-01-03', 6) MODE6,
       YEARWEEK('2021-01-03', 7) MODE7;
       
-- 6-37 데이터 형 타입을 변환하는 함수
SELECT CAST(10 AS CHAR)                CONV_CHAR,
       CAST('-10' AS SIGNED )          CONV_INT,
       CAST('10.2131' AS DECIMAL)      CONV_DEC1,
       CAST('10.2131' AS DECIMAL(6,4)) CONV_DEC2,
       CAST('10.2131' AS DOUBLE)       CONV_DOUBLE,
       CAST('2021-10-31' AS DATE)      CONV_DATE,
       CAST('2021-10-31' AS DATETIME)  CONV_DATETIME;
       
       
-- 6-38
SELECT CONVERT(10, CHAR)                CONV_CHAR,
       CONVERT('-10', SIGNED )          CONV_INT,
       CONVERT('10.2131', DECIMAL)      CONV_DEC1,
       CONVERT('10.2131', DECIMAL(6,4)) CONV_DEC2,
       CONVERT('10.2131', DOUBLE)       CONV_DOUBLE,
       CONVERT('2021-10-31', DATE)      CONV_DATE,
       CONVERT('2021-10-31', DATETIME)  CONV_DATETIME;
       
       
-- 6-39
SELECT IF( 2 > 1, 1, 0) IF1,
       IF( 'A' = 'a', 'SAME', 'NOT SAME') IF2,
       IF( 1=2, 1, 'A') IF3;
       
       
-- 6-40
SELECT IFNULL( 1, 0) IFNULL1,
       IFNULL(NULL * 3, 0) IFNULL2;
       
       
-- 6-41
SELECT NULLIF(1, 1) NULLIF1,
       NULLIF(1, 0) NULLIF2,
       NULLIF(NULL, NULL) NULLIF3;
       
       
-- 6-42
SELECT CASE 1 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
       END CASE1,
       CASE 9 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
              ELSE 'None'
       END CASE2,
       CASE WHEN 25 BETWEEN 1  AND 19 THEN '10대'
            WHEN 25 BETWEEN 20 AND 29 THEN '20대'
            WHEN 25 BETWEEN 30 AND 39 THEN '30대'
            ELSE '30대 이상'
       END CASE3;
       
       
-- 6-43
SELECT SLEEP(5);


-- 6-44
USE mywork;

SELECT DATABASE(), SCHEMA(), USER();


-- 6-45
USE world;

SELECT code, CONCAT(name, ' (', continent, ')') names, region, population
  FROM country
 WHERE population BETWEEN 45000000 AND 55000000 ;
 
SELECT code, CONCAT(name, ' (', continent, ')', '+',  region) names, population
  FROM country
 WHERE population BETWEEN 45000000 AND 55000000 ;

-- 6-46 
USE mywork;

SELECT years, ranks, movie_name, release_date, audience_num, ROUND(sale_amt / 100000000) AS sales
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND rep_country = '한국'
   AND audience_num >= 5000000 ; 
   
   
-- 6-47
SELECT ranks, movie_name, DAYNAME(release_date),
       CASE WHEN QUARTER(release_date) IN (1,2) THEN '상반기'
            ELSE '하반기'
       END case1
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND ranks <= 10
ORDER BY 1; 


-- 1분 퀴즈 3
SELECT REPLACE('산토끼 토끼야', '토끼', '거북이');

-- 1분 퀴즈 4
SELECT DAYNAME(LAST_DAY(CURDATE()));

-- 1분 퀴즈 5
USE world;
 
SELECT name, IFNULL(indepyear, '없음')
  FROM country;


-- Self Check1
SELECT ADDDATE('20210512', 100) 100일,
       ADDDATE('20210512', 500) 500일,
       ADDDATE('20210512', 1000) 1000일;

-- Self Check2
USE mywork;

SELECT movie_name, release_date
  FROM box_office
 WHERE EXTRACT(YEAR_MONTH FROM release_date) = '201912';

-- Self Check3
SELECT movie_name, REPLACE(director, ',', '/') directors
  FROM box_office;
  

-- Self Check4
SELECT movie_name, release_date
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND INSTR(movie_name, ':') > 0;

