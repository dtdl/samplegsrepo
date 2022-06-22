-- FT_TMP_GPCS_INSTR

DECLARE
    cnt   NUMBER(2) := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO
        cnt
    FROM
        user_objects
    WHERE
        object_name = 'FT_TMP_GPCS_INSTR';

    IF
        cnt = 0
    THEN
        EXECUTE IMMEDIATE 'CREATE GLOBAL TEMPORARY TABLE FT_TMP_GPCS_INSTR(SQ_NUM NUMBER, INSTR_ID CHAR(10)) ON COMMIT DELETE ROWS';

    END IF;

    SELECT
        COUNT(1)
    INTO
        cnt
    FROM
        user_objects
    WHERE
        object_name = 'FT_TMP_GPCS_INSTR_I001';

    IF
        cnt = 0
    THEN
        EXECUTE IMMEDIATE 'CREATE INDEX  FT_TMP_GPCS_INSTR_I001 ON FT_TMP_GPCS_INSTR (INSTR_ID)';

    END IF;


END;
/
