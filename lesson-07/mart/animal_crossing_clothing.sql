-- Сборная таблица одежды
CREATE TABLE animal_crossing.clothing AS
SELECT 'accessories' AS category,name,variation, diy,buy, style, label_themes FROM animal_crossing.accessories_row
UNION ALL
SELECT 'bags', name,variation, diy,buy, style, label_themes FROM animal_crossing.bags_row
UNION ALL
SELECT 'bottoms', name,variation, diy,buy, style, label_themes FROM animal_crossing.bottoms_row
UNION ALL
SELECT 'dress_up', name,variation, diy,buy, style, label_themes FROM animal_crossing.dress_up_row
UNION ALL
SELECT 'headwear', name,variation, diy,buy, style, label_themes FROM animal_crossing.headwear_row
UNION ALL
SELECT 'shoes', name,variation, diy,buy, style, label_themes FROM animal_crossing.shoes_row
UNION ALL
SELECT 'socks', name,variation, diy,buy, style, label_themes FROM animal_crossing.socks_row
UNION ALL
SELECT 'tops', name,variation, diy,buy, style, label_themes FROM animal_crossing.tops_row
UNION ALL
SELECT 'umbrellas', name,color_1 as variation, diy,buy, 'umbrella', 'umbrella' FROM animal_crossing.umbrellas_row;

-- Табличка с количеством предметов одежды по категориям
CREATE VIEW mart_clothing_by_category AS
SELECT
    category,
    COUNT(DISTINCT name) AS items_cnt
FROM clothing
GROUP BY category
ORDER BY items_cnt DESC;

-- Средняя цена одежды по стилю
CREATE VIEW mart_avg_price_by_style AS
SELECT
    style,
    AVG(buy) AS avg_price
FROM clothing
WHERE buy IS NOT NULL AND buy > 0
GROUP BY style
ORDER BY avg_price DESC;

-- Топ 10 самых дорогих предметов одежды
CREATE VIEW mart_top_expensive_clothing AS
SELECT
    name,
    variation,
    category,
    buy
FROM clothing
WHERE buy IS NOT NULL AND buy > 0
ORDER BY buy DESC
LIMIT 10;

-- Топ 5 самых дорогих предметов одежды по категориям
CREATE VIEW mart_clothing_price_rank AS
SELECT *
FROM (
    SELECT
        name,
        category,
        buy,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY buy DESC
        ) AS rn
    FROM (
        SELECT
            name,
            category,
            MAX(buy) AS buy
        FROM clothing
        WHERE buy IS NOT NULL AND buy > 0
        GROUP BY name, category
    ) t
) ranked
WHERE rn <= 5;


