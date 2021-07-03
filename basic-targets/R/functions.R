# Define auxiliary functions ---------------------------------------------------
read_data <- function(
    path
) {
    path %>% 
        read_csv()
}

table_metrics <- function(
    data
) {
    data %>%
        summarise(
            Minimum = min(price),
            Mean = mean(price),
            Maximum = max(price),
            `Standard Deviation` = sd(price)
        ) %>%
        pivot_longer(everything(), names_to = "Metric", values_to = "Value") %>%
        gt() %>%
        fmt_number(Value, decimals = 0, pattern = "${x}")
}

plot_relationship <- function(
    data
) {
    data %>%
        ggplot(aes(x = carat, y = price)) +
        geom_point(alpha = 0.1) +
        scale_x_log10() +
        scale_y_log10()
}

fit_model <- function(
    data
) {
    data %>%
        lm(log(price) ~ log(carat), data = .)
}