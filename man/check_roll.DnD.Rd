% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_roll.R
\name{check_roll.DnD}
\alias{check_roll.DnD}
\title{Check Rolls for Skills}
\usage{
\method{check_roll}{DnD}(which.character, skill, ...)
}
\arguments{
\item{which.character}{The DnD character who is making the skill check}

\item{skill}{What skill is to be checked? Please no quotes.}

\item{...}{Additional arguments to be passed to the roll() function.}
}
\value{
Will return the the skill check including the proficiency bonus and character statistic modifier added properly.
}
\description{
Will allow for a skill check for a DnD character.
}
\note{
There is no way to tell if the dice rolled used adv/dis after the fact so be careful in specifing the parameters.
}
\examples{
Blacksmith_Jamestown <- DnD(Josh, 4)
saving_throw(Blacksmith_Jamestown, str)
}
\seealso{
\code{\link{check_roll.default}}
}
