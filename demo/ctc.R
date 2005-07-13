cat ("\n\n            C T C  \n             D E M O \n\n")


cat("\n------ Standard clustering with R (not ctc):  -------\n")

data(USArrests)
h = hclust(dist(USArrests))
plot(h)
 
readline("Next")

cat("\n------ Get the ``heatmap'':  -------\n")
heatmap(as.matrix(USArrests))

readline("Next")

cat("\n------ BUILDING HIERARCHICAL CLUSTERING WITH ANOTHER SOFTWARE  -------\n")
cat("\n------ Write data table to Xcluster file format   -------\n")
r2xcluster(USArrests,file='USArrests_xcluster.txt')
readline("Next")

cat("\n------ Write data table to cluster file format   -------\n")
r2cluster(USArrests,file='USArrests_cluster.txt')
readline("Next")

cat("\n------ Hierarchical clustering (need Xcluster tool  by Gavin Sherlock)  -------\ntry:\n\nh.xcl=xcluster(USArrests)\nplot(h.xcl)
") 



readline("Next")



hr = hclust(dist(USArrests))
hc = hclust(dist(t(USArrests)))
cat("\n------  USING OTHER VISUALIZATION SOFTWARES  -------\n")

cat("\n------  Export hclust objects to Newick format files  -------\n")
write(hc2Newick(hr),file='hclust.newick')
readline("Next")

cat("\n------  Export hclust objects to Freeview or Treeview
visualization softwares  -------\n")
r2atr(hc,file="cluster.atr")
r2gtr(hr,file="cluster.gtr")
r2cdt(hr,hc,USArrests ,file="cluster.cdt")
readline("Next")


