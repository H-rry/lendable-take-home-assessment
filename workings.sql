CREATE TABLE orders    AS SELECT * FROM 'orders.csv';
CREATE TABLE shipments AS SELECT * FROM 'shipments.csv';
CREATE TABLE refunds   AS SELECT * FROM 'refunds.csv';


-- s1 q1
SELECT courier, count(shipment_id)  FROM shipments GROUP BY courier;
-- s1 q2
SELECT avg(shipping_days) FROM shipments WHERE status='Delivered';
-- s1 q3
SELECT avg(s.shipping_days) AS avs, o.region FROM orders o JOIN shipments s ON s.order_id=o.order_id GROUP BY region ORDER BY avs DESC;
-- s1 q4
SELECT sum(order_value) AS s, category FROM orders GROUP BY category ORDER BY s DESC;
-- s1 q5
SELECT o.category, sum(r.order_id)/sum(o.order_id) as refund_rate FROM orders o LEFT JOIN refunds r ON r.order_id=o.order_id GROUP BY category ORDER BY refund_rate DESC;
-- s1 q6

-- s1 q7
SELECT s.courier, (sum(r.order_id)/sum(s.order_id)) * 100 as refund_percentage FROM shipments s LEFT JOIN refunds r ON r.order_id=s.order_id WHERE s.status='Returned'  GROUP BY s.courier ORDER BY refund_percentage ASC;
-- s1 q8

