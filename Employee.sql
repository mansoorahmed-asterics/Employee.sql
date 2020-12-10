    CREATE TABLE EMPLOYEEE ( 
	EMP__NO NUMBER(4) CONSTRAINT  EMPNOPK  PRIMARY KEY, 
	E__NAME VARCHAR2(10) NOT NULL, 
	DESIGNATIONN VARCHAR2(10) NOT NULL, 
	QUALIFICATIONN VARCHAR2(20) NOT NULL, 
	JOIN__DATE VARCHAR2(10));

CREATE TABLE PROJECTT ( 
	PID VARCHAR2(4) CONSTRAINT  PIDPK  PRIMARY KEY, 
	TITLE VARCHAR2(20) NOT NULL, 
	CLIENTT VARCHAR2(20) NOT NULL, 
	DURATIONN VARCHAR2(20) NOT NULL, 
	STATUS VARCHAR2(20),
    CONSTRAINT  STATUSCK CHECK (STATUS IN('NEW','IN_PROGRESS','COMPLETE')));

CREATE TABLE EMP_PROJECTT ( 
	EMP__NO NUMBER(4) NOT NULL, 
	PID VARCHAR2(4) NOT NULL, 
	PERFORMANCEE VARCHAR2(20),
    CONSTRAINT PERFORMANCEECK CHECK (PERFORMANCEE IN('EXCELLENT','GOOD','FAIR','BAD','POOR')),
    CONSTRAINT 	EMPNOFK FOREIGN KEY (EMP_NO)  REFERENCES EMPLOYEEE(EMP_NO),
    CONSTRAINT 	PIDFK FOREIGN KEY (PID)  REFERENCES  PROJECTT(PID)); 

CREATE TABLE GRADE (  
	DESIGNATION VARCHAR2(20) NOT NULL, 
	GRADE NUMBER(20) NOT NULL, 
	TOTAL_POSTS VARCHAR2(20) NOT NULL, 
	POSTS_AVAILABLE VARCHAR2(20),
    CONSTRAINT  GRADECK CHECK (GRADE BETWEEN 1 AND 20),
    CONSTRAINT POSTCK CHECK (POSTS_AVAILABLE <= TOTAL_POSTS));

CREATE TABLE TRAINING ( 
	TCODE VARCHAR2(4) CONSTRAINT TCODEPK PRIMARY KEY, 
	TITLE VARCHAR2(20) NOT NULL, 
	START_DATE VARCHAR2(20) NOT NULL, 
	END_DATE VARCHAR2(20) NOT NULL);

CREATE TABLE EMP_TRAINING ( 
	EMP__NO NUMBER(4) NOT NULL, 
	TCODE VARCHAR2(4) NOT NULL, 
	ATTENDANCE NUMBER(3,2),
    CONSTRAINT 	TEMPNOFK FOREIGN KEY (EMP_NO)  REFERENCES EMPLOYEEE(EMP_NO),
    CONSTRAINT 	TCODEFK FOREIGN KEY (TCODE)  REFERENCES  TRAINING(TCODE));