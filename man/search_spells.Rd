% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_function_indevelopment.R
\name{search_spells}
\alias{search_spells}
\title{Search Spells for a given pattern}
\usage{
search_spells(pattern, names.only = T, quick.return = T)
}
\arguments{
\item{pattern}{The character string to search for in both names and and body of the paragraphs. No quotations and no spaces please.}

\item{names.only}{This will return only the names and of the spells where the matches exist. If false, then all the information of the spell is presented.}

\item{quick.return}{If the match fits only one spell then the entire info of the spell is returned. This is regardless of the names.only parameter.}
}
\value{
Will return a list. The first element is the matching names of spells. If the match is perfect with one name it will return a list of lists for all spell info presented. The second item is the list of names of spells where the match is in the body of the test.
}
\description{
This will search the spell list for both names of the spells proper and the body of the spell text.
}
