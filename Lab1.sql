DECLARE
    arg1 UNIVERSITY.UNIV_ID%TYPE;
    arg2 UNIVERSITY.UNIV_NAME%TYPE;
    arg3 UNIVERSITY.RATING%TYPE;
    arg4 UNIVERSITY.CITY%TYPE;
    CURSOR cur1 is SELECT * FROM UNIVERSITY;
    special_case EXCEPTION;
    BEGIN
        open cur1;
        FETCH cur1 into arg1, arg2, arg3, arg4;
        while cur1%found LOOP
            DBMS_OUTPUT.put_line(cur1%rowcount||' '||arg1||' '||arg2||' '||arg3||' '||arg4);
            if arg3 > 200
                then raise special_case;
            fetch cur1 into arg1, arg2, arg3, arg4;
            end if;
        end loop;
        EXECUTION
            when special_case THEN
                DBMS_OUTPUT.PUT_LINE('Пользовательское исключение');
            when others THEN
                DBMS_OUTPUT.PUT_LINE('Ошибки приложения');
    end;