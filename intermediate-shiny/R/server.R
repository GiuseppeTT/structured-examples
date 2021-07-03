# Define server function -------------------------------------------------------
server <- function(
    input,
    output
) {
    prediction <- reactive({
        model %>%
            augment(newdata = tibble(carat = input$carat), interval = "prediction") %>%
            mutate(across(!carat, exp)) %>% 
            rename(estimate = .fitted, `lower CI` = .lower, `upper CI` = .upper)
    })
    
    output$prediction_plot <- renderPlot({
        base_plot +
            geom_pointrange(
                aes(y = estimate, ymin = `lower CI`, ymax = `upper CI`),
                data = prediction(),
                color = "red",
                size = 4,
                fatten = 2
            )
    })
    
    output$prediction_table <- render_gt({
        prediction() %>%
            gt() %>%
            fmt_number(-carat, decimals = 0, pattern = "${x}") %>%
            tab_options(table.width = "100%")
    })
}
