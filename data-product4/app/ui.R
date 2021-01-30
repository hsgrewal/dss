library(shiny)

shinyUI(
    navbarPage("Cars App",
        tabPanel("Analysis",
            fluidPage(
                titlePanel("Relationship between variables and MPG"),
                sidebarLayout(
                    sidebarPanel(
                        selectInput("variable", "Select variable:",
                            c("Cylinders" = "cyl",
                              "Displacement" = "disp",
                              "Horsepower" = "hp",
                              "Rear axle ratio" = "drat",
                              "Weight" = "wt",
                              "1/4 mile time" = "qsec",
                              "V/S" = "vs",
                              "Transmission" = "am",
                              "Forward Gears" = "gear",
                              "Carburetors" = "carb"
                              )
                        )
                    ),
                    mainPanel(
                        h3("Regression model",
                           textOutput("caption"),
                           plotOutput("mpgPlot"),
                           verbatimTextOutput("fit")
                        )
                    )
                )
            )
        ),
        tabPanel("About",
            h3("Regression Model on MPG"),
            p("This shiny app creates Regression Models exploring the relationship between mpg and various variables. A regression line is shown on the plot depicting how each variable affects mpg.")
        ),
        tabPanel("Data",
            h2("Motor Trend Car Road Tests"),
            h3("Description"),
            p("The data was extracted from the 1974 Motor Trend US magazine and compares fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
            h3("Format"),
            p("mtcars data set is a data frame with 32 observations on 11 variables."),
            p("[, 1] - mpg - Miles per gallon"),
            p("[, 2] - cyl - Number of cylinders"),
            p("[, 3] - disp - Displacement (cu.in.)"),
            p("[, 4] - hp - Gross horsepower"),
            p("[, 5] - drat - Rear axle ratio"),
            p("[, 6] - wt - Weight (lb/1000)"),
            p("[, 7] - qsec - 1/4 mile time"),
            p("[, 8] - vs - V/S"),
            p("[, 9] - am - Transmission (0 - automatic, 1 - manual)"),
            p("[,10] - gear - Number of forward gears"),
            p("[,11] - carb - Number of carburetors")
        ),
        tabPanel("GitHub",
            h4("Link back to GitHub Repo containing Source Code"),
            a("https://github.com/hsgrewal/dss/tree/master/data-product4")
        )
    )
)
