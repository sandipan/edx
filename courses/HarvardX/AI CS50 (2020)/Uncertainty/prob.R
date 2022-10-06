deck <- c(paste0('C', 1:13),paste0('D', 1:13),paste0('H', 1:13),paste0('S', 1:13))
mean(replicate(100000, {
  card <- sample(deck, 1)
  (substring(card,1,1) == 'S') | (substring(card,2,2)==2)
}))