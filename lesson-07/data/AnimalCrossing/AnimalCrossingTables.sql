create database animal_crossing;
USE animal_crossing;

CREATE TABLE if not exists accessories_row  (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    type STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists if not exists achievements_row (
    name STRING,
    award_criteria STRING,
    col INT,
    internal_id INT,
    internal_name STRING,
    internal_category STRING,
    num_of_tiers INT,
    tier_1 INT,
    tier_2 INT,
    tier_3 INT,
    tier_4 INT,
    tier_5 INT,
    reward_tier_1 INT,
    reward_tier_2 INT,
    reward_tier_3 INT,
    reward_tier_4 INT,
    reward_tier_5 INT,
    reward_tier_6 INT,
    sequential STRING,
    version STRING,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists art_row (
    name STRING,
    genuine STRING,
    category STRING,
    buy INT,
    sell INT,
    color_1 FLOAT,
    color_2 FLOAT,
    size STRING,
    real_artwork_title STRING,
    artist STRING,
    museum_description STRING,
    source STRING,
    source_notes FLOAT,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series FLOAT,
    hha_set FLOAT,
    interact STRING,
    tag STRING,
    speaker_type STRING,
    lighting_type STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists bags_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists bottoms_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists construction_row (
    name STRING,
    buy INT,
    category STRING,
    source STRING,
    filename STRING,
    version STRING,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists dress_up_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    primary_shape STRING,
    secondary_shape STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists fencing_row (
    name STRING,
    diy STRING,
    stack_size INT,
    buy INT,
    sell INT,
    source STRING,
    source_notes STRING,
    version STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists fish_row (
    col INT,
    name STRING,
    sell INT,
    wherehow STRING,
    shadow STRING,
    total_catches_to_unlock INT,
    spawn_rates STRING,
    rainsnow_catch_up STRING,
    nh_jan STRING,
    nh_feb STRING,
    nh_mar STRING,
    nh_apr STRING,
    nh_may STRING,
    nh_jun STRING,
    nh_jul STRING,
    nh_aug STRING,
    nh_sep STRING,
    nh_oct STRING,
    nh_nov STRING,
    nh_dec STRING,
    sh_jan STRING,
    sh_feb STRING,
    sh_mar STRING,
    sh_apr STRING,
    sh_may STRING,
    sh_jun STRING,
    sh_jul STRING,
    sh_aug STRING,
    sh_sep STRING,
    sh_oct STRING,
    sh_nov STRING,
    sh_dec STRING,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    lighting_type STRING,
    icon_filename STRING,
    critterpedia_filename STRING,
    furniture_filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists floors_row (
    name STRING,
    vfx STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    miles_price FLOAT,
    source STRING,
    source_notes FLOAT,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    tag STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists fossils_row (
    name STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    museum STRING,
    version STRING,
    interact STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists headwear_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    type STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists housewares_row (
    name STRING,
    variation STRING,
    body_title STRING,
    pattern STRING,
    pattern_title STRING,
    diy STRING,
    body_customize STRING,
    pattern_customize STRING,
    kit_cost FLOAT,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    hha_set STRING,
    interact STRING,
    tag STRING,
    outdoor STRING,
    speaker_type STRING,
    lighting_type STRING,
    catalog STRING,
    filename STRING,
    variant_id STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists insects_row (
    col INT,
    name STRING,
    sell INT,
    wherehow STRING,
    weather STRING,
    total_catches_to_unlock INT,
    spawn_rates STRING,
    nh_jan STRING,
    nh_feb STRING,
    nh_mar STRING,
    nh_apr STRING,
    nh_may STRING,
    nh_jun STRING,
    nh_jul STRING,
    nh_aug STRING,
    nh_sep STRING,
    nh_oct STRING,
    nh_nov STRING,
    nh_dec STRING,
    sh_jan STRING,
    sh_feb STRING,
    sh_mar STRING,
    sh_apr STRING,
    sh_may STRING,
    sh_jun STRING,
    sh_jul STRING,
    sh_aug STRING,
    sh_sep STRING,
    sh_oct STRING,
    sh_nov STRING,
    sh_dec STRING,
    color_1 STRING,
    color_2 STRING,
    icon_filename STRING,
    critterpedia_filename STRING,
    furniture_filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists miscellaneous_row (
    name STRING,
    variation STRING,
    body_title STRING,
    pattern STRING,
    pattern_title STRING,
    diy STRING,
    body_customize STRING,
    pattern_customize STRING,
    kit_cost FLOAT,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    hha_set STRING,
    interact STRING,
    tag STRING,
    outdoor STRING,
    speaker_type STRING,
    lighting_type STRING,
    catalog STRING,
    filename STRING,
    variant_id STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists music_row (
    name STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    version STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists other_row (
    name STRING,
    diy STRING,
    stack_size INT,
    buy INT,
    sell FLOAT,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    tag STRING,
    color_1 STRING,
    color_2 STRING,
    version STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists photos_row (
    name STRING,
    variation STRING,
    body_title STRING,
    pattern FLOAT,
    pattern_title FLOAT,
    diy STRING,
    customize STRING,
    kit_cost INT,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    version STRING,
    catalog STRING,
    filename STRING,
    variant_id STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists posters_row (
    name STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    version STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists reactions_row (
    name STRING,
    source STRING,
    source_notes STRING,
    internal_id FLOAT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");


CREATE table if not exists  recipes_row (
    name STRING,
    n_1 INT,
    material_1 STRING,
    n_2 INT,
    material_2 STRING,
    n_3 INT,
    material_3 STRING,
    n_4 INT,
    material_4 STRING,
    n_5 INT,
    material_5 STRING,
    n_6 INT,
    material_6 STRING,
    buy INT,
    sell INT,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    recipes_to_unlock INT,
    version STRING,
    category STRING,
    serial_id INT,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists rugs_row (
    name STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    tag STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists shoes_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists socks_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists tools_row (
    name STRING,
    variation STRING,
    body_title STRING,
    diy STRING,
    customize STRING,
    kit_cost FLOAT,
    uses STRING,
    stack_size INT,
    buy INT,
    sell INT,
    color_1 FLOAT,
    color_2 FLOAT,
    size STRING,
    set_ STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    version STRING,
    filename STRING,
    variant_id STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists tops_row (
    name STRING,
    variation STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    seasonal_availability STRING,
    mannequin_piece STRING,
    version STRING,
    style STRING,
    label_themes STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists umbrellas_row (
    name STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    miles_price FLOAT,
    source STRING,
    source_notes STRING,
    version STRING,
    villager_equippable STRING,
    catalog STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists villagers_row (
    name STRING,
    species STRING,
    gender STRING,
    personality STRING,
    hobby STRING,
    birthday STRING,
    catchphrase STRING,
    favorite_song STRING,
    style_1 STRING,
    style_2 STRING,
    color_1 STRING,
    color_2 STRING,
    wallpaper STRING,
    flooring STRING,
    furniture_list STRING,
    filename STRING,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists wall_mounted_row (
    name STRING,
    variation STRING,
    body_title STRING,
    pattern STRING,
    pattern_title STRING,
    diy STRING,
    body_customize STRING,
    pattern_customize STRING,
    kit_cost FLOAT,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    size STRING,
    source STRING,
    source_notes STRING,
    version STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    hha_set STRING,
    interact STRING,
    tag STRING,
    outdoor STRING,
    lighting_type STRING,
    door_deco STRING,
    catalog STRING,
    filename STRING,
    variant_id STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE if not exists wallpaper_row (
    name STRING,
    vfx STRING,
    vfx_type STRING,
    diy STRING,
    buy INT,
    sell INT,
    color_1 STRING,
    color_2 STRING,
    miles_price FLOAT,
    source STRING,
    source_notes FLOAT,
    catalog STRING,
    window_type STRING,
    window_color STRING,
    pane_type STRING,
    curtain_type STRING,
    curtain_color STRING,
    ceiling_type STRING,
    hha_concept_1 STRING,
    hha_concept_2 STRING,
    hha_series STRING,
    tag STRING,
    version STRING,
    filename STRING,
    internal_id INT,
    unique_entry_id STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");