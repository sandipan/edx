setwd('C:\\courses\\edX\\Current\\AI\\week9')
library(ggplot2)
pdf <- read.csv('state-action-p.csv')
ggplot(pdf,aes(x=as.factor(gamma),y=state,fill=action))+
  geom_tile(width=3, col='black')+
  geom_text(aes(label=action))+
  scale_x_discrete(limits=factor(pdf$gamma))+
  scale_y_discrete(limits=unique(pdf$state))+
  xlab('gamma') + 
  ggtitle('Policy Iteration: Optimal Policy with different gamma values') + 
  theme_minimal()

vdf <- read.csv('state-value-p.csv')
ggplot(vdf,aes(x=as.factor(gamma),y=state,fill=value))+
  geom_tile(width=3, col='black')+
  geom_text(aes(label=value), angle=90)+
  scale_x_discrete(limits=factor(pdf$gamma))+
  scale_y_discrete(limits=unique(pdf$state))+
  #scale_fill_gradientn(colors=terrain.colors(10))+
  scale_fill_gradient(low='red', high='yellow',  trans = "log", space='Lab')+
  xlab('gamma') + 
  ggtitle('Policy Iteration: Optimal Value Vector with different gamma values') + 
  theme_minimal()


ggplot(vdf,aes(x=gamma,y=value,col=state))+
  geom_point() +
  geom_line() + 
  scale_y_log10() #+
  #ylim(c(-10,1000))

pdf <- read.csv('state-action-v.csv')
ggplot(pdf,aes(x=as.factor(gamma),y=state,fill=action))+
  geom_tile(width=3, col='black')+
  geom_text(aes(label=action))+
  scale_x_discrete(limits=factor(pdf$gamma))+
  scale_y_discrete(limits=unique(pdf$state))+
  xlab('gamma') + 
  ggtitle('Value Iteration: Optimal Policy with different gamma values') + 
  theme_minimal()

vdf <- read.csv('state-value-v.csv')
ggplot(vdf,aes(x=as.factor(gamma),y=state,fill=value))+
  geom_tile(width=3, col='black')+
  geom_text(aes(label=value), angle=90)+
  scale_x_discrete(limits=factor(pdf$gamma))+
  scale_y_discrete(limits=unique(pdf$state))+
  #scale_fill_gradientn(colors=terrain.colors(10))+
  scale_fill_gradient(low='red', high='yellow',  trans = "log", space='Lab')+
  xlab('gamma') + 
  ggtitle('Value Iteration: Optimal Value Vector with different gamma values') + 
  theme_minimal()

ndf <- read.csv('iter-norm-v.csv')
ggplot(ndf,aes(x=iter,y=norm_diff,col=as.factor(gamma)))+
  geom_point() +
  geom_line() + 
  xlab('#Iterations (log10 scale)') +
  ylab('Difference in norms in value vectors for successive iterations') +
  scale_x_log10() #+
#ylim(c(-10,1000))
