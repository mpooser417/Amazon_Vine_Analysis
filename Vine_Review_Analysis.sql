CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
select * into vine_table1 from vine_table
    where total_votes >= 20;
select * into vine_table2 from vine_table1
    WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
select * into vine_table3 from vine_table2
    where vine = 'Y';
select * from vine_table3;
select * into vine_table4 from vine_table2
    where vine = 'N';
select * from vine_table4;
select count(review_id) as "Count of Vine Reviews" from vine_table3;
select count(review_id) as "Count of 5-Star Reviews" from vine_table3
    where star_rating = 5;
select star_rating, round(count(*) * 100.0 / (select count(*) from vine_table3),2) as "% of 5-Star Reviews" 
    from vine_table3
    where star_rating = 5
    group by star_rating;
select count(review_id) as "Count of Non-Vine Reviews" from vine_table4;
select count(review_id) as "Count of 5-Star Reviews" from vine_table4
    where star_rating = 5;
select star_rating, round(count(*) * 100.0 / (select count(*) from vine_table4),2) as "% of 5-Star Reviews" 
    from vine_table4
    where star_rating = 5
    group by star_rating;