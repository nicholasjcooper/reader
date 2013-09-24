\name{reader-package}
\alias{reader-package}
\alias{reader-package}
\docType{package}
\title{
Functions to simplify reading from common file types
}
\description{
A set of functions to simplify reading data from files. The main function, reader(), should read most common R datafile types without needing any parameters except the filename. Other functions provide simple ways of handling file paths and extensions, and automatically detecting file format and structure.
}
\details{
\tabular{ll}{
Package: \tab reader\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-07-25\cr
License: \tab GPL (>= 2)\cr
}
 The reader() function, for which the package is named,
 should be able to read most of the common types of datafiles used by R
 users, without needing any arguments other than the filename. 
 The structure, header, file-format and delimiter are determined automatically. 
 Usually no extra parameters are needed. Other functions provide similarly flexibility
 to run contigent on data type and file format, or can look for an input file in
 multiple directory locations. The function cat.path() provides a simple interface to
 construct file paths using directories, suffixes, prefixes and file extension.
 Functions in this package can be nested inside new functions, providing flexible parameter format,
 without having to use multiple if-statements to cope with contigencies. 
 Supported types included delimited text files, R binary files,
 big.matrix files, text list files, and unstructured text. Note that the file type
 that will be attempted to read in is initially determine by the file extension,
 using the function: 'classify.ext()'.

List of key functions:
\itemize{
 \item{\emph{cat.path}}{  Simple and foolproof way to create full-path file names.}
 \item{\emph{classify.ext}}{  Classify file types readable by standard R I/O functions.}
 \item{\emph{column.salvage}}{  Change column name in different form to desired form.}
 \item{\emph{file.ncol}}{  Find the number of columns (lines) in a file.}
 \item{\emph{file.nrow}}{  Find the number of rows (lines) in a file.}
 \item{\emph{find.id.col}}{  Find which column in a dataframe contains a specified set of values.}
 \item{\emph{shift.rownames}}{  Shift the first column of a dataframe to rownames()}
 \item{\emph{force.frame}}{  returns a dataframe if 'unknown.data' can in anyway relate to such}
 \item{\emph{force.vec}}{  returns a vector if 'unknown.data' can in anyway relate to such}
 \item{\emph{get.delim}}{  Determine the delimiter for a text data file.}
 \item{\emph{get.ext}}{  Get the file extension from a file-name.}
 \item{\emph{is.file}}{  Test whether a file exists in a target directory.}
 \item{\emph{make.fixed.width}}{  Convert a matrix or dataframe to fixed-width.}
 \item{\emph{n.readLines}}{  Read 'n' lines (ignoring comments and header) from a file.}
 \item{\emph{parse.args}}{  Function to collect arguments when running R from the command line.}
 \item{\emph{reader}}{  Flexibly load from a text or binary file, accepts multiple file formats.}
 \item{\emph{rmv.ext}}{  Remove the file extension from a file-name.}
 \item{\emph{find.file}}{  Construct a path to a file, where multiple directories can be searched to find an existing file.}
}
}
\author{
Nicholas Cooper

Maintainer: 
Nicholas Cooper <nick.cooper@cimr.cam.ac.uk>
}
\keyword{ IO }
\keyword{ manip }
\keyword{ package }
\seealso{
\code{\link[NCmisc:NCmisc-package]{NCmisc}} ~~

}
\examples{
mydir <- "/Documents"
cat.path(mydir,"temp.doc","NEW",suf=5)
## example for the reader() function ##
df <- data.frame(ID=paste("ID",101:110,sep=""),
                 scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
test.files <- c("temp.txt","temp2.csv","temp3.rda")
write.table(df,file=test.files[1],col.names=TRUE,row.names=TRUE,sep="\t",quote=FALSE)
# file.nrow and file.ncol examples
file.nrow(test.files[1])
file.ncol(test.files[1])
write.csv(df,file=test.files[2])
save(df,file=test.files[3])
# use the same simple reader() function call to read in each file type
for(cc in 1:length(test.files)) {
    cat(test.files[cc],"\n")
    myobj <- reader(test.files[cc])  # add 'quiet=F' to see some working
    print(myobj); cat("\n\n")
}
# inspect files before deleting if desired:
#  unlink(test.files)
#
# find id column in data frame
new.frame <- data.frame(day=c("M","T","W"),time=c(9,12,3),staff=c("Mary","Jane","John"))
staff.ids <- c("Mark","Jane","John","Andrew","Sally","Mary")
new.frame; find.id.col(new.frame,staff.ids)
}
