require(tidyverse);

args = data_frame(prefixAndValue = commandArgs(TRUE)) %>% separate(prefixAndValue, into = c("prefix", "value"), "=")

json = stream_in(file(filter(args, prefix == "--json")$value), pagesize = 1000)

