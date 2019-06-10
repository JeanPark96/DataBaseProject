CREATE OR REPLACE PROCEDURE Insertlecture(professorId IN VARCHAR2,

   courseId IN VARCHAR2, courseIdNo IN NUMBER, tDay IN VARCHAR2, tTime IN VARCHAR2,

   tRoom IN VARCHAR2, tMax IN NUMBER, result OUT VARCHAR2)

IS

   course_already EXCEPTION;

   room_already EXCEPTION;

   nYear NUMBER;

   nSemester NUMBER;

   already_course_count NUMBER;

   already_room_count NUMBER;

BEGIN

   result := '';

   DBMS_OUTPUT.put_line('#');

   DBMS_OUTPUT.put_line(professorId || '�������� �����ȣ ' || courseId ||

   ', �й� ' || TO_CHAR(courseIdNo) || '�� ���� ������ ��û�Ͽ����ϴ�.');

   

   /* �⵵, �б� �˾Ƴ��� */

   nYear := Date2EnrollYear(SYSDATE);

   nSemester := Date2EnrollSemester(SYSDATE);



   /* �ش� �й� ���� �̹� ���� */

   SELECT COUNT(*)

   INTO already_course_count

   FROM teach

   WHERE c_id = courseId and c_id_no = courseIdNo  and

    t_year = nYear and t_semester = nSemester;



    /* �ش� ���ǽ� �̹� ���� ���� */

   SELECT COUNT(*)

   INTO already_room_count

   FROM teach

   WHERE t_day = tDay and t_room = tRoom  and t_time = tTime and

    t_year = nYear and t_semester = nSemester;



    IF (already_course_count > 0)

   THEN

      RAISE course_already;

   END IF;



   IF (already_room_count > 0)

   THEN

      RAISE room_already;

   END IF;

   

   DBMS_OUTPUT.put_line('c_id: '||courseId || 'c_id: '||courseId 

   || 'c_id_no: '||courseIdNo||'t_year: '||nYear||'t_semes: '||nSemester);



   /* ���� ���� */   

   INSERT INTO teach(p_id, c_id, c_id_no, t_year, t_semester, t_day, t_time, t_room, t_max)

   VALUES (professorId, courseId, courseIdNo, nYear, nSemester, tDay, tTime, tRoom, tMax);

   COMMIT;

   result := '���� ������ �Ϸ�Ǿ����ϴ�.';



   EXCEPTION

   WHEN course_already THEN

      result := '�ش� ���°� �̹� �����Ǿ� �ֽ��ϴ�';

   WHEN room_already THEN

      result := '�ش� ���ǽǿ� �̹� ������ �ֽ��ϴ�';

   WHEN OTHERS THEN

      ROLLBACK;

   result := SQLCODE;

END;

/