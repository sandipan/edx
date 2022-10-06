library(hash)
library(ggplot2)
library(gridExtra)
setwd('C:/Courses/Edx/Current/AI Harvard/Uncertainty/heredity')

p <- 0.01
mutation_p <- p
jenes <- hash()
jenes[0] <- c(0,0)
jenes[1] <- c(0,1)
jenes[2] <- c(1,1)

png('test.png', width=1200, height=1000)
p1 = list()
i <- 1
for (f in 0:2) {
  for (m in 0:2) {
    df <- NULL
    for (ch in 0:2) {
      data <- c()
      for (iter in 1:100) {
        data <- c(data, mean(replicate(1000, {
          fjs <- jenes[[paste(f)]]
          mjs <- jenes[[paste(m)]]
          fj <- sample(fjs, 1)
          mj <- sample(mjs, 1)
          if (runif(1) <= p) fj <- 1 - fj
          if (runif(1) <= p) mj <- 1 - mj
          fj + mj == ch
        })))
      }
      print(paste(f, m, ch, mean(data)))
      df <- rbind(df, data.frame(prob=data, child=ch))
    }
    df$child <- as.factor(df$child)
    df1 <- as.data.frame(df %>% group_by(child) %>% summarize(prob=mean(prob)))
    df1$y <- c(20, 50, 80)
    p1[[i]] <- ggplot(df, aes(x=prob, fill=child)) + geom_histogram(binwidth=0.005, alpha=.3) + 
      ggtitle(paste0('Prob(child_jenes=0,1,2 | father_jenes=', f, ',mother_jenes=', m, ')')) +
      geom_vline(data=df1, aes(xintercept = prob, color=child)) +
      geom_text(data=df1, aes(x=prob+0.0375, label=paste(prob), color=child, y=y), angle=90) + #, text=element_text(size=11))
      guides(color=FALSE)
    i <- i + 1
  }
}
do.call(grid.arrange, p1)
dev.off()
