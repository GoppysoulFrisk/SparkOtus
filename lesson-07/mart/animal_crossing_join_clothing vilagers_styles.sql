-- табличка с одеждой, которую носят жители
CREATE TABLE animal_crossing.clothing_villagers AS
SELECT 'accessories' AS category,name,variation, diy,buy, style, label_themes FROM animal_crossing.accessories_row
UNION ALL
SELECT 'bags', name,variation, diy,buy, style, label_themes FROM animal_crossing.bags_row
UNION ALL
SELECT 'dress_up', name,variation, diy,buy, style, label_themes FROM animal_crossing.dress_up_row
UNION ALL
SELECT 'headwear', name,variation, diy,buy, style, label_themes FROM animal_crossing.headwear_row
UNION ALL
SELECT 'tops', name,variation, diy,buy, style, label_themes FROM animal_crossing.tops_row
UNION ALL
SELECT 'umbrellas', name,color_1 as variation, diy,buy, 'umbrella', 'umbrella' FROM animal_crossing.umbrellas_row;


-- Табличка с количеством предметов одежды по стилям, которые носят жители
CREATE VIEW mart_villager_style_match AS
SELECT
    v.name AS villager_name,
    v.style_1,
    v.style_2,
    COUNT(DISTINCT c.name) AS matching_clothing
FROM villagers_row v
LEFT JOIN clothing_villagers c
  ON c.style = v.style_1
     OR c.style = v.style_2
GROUP BY v.name, v.style_1, v.style_2
ORDER BY matching_clothing DESC;