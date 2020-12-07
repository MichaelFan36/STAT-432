# load tidyverse for data manipulaiton
library("tidyverse")

# read in full data
pitches_all = tibble::as_tibble(data.table::fread("C:/Users/cozyn/Desktop/STATS432/STAT-432/pitch-analysis/data-raw/pithces_all.csv"))

# create subset of "full" data for analysis, only 2020 pitches
# only use subset of available variables most relevant to pitch types
# remove knuckleballs
pitches_2020 = pitches_all %>%
  filter(game_year == 2020) %>%
  select(
    pitch_type,
    game_date,
    release_speed,
    release_pos_x,
    release_pos_y,
    release_pos_z,
    player_name,
    batter,
    pitcher,
    zone,
    stand,
    p_throws,
    pfx_x,
    pfx_z,
    plate_x,
    plate_z,
    vx0,
    vy0,
    vz0,
    ax,
    ay,
    az,
    effective_speed,
    release_spin_rate,
    release_extension,
    game_type
  ) %>%
  filter(pitch_type != "KN")

# merge similar pitch types
pitches_2020[pitches_2020$pitch_type == "CS", ]$pitch_type = "CU"
pitches_2020[pitches_2020$pitch_type == "FO", ]$pitch_type = "FS"
pitches_2020[pitches_2020$pitch_type == "KC", ]$pitch_type = "CU"

# create dataset of full data regular season pitches
pitches_2020_regular = pitches_2020 %>%
  filter(game_type == "R") %>%
  filter(pitch_type != "null") %>%
  select(-game_type)

# create dataset of pitches with data, but "null" pitch type
pitches_2020_missing = pitches_2020 %>%
  filter(game_type == "R") %>%
  filter(pitch_type == "null") %>%
  select(-game_type) %>%
  na.omit()

# create dataset of post season pitches
pitches_2020_post = pitches_2020 %>%
  filter(game_type %in% c("F", "D", "L", "W")) %>%
  select(-game_type)

# write data to disk
readr::write_csv(pitches_2020_regular, "data/pitches_2020_regular.csv")
readr::write_csv(pitches_2020_missing, "data/pitches_2020_missing.csv")
readr::write_csv(pitches_2020_post, "data/pitches_2020_post.csv")

################################################################################







