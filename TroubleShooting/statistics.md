
:octocat: [Main](/)
> Trouble Shooting

## 통계
- 월별 매출 통계 잘못된 추출
    -  Mapper 수정으로 문제 해결




#### 월별 매출 통계 잘못된 추출
- 매출이 존재하는 객실 타입만 금액이 출력되는 문제 발생
- JOIN에서 WHERE 절을 사용하여 조건을 넣었더니 JOIN이 완료된 후 WHERE 조건에 맞지 않는 행이 제거
```sql
SELECT
  CASE
    WHEN R.ROOMTYPE IS NULL THEN '전체'
    ELSE R.ROOMTYPE
    END AS ROOMTYPE,
  COALESCE(SUM(DATEDIFF(B.CHECKOUTDATE, B.CHECKINDATE) * R.ROOMPRICE), 0) AS TOTAL
FROM ROOMTYPE R
       LEFT JOIN BOOKING B ON R.ROOMTYPE = B.ROOMTYPE
  AND B.PAYMENTDATE BETWEEN CONCAT(DATE_FORMAT(CURDATE(), '%Y-%m'), '-01') AND CURDATE()
GROUP BY R.ROOMTYPE WITH ROLLUP;  
```
> ON 절에 AND를 사용하여 조건을 넣는 경우 SQL은 JOIN을 실행하기 전에 해당 조건을 적용하기 때문에 JOIN과정에서 처음부터 조건에 맞지 않는 행이 제외
> <br>  
> 달의 1일부터 금일 사이 날짜에 있지 않은 예약에 해당하는 ROOMTYPE은 결과에 포함되지만, TOTAL 값이 0으로 계산