CREATE PROCEDURE `cost_comp` ()
BEGIN
SELECT p.Distance, p.Price,
CASE
WHEN p.Price>1000 THEN 'Expensive'
WHEN p.Price<1000 AND p.Price>500 THEN 'Average Cost'
ELSE 'Cheap'
END AS VERDICT FROM PRICE p;
END