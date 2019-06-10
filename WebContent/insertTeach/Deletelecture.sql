CREATE OR REPLACE PROCEDURE Deletelecture(professorId IN VARCHAR2,

   courseId IN VARCHAR2, courseIdNo IN NUMBER, result OUT VARCHAR2)

IS

   student_already EXCEPTION;

   nYear NUMBER;

   nSemester NUMBER;

   student_count NUMBER;

BEGIN

   result := '';

   DBMS_OUTPUT.put_line('#');

   DBMS_OUTPUT.put_line(professorId || '�������� �����ȣ ' || courseId ||

   ', �й� ' || TO_CHAR(courseIdNo) || '�� ���� ������ ��û�Ͽ����ϴ�.');

   

   /* �⵵, �б� �˾Ƴ��� */

   nYear := Date2EnrollYear(SYSDATE);

   nSemester := Date2EnrollSemester(SYSDATE);



   /* ����� �л��� �̹� ���� */

   SELECT COUNT(*)

   INTO student_count

   FROM enroll

   WHERE c_id = courseId and c_id_no = courseIdNo  and

    e_year = nYear and e_semester = nSemester;



    IF (student_count > 0)

   THEN

      RAISE student_already;

   END IF;

   

   /* ���� ���� */ 

   DBMS_OUTPUT.put_line('c_id: '||courseId || 'c_id: '||courseId 

   || 'c_id_no: '||courseIdNo||'t_year: '||nYear||'t_semes: '||nSemester);

   

   Delete from teach where c_id = courseId and c_id_no = courseIdNo  and

    t_year = nYear and t_semester = nSemester;

   COMMIT;

   result := '���°� �����Ǿ����ϴ�.';



   EXCEPTION

   WHEN student_already THEN

      result := '���¸� ����� �л��� �־� ������ �� �����ϴ�';

   WHEN OTHERS THEN

      ROLLBACK;

   result := SQLCODE;

END;

/
