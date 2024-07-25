summarize_data <- function(d) {
  colMeans(d)
}

plot_data <- function(d) {
  ggplot(d, aes(x = x, y = y)) + geom_point()
}

save_plot <- function(plot) {
  ggsave("saved_plot.png", plot)
}

clean_mtcars <- function(d) {
  d %>% mutate(am = as.character(am))
}

plot_mtcars <- function(d) {
  ggplot(d, aes(x = hp, y = mpg, colour = am)) +
    geom_point() + geom_smooth(method = "lm")
}

