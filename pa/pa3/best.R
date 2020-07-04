## This function takes 2 arguments (2-character abbreviated name of a state 
## and an outcome name) and returns a character vector with the name of the 
## hospital that has the best (i.e. lowest) 30-day mortality for the 
## specified outcome in that state.
## 
## If there is a tie for the best hospital for a given outcome, then the 
## hospital names will be sorted in alphabetical order and the first hospital 
## in that set will be chosen.
best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    fd   <- as.data.frame(cbind(data[, 2],   # hospital
                                data[, 7],   # state
                                data[, 11],  # heart attack
                                data[, 17],  # heart failure
                                data[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
    colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    ## Check that state and outcome are valid
    if(!state %in% fd[, "state"]){
        stop('invalid state')
    } else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else {
    
    ## Return hospital name in that state with lowest 30-day death rate
        state_index <- which(fd[, "state"] == state)
        state_data <- fd[state_index, ]    # extracting data for the called state
        outcome_index <- as.numeric(state_data[, eval(outcome)])
        min_val <- min(outcome_index, na.rm = TRUE)
        result  <- state_data[, "hospital"][which(outcome_index == min_val)]
        output  <- result[order(result)]
    }
    return(output)
}