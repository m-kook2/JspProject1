--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-10-2020   
--------------------------------------------------------
DROP PROCEDURE "J20200701"."BOOK_MIND_ARRAY";
--------------------------------------------------------
--  DDL for Procedure BOOK_MIND_ARRAY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "J20200701"."BOOK_MIND_ARRAY" 
(p_id in book_mind.id%type)
IS
  Cursor tbl_book_mind Is Select  id, m_idx,idx
                          From    book_mind
                          WHERE   id =  p_id
                          order by idx;   
  vId      book_mind.id%type;
  vM_idx   book_mind.m_idx%type;
  vIdx     book_mind.idx%type;
  v_seq    number;
Begin
  DBMS_OUTPUT.ENABLE;
    v_seq := 0;
   --Cursor를 FOR문에서 실행시킨다
  FOR book_mind_list IN tbl_book_mind LOOP
       v_seq := v_seq+1;
       UPDATE  book_mind 
       SET     idx = v_seq
       WHERE   id = book_mind_list.id
       AND     m_idx = book_mind_list.m_idx
       ;
      DBMS_OUTPUT.PUT_LINE('유저명 : ' || book_mind_list.id);
      DBMS_OUTPUT.PUT_LINE('영화 번호 : ' || book_mind_list.m_idx);
      DBMS_OUTPUT.PUT_LINE('순서 번호 : ' || book_mind_list.idx);
  END LOOP;

END;

/
