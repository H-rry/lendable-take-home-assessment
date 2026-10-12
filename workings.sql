CREATE TABLE orders    AS SELECT * FROM 'orders.csv';
CREATE TABLE shipments AS SELECT * FROM 'shipments.csv';
CREATE TABLE refunds   AS SELECT * FROM 'refunds.csv';


-- section 1, Q1
SELECT courier, count(shipment_id)  FROM shipments GROUP BY courier;
-- section 1, Q2
SELECT avg(shipping_days) FROM shipments WHERE status='Delivered';
-- section 1, Q3
SELECT avg(s.shipping_days) AS avs, o.region FROM orders o JOIN shipments s ON s.order_id=o.order_id GROUP BY region ORDER BY avs DESC;