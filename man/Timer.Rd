% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/timer.R
\name{Timer}
\alias{Timer}
\title{R6 Timer Class}
\format{
An \link[R6:R6Class]{R6::R6Class} generator object.
}
\description{
A simple timer as an R6 class.

The timer has four functions: \code{$start()}, \code{$stop()}, \code{$reset()} and \code{$elapsed()}.
The \code{$elapsed()} function returns the elapsed wall clock time (as opposed to CPU time)
as an object of class \code{lubridate::Duration}.
}
\examples{
# instantiate a new timer
timer <- Timer$new()

# no time has elapsed because the timer has not started
timer$elapsed()

# start the timer
timer$start()

# get the time elapsed (as an object of class lubridate::Duration)
# time elapsed is increasing because the timer is still running
timer$elapsed()
timer$elapsed()

# stop the timer
timer$stop()

# time elapsed is now fixed
timer$elapsed()
timer$elapsed()

# because timer is an object of class R6 use the clone() function
# to make a copy
timer2 <- timer$clone()

# reset the timer
timer$reset()
timer$elapsed()

# timer2 is not reset
timer2$elapsed()
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Timer-is_running}{\code{Timer$is_running()}}
\item \href{#method-Timer-elapsed}{\code{Timer$elapsed()}}
\item \href{#method-Timer-reset}{\code{Timer$reset()}}
\item \href{#method-Timer-start}{\code{Timer$start()}}
\item \href{#method-Timer-stop}{\code{Timer$stop()}}
\item \href{#method-Timer-clone}{\code{Timer$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-is_running"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-is_running}{}}}
\subsection{Method \code{is_running()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$is_running()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-elapsed"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-elapsed}{}}}
\subsection{Method \code{elapsed()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$elapsed()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-reset"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-reset}{}}}
\subsection{Method \code{reset()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$reset()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-start"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-start}{}}}
\subsection{Method \code{start()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$start()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-stop"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-stop}{}}}
\subsection{Method \code{stop()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$stop()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Timer-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Timer-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Timer$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
