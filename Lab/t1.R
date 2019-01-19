kids <- c('Jack', 'Jill')
ages <- c(12, 10)

d <- data.frame(kids, ages, stringsAsFactors = FALSE)
write.table(d, file = 'd1.txt')
write.table(d, file = 'd2.txt', quote = FALSE, row.names = FALSE)

x <- 2:4
cat('abc\n ', x, file = 'd3.txt', sep = '')
cat(x, 'de\n', x, file = 'd4.txt', append = TRUE)

x <- "hello world"
writeClipboard(x)

x <- 3.14
writeClipboard(x)
x <- readClipboard()

prostate.url <-
  'https://web.stanford.edu/~hastie/ElemStatLearn/datasets/prostate.data'
prostate <- read.table(prostate.url, header = TRUE, sep = '\t', row.names = 1)
head(prostate)

package.download('Curl')

library(RCurl)
oct17 <- getURL("https://stat.ethz.ch/pipermail/r-help/2017-October/date.html")
webpage <- strsplit(oct17,"\n")[[1]]
webpage[1:14]


library(XML)
myurl <- getURL('https://en.wikipedia.org/wiki/Comparison_of_statistical_packages')
mytable <- readHTMLTable(myurl)[[2]]
head(mytable)



library(RCurl)
oct17 <- getURL("https://stat.ethz.ch/pipermail/r-help/2017-October/date.html")
webpage <- strsplit(oct17, "\n")[[1]] # download the webpage see slide 21
# get the lines that contains the authors
# [the authors are in italic, so html code starts with "<I>"]:
authorsraw <- grep("<I>", webpage, value = TRUE)
authorsraw
authors <- gsub("<I>", "", authorsraw, fixed = TRUE) # only keep the names
# create a table that contains the number of contributions for each author,
# and sort it in decreasing order:
author_counts <- sort(table(authors), decreasing = TRUE)
author_counts[1:8]

jj<-options(warn = 5) 

print(jj)



z <- paste('Experience', 'is', 'simply', 'the', 'name', 'we', 'give', 'our', 'mistakes', sep = ' ')

z

b <- paste('Experience is simply the','name we give our mistakes')


z <- paste('Experience is simply the name we give our mistakes')


a <- paste('Experience is simply the', 'name we give our mistakes', sep = ' ')

a

grep('^obj', ls())

grep('^obj', list.files())

grep('[obj]', ls())

grep('obj', ls())

a<-'obj'

ls

t<-nchar(paste('the', 'quick', 'brown', 'fox', sep = ','))
t




scan('f123.txt', sep = '\n', what = 'char')

scan('f123.txt', what = '')


scan('f123.txt')


scan('f123.txt', sep = '\n')

cat("The quick brown fox", sep = '')

?options
nchar(paste('the', 'quick', 'brown', 'fox', sep = ','))
