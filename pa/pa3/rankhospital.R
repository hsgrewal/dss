## This function takes three arguments (2-character abbreviated name of a 
## state, an outcome, and the ranking of a hospital in that state for that 
## outcome) and returns a character vector with the name of the hospital that 
## has the ranking specified by the num argument.
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],  # hospital
                                data[, 7],  # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if (!state %in% fd[, "state"]) {
        stop('invalid state')
    } else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    
    ## Return hospital name in that state with the given rank 30-day death rate
    } else if (is.numeric(num)) {
        state_index <- which(fd[, "state"] == state)
        state_data <- fd[state_index, ]  # extracting dataframe for the called state
        state_data[, eval(outcome)] <- as.numeric(state_data[, eval(outcome)])
        state_data <- state_data[order(state_data[, eval(outcome)], 
                                       state_data[, "hospital"]), ]
        output <- state_data[, "hospital"][num]
    } else if (!is.numeric(num)){
        if (num == "best") {
            output <- best(state, outcome)
        } else if (num == "worst") {
            state_index <- which(fd[, "state"] == state)
            state_data <- fd[state_index, ]
            state_data[, eval(outcome)] <- as.numeric(state_data[, eval(outcome)])
            state_data <- state_data[order(state_data[, eval(outcome)], 
                                           state_data[, "hospital"], 
                                           decreasing = TRUE), ]
            output <- state_data[, "hospital"][1]
        } else {
            stop('invalid num')
        }
    }
    return(output)
}