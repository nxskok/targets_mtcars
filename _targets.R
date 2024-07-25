library(targets)
library(tarchetypes)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(data_summary) to view the results.

# Define custom functions and other global objects.
# This is where you write source(\"R/functions.R\")
source("functions/functions.R")

# Set target-specific options such as packages:
tar_option_set(packages = c("utils", "dplyr", "ggplot2",
                            "flextable", "skimr")) # nolint

# End this file with a list of target objects.
list(
  tar_target(data, data.frame(x = sample.int(100), y = sample.int(100))),
  tar_target(data_summary, summarize_data(data)), # Call your custom functions.
  tar_target(data_plot, plot_data(data)),
  tar_target(data_saved_plot, save_plot(data_plot), format = "file"),
  tar_target(path_data_mtcars, "mtcars.csv", format = "file"),
  tar_target(data_mtcars, read.csv(path_data_mtcars)),
  tar_target(mtcars_summary, skim(data_mtcars)),
  tar_target(mtcars_clean, clean_mtcars(data_mtcars)),
  tar_target(mtcars_plot, plot_mtcars(mtcars_clean)),
  tar_render(my_doc, "my_doc.qmd")
)
