read.eisen <- function(file,sep="\t",dec=".",format.check=TRUE) {

        f<-read.table(file=file,header=TRUE,sep=sep,dec=dec)

        rownames(f)<-f[,1]
        if (format.check & colnames(f)[1] %in% c("UNIQID","YORF","MCLID","CLID","ACC")) {
          stop(paste("This is not a proper Eisen-formatted file
('",file,"').",sep=""))
        }

        if ("NAME"==colnames(f)[2]) {
                colstart<-3
        } else {
                colstart<-2
        }

        if (""==rownames(f)[1]) {
                rowstart<-2
        } else {
                rowstart<-1
        }

        r<-f[rowstart:nrow(f),colstart:ncol(f)]

        if (2==rowstart) {
                attr(r,"second.row")<-f[1,colstart:ncol(f)]
        } else {
                attr(r,"second.row")<-NULL
        }

        if (3==colstart) {
                attr(r,"NAME")<-f[rowstart:nrow(f),2]
        } else {
                attr(r,"NAME")<-NULL
        }

        return(r)
}
