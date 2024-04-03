process_csv_directory <- function(directory_path) {
  csv_files <- list.files(directory_path, pattern = "\\.csv$", full.names = TRUE)
  curve_list <- list()
  
  for (i in seq_along(csv_files)) {
    df <- read.csv2(csv_files[i])
    
    approach_df <- df[df$segment == "Approach", ]
    retract_df <- df[df$segment == "Retract", ]
    
    listy <- list(A = approach_df, R = retract_df)
    curve_list[[paste0("file_", i)]] <- listy
  }
  
  return(curve_list)
}
