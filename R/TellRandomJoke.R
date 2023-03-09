#' @title TellRandomJoke
#' @description Tells a random joke
#' @author Gareth Burns
#' @return A character value. A sentence with a joke
#' @seealso \url{https://icanhazdadjoke.com}
#' @import httr
#' @export


TellRandomJoke <- function(...) {
  response <-
    GET(
      "https://icanhazdadjoke.com/",
      accept("application/json"),
      user_agent("https://github.com/GABurns/jokeR")
    )

  if (status_code(response) == 200) {
    content(response)$joke
  } else {
    stop("This is no joke, but there's been an error")
  }
}
