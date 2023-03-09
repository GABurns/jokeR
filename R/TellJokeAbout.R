#' @title TellJokeAbout
#' @author Gareth Burns
#' @description Tells a joke about a Eoghan.
#' @param topic A character value. Topic which the joke is a about
#' @return A character value. A sentence with a joke
#' @seealso \url{https://icanhazdadjoke.com}
#' @import httr
#' @export

TellJokeAbout <- function(topic) {
  stopifnot(is.character(topic), length(topic) == 1L)

  response <-
    GET(
      "https://icanhazdadjoke.com/search",
      accept("application/json"),
      user_agent("https://github.com/GABurns/jokeR"),
      query = list(term = topic)
    )

  if (status_code(response) == 200) {
    if (content(response)$total_jokes == 0) {
      warning(sprintf("%1$s is no laughing matter. There's no jokes about it",
                      topic))
    } else {
      # Randomly take a joke from the list
      jokeNumber <- sample(seq(length(content(response)$results)), 1L)
      return(content(response)$results[[jokeNumber]][["joke"]])
    }
  } else {
    stop("This is no joke, but there's been an error")
  }
}
