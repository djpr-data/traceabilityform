tab_results <- function(...) tabPanel(
  title = 'Results',
  value = 'results',


  h2('Results'),
  div(
    class = "alert alert-light alert-dismissible fade show",
    role="alert",
    tags$strong(tags$em("Please note:")),
    tags$button(
      type = "button",
      class = "btn-close",
      `data-bs-dismiss`="alert",
      `aria-label`="Close",
      style = "color:#000000"
    ),
    tags$ul(
      tags$li(
        "This web tool does not collect and/or store any financial information",
        "a user may enter."
      ),
      tags$li("All information is deleted after the session ends.")
    )
  ),
  div(
    class = "row  py-4",
    div(
      class = "col-md-7",
      uiOutput("results_card") %>%
        tagAppendAttributes(class = "h-100")
    ),
    div(
      class = "col-md-5 h-100",
      div(
        class = "card",
        div(
          class = "card-header",
          tags$b("Download results")
        ),
        div(
          class = "card-body",
          fluidRow(
            column(
              12,
              "Click below to download results as PDF report. You can",
              "optionally add your business name to customise the report.",
              textInput(
                inputId = "bus_name",
                label = NULL,
                placeholder = "Business name (optional)",
                width = "100%"
              ) %>%
                tagAppendAttributes(
                  style = "padding-bottom: 0; margin-bottom: 0; margin-top: 1rem;"
                )
            )
          )
        ),
        div(
          class = "card-footer float-end",
          downloadButton("report", "Download report") %>%
            tagAppendAttributes(
              class = "float-end"
            )
        )
      )
    )
  ),

  # Summary table
  div(
    class = "row",
    div(
      class = "col-md-6",
      div(
        class = "card h-100",
        div(
          class = "card-header",
          tags$b("Expected return on investment by year")
        ),
        div(
          class = "card-body h-100",
          highchartOutput("annual_chart", height = "100%")
        )
      )
    ),
    div(
      class = "col-md-6",
      div(
        class = "card h-100",
        div(
          class = "card-header",
          tags$b("Cost/benefit breakdown")
        ),
        div(
          class = "card-body h-100",
          uiOutput("table_summary")
        )
      )
    )
  ),

  # Uncertainty content
  h3(
    class = "pt-5 pb-2",
    "Probability of positive returns"
    ),
  div(
    class = "row",
    div(
      class = "col-md-8",
      div(
        class = "card h-100",
        div(
          class = "card-header",
          tags$b("Simulated return on investment distribution")
        ),
        div(
          class = "card-body h-100",
          highchartOutput("uncertainty_hist")
        )
      )
    ),
    div(
      class = "col-md-4",
      uiOutput("uncertainty_card") %>%
        tagAppendAttributes(class = "h-100")
    )
  )
)

