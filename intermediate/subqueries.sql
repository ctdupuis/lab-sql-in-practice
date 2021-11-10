-- EXAMPLE SUBQUERIES

SELECT *
FROM authors
WHERE author_id IN (
  SELECT author_id FROM books WHERE pages > 1000
);

UPDATE books
SET pages = 7
WHERE book_id IN (
  SELECT book_id
  FROM books
  WHERE title = 'Tiny Book'
);

DELETE
FROM books
WHERE author_id IN (
  SELECT author_id
  FROM authors
  WHERE author = 'Williams'
);

-- 1.
select * from invoice
where invoice_id in (
	select invoice_id from invoice_line where unit_price > 0.99
);

-- 2.
select * from playlist_track
where track_id in (
  select t.track_id from track t
  join playlist_track pt
  on t.track_id = pt.track_id
  join playlist p
  on p.playlist_id = pt.playlist_id
  where p.name = 'Music'
);