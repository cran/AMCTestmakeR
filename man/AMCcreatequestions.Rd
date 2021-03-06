% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AMCcreatequestions.R
\name{AMCcreatequestions}
\alias{AMCcreatequestions}
\title{Generate AMC LaTeX question codes in the console, in a LaTeX file, or as a vector.}
\usage{
AMCcreatequestions(question, correctanswers, incorrectanswers,
  element = "general", code = paste(codeprefix, c(1:length(question)),
  sep = ""), codeprefix = "Q", output = "message",
  filepath = "questions.tex", questiontype = "single", append = F,
  multicols = 2, messages = T, listelements = T,
  scoringcorrect = 1, scoringincorrect = 0, scoringnoresponse = 0,
  scoringincoherent = scoringincorrect,
  scoringbottom = scoringincorrect, shuffleanswersonce = T)
}
\arguments{
\item{question}{A character value or vector containing the questions.}

\item{correctanswers}{A character (value, vector) containing the correct answer. A vector (or list) of character vectors can be passed, in the case of multiple correct answers.}

\item{incorrectanswers}{A character (value, vector) containing the wrong answer. A vector (or list) of character vectors can be passed, in the case of multiple wrong answers.}

\item{element}{A character value or vector to define the category of the entire set of questions (character value) or of each question (character vector). Defaults to "general.}

\item{code}{A character value or vector to identify each question (note that AMC requires each code to be unique in a questionnaire). Defaults to "Q1", "Q2", "Q3", etc. (the prefix "Q" can be changed with the "codeprefix" argument).}

\item{codeprefix}{A character value to be used to generate automatically question codes, when not provided with the "code" argument.}

\item{output}{A character value to indicate what type of output is desired. "message" (default) outputs the questions as a message (suitable for direct copy-and-paste from console into LaTeX file). "file" outputs a questions .tex file (which can then be pointed to in the main LaTeX document). "list" and "vector" output a character vector of questions (suitable for further manipulation in R).}

\item{filepath}{A character value with the file path for the .tex file to be created (defaults to "questions.tex").}

\item{questiontype}{A character value or vector to indicate the type of all questions (character value) or of each (character vector) question. Use "single" for single-choice, and "multiple" for multiple-answer. So far open questions are not supported.}

\item{append}{A logical value indicating if the code should be appended (append=TRUE) to an existing .tex file. Defaults to FALSE, thus overwriting the file.}

\item{multicols}{A numeric (or numeric vector) indicating the desired number of columns for the presentation of the correct and incorrect answers (note that the LaTeX environment multicols must be called in the main ".tex" document for more than 1 columns). Defaults to 1, which does not require the LaTeX multicols environnment.}

\item{messages}{A logical to indicate whether instructions should be output (defaults to TRUE).}

\item{listelements}{A logical to indicate whether instructions should be output (use the AMCcreateelements() function for more options).}

\item{scoringcorrect}{A numeric value or vector to indicate the scoring for the correct answer(s). Defaults to 1.}

\item{scoringincorrect}{A numeric value or vector to indicate the scoring for an incorrect answer(s). Defaults to 0.}

\item{scoringnoresponse}{A numeric value or vector to indicate the scoring for non-responding. Defaults to 0.}

\item{scoringincoherent}{A numeric value or vector to indicate the scoring for incoherent answer(s) (e.g. two boxes checked for a single-answer questionnaire). Defaults to 0.}

\item{scoringbottom}{A numeric value or vector to indicate the minimum score for the question(s). Especially useful when attributing negative points to incorrect answers in a multiple-answer questionnaire, to ensure students do not lose too many points on one question. Defaults to 0.}

\item{shuffleanswersonce}{A logical value to indicate whether to shuffle answers for each question directly in the LaTeX code (useful if the answers are not randomized by examinee by AMC). Defaults to TRUE.}
}
\value{
A character value or vector (output = "list" or "vector"), a copy-and-pastable message (output = "message") or a LaTeX .tex file (output = "file") containing AMC LaTeX code for questions and answers.
}
\description{
Generate AMC LaTeX question codes in the console, in a LaTeX file, or as a vector.
}
\examples{
#Creating a single question

AMCcreatequestions("How much is $1+1$?",2,list("3", "11"))

#Presenting answers in multiple columns (LaTeX environment 'multicols' is used)

AMCcreatequestions("How much is $1+1$?",2,list("3","11"),multicols = 2)

#Creating an entire questionnaire from a dataset of questions
## Defining the questions (don't forget to escape R special characters)
question <- c("How much is $1+1$ ?", "How much is $1 \\\\times 1$ ?",
  "How much is $\\\\frac{1}{2}$ ?")
  correct <- c(2,1,0.5)
  incorrect1 <- c(3,4,10)
  incorrect2 <- c(1,3,100)
  incorrect3 <- c(4,8,NA) #Empty values (NA and "") are skipped

## Generating the AMC LaTeX code
AMCcreatequestions(
  question = question,
  correctanswers = correct,
  incorrectanswers = list(incorrect1,incorrect2,incorrect3))

#Changing the code prefix from "Q" to "MATH"

AMCcreatequestions(
  question = question,
  correctanswers = correct,
  incorrectanswers = list(incorrect1,incorrect2,incorrect3),
  codeprefix = "MATH")

}
