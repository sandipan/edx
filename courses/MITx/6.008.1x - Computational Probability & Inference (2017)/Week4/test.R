mean(replicate(100000,{n <- 2 
                last <- sample(1:6, 1)
                while (TRUE) {
                  cur <- sample(1:6, 1)
                  if (last == 6 & cur == 6) {
                    return(n)
                  }
                  last <- cur
                  n <- n + 1
                }
               }))
