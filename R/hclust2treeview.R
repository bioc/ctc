hclust2treeview <- function(x,file="cluster.cdt",method = "euclidean",
                              link = "complete",keep.hclust=FALSE)
  {
    if("amap" %in% .packages(all=TRUE))
      {
        hr <- hcluster (x,method =method, link=link)
        hc <- hcluster (t(x),method =method, link=link)
      }
    else
      {
        hr <- hclust(dist(x,method =method), method=link)
        hc <- hclust(dist(t(x),method =method), method=link)
      }
    basefile = strsplit(file,"\\.")[[1]]
    if(length(basefile>1))  
      basefile = paste(basefile[-length(basefile)],collapse=".")

    
    
    r2atr(hc,file=paste(basefile,".atr",sep=""))
    r2gtr(hr,file=paste(basefile,".gtr",sep=""))
    r2cdt(hr,hc,x ,file=paste(basefile,".cdt",sep=""))

    if(keep.hclust)
      return(list(hr,hc))
    else
      return(1)
  }
