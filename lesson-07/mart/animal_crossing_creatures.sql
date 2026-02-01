-- Сщбрала себе обобщенную табличку с насекомыми и рыбами
-- для дальнейшего анализа кого выгоднее фармить

CREATE TABLE animal_crossing.creatures_stage AS
SELECT
    'insect' AS category,
    name,
    sell,
    total_catches_to_unlock,
    spawn_rates,
  nh_jan,
  nh_feb,
  nh_mar,
  nh_apr,
  nh_may,
  nh_jun,
  nh_jul,
  nh_aug,
  nh_sep,
  nh_oct,
  nh_nov,
  nh_dec,
  sh_jan,
  sh_feb,
  sh_mar,
  sh_apr,
  sh_may,
  sh_jun,
  sh_jul,
  sh_aug,
  sh_sep,
  sh_oct,
  sh_nov,
  sh_dec
FROM animal_crossing.insects_row
UNION ALL
SELECT
    'fish' AS category,
    name,
    sell,
    total_catches_to_unlock,
    spawn_rates,
     nh_jan,
  nh_feb,
  nh_mar,
  nh_apr,
  nh_may,
  nh_jun,
  nh_jul,
  nh_aug,
  nh_sep,
  nh_oct,
  nh_nov,
  nh_dec,
  sh_jan,
  sh_feb,
  sh_mar,
  sh_apr,
  sh_may,
  sh_jun,
  sh_jul,
  sh_aug,
  sh_sep,
  sh_oct,
  sh_nov,
  sh_dec
FROM animal_crossing.fish_row; 

-- Табличка с агрегатами по цене продажи насекомых и рыб

CREATE TABLE animal_crossing.creatures_price_mart AS
SELECT
    category,
    COUNT(*)              AS total_count,
    AVG(sell)             AS avg_sell_price,
    MIN(sell)             AS min_sell_price,
    MAX(sell)             AS max_sell_price
FROM animal_crossing.creatures_stage
GROUP BY category;

-- Табличка с квантилями цены продажи насекомых и рыб

CREATE TABLE animal_crossing.creatures_price_quantiles AS
SELECT
    category,
    percentile_approx(sell, 0.25) AS p25,
    percentile_approx(sell, 0.50) AS median,
    percentile_approx(sell, 0.75) AS p75,
    percentile_approx(sell, 0.90) AS p90
FROM animal_crossing.creatures_stage
GROUP BY category;

-- Топ 10 самых дорогих насекомых и рыб

CREATE TABLE animal_crossing.creatures_top10 AS
SELECT
    category,
    name,
    sell,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY sell DESC) AS rank
FROM animal_crossing.creatures_stage
QUALIFY rank <= 10;

