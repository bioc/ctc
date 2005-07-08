<?php

/*
   This program is a sample to use R and ctc as a web application.

   Standard setup: 
   put ctc.php in your public_html directory
   check that webserver user (apache, or www) is able
   to write in public_html (chmod 'a+w' ~/public_html)

   Change global variable R_BIN below

   That's all.

   Example working:
   http://bioinfo.genopole-toulouse.prd.fr/~lucas/ctc.php

 */ 

/*  Some globals variables */


$R_BIN = "R";   // "/usr/bin/R";
$MAX_FILE = 307200;  // 300 Ko
/* End of personalization */
?>


<html>
<header>
<title>Ctc Demo Web application V0-1</title>
</header>
<body>
<center>
<p>
<b>This demo makes hierarchical clustering on your data</b>

<?php 


/* and ID made by TIME + Process_ID  */
$ID = "tmp_".time().getmypid();


/* Print form  */
if ($_POST[page] != "Exec") 
  {

    ?>
    <p>
    Upload your data (text-tabulated file)
    <form 
      action="ctc.php"
      enctype="multipart/form-data"   
      method="POST"
    >
      <INPUT TYPE = hidden  NAME=page value="Exec"></input>
      <INPUT type="file" name="FileData" />
      <p>
      File Description:
      <table><tr>
      <td>A first Column</td><td>
        <SELECT NAME=rownames>
           <OPTION SELECTED  VALUE = "1">with labels
           <OPTION VALUE = "NULL">with data
        </SELECT>
      </td></tr>
      <tr><td>
      A first line</td><td>
        <SELECT NAME=header>
           <OPTION SELECTED  VALUE = TRUE>with columns header
           <OPTION VALUE = FALSE>with data
        </SELECT>
         </td></tr></table>


      <INPUT TYPE=SUBMIT VALUE="Submit" name="GO">
    </form>    
    <?php
  }
else
{


   mkdir($ID,0777);

   $HEADER = $_POST[header];
   $ROWNAMES = $_POST[rownames];


   /* Get upload data */
   if(is_uploaded_file ($_FILES['FileData']['tmp_name'] ))
     {
       move_uploaded_file ($_FILES['FileData']['tmp_name'],$ID."/data.txt");
       $taillefichier = filesize($ID."/data.txt");
       if($taillefichier>$MAX_FILE)
	 exit("File size: $taillefichier; max allowed: $MAX_FILE");
     }



   /* ================================== */
   /* We write R code in file $ID/prog.R */
   /* ================================== */

   $fp=fopen("$ID/prog.R",'w');

   fwrite($fp,"library(ctc)\n");


   /* Read Data */
   fwrite($fp,"data <- read.delim('$ID/data.txt',header=$HEADER,row.names=$ROWNAMES) \n" );


   fwrite($fp,"data                                        \n"); 


   /* Hierarchical clustering */
   fwrite($fp,"hr <- hclust(dist(data))                     \n");
   fwrite($fp,"hc <- hclust(dist(t(data)))                  \n");
   fwrite($fp,"dr <- as.dendrogram(hr)                      \n");
   fwrite($fp,"dc <- as.dendrogram(hc)                      \n");

   /* A pdf file */
   fwrite($fp,"pdf(file='$ID/Rplots.pdf')                        \n");
   fwrite($fp,"heatmap(as.matrix(data),Colv=dc,Rowv=dr)          \n"); 
   fwrite($fp,"dev.off()                                         \n");

   /* Some png images */
   fwrite($fp,"bitmap(file='$ID/heatmap.png')                    \n");
   fwrite($fp,"heatmap(as.matrix(data),Colv=dc,Rowv=dr)          \n");
   fwrite($fp,"dev.off()                                         \n");


   fwrite($fp,"r2atr(hc,file='$ID/cluster.atr')                  \n");
   fwrite($fp,"r2gtr(hr,file='$ID/cluster.gtr')                  \n");
   fwrite($fp,"r2cdt(hr,hc,data ,file='$ID/cluster.cdt')         \n");


   fclose($fp);


   /* ===================== */
   /* Send command (R batch)*/
   /* ===================== */
   system("$R_BIN --no-save < $ID/prog.R > $ID/prog.R.out  2> $ID/prog.R.warnings");
 

   /* ===================================== */
   /* We create html page including results */
   /* ===================================== */


   echo "<h3>Ctc Demo results </h3>";
   echo "<a href=$ID/Rplots.pdf>A pdf file</a><p>";
   echo "3 files for <a href=http://magix.fri.uni-lj.si/freeview/>Freeview</a>";
   echo " or <a href=http://rana.lbl.gov/>Treeview</a>: ";
   echo "<a href=$ID/cluster.cdt>cdt</a> ";
   echo "<a href=$ID/cluster.atr>atr</a> ";
   echo "<a href=$ID/cluster.gtr>gtr</a> ";
   echo "<p>";
   echo "<img src=$ID/heatmap.png></img><p>";
   /* Signature  */

   echo "<p>This results made by <a
href='http://www.bioconductor.org/'>ctc
package</a>. Code use: <a href='$ID/prog.R'>prog.R</a>, 
Out: <a href='$ID/prog.R.out'>prog.R.out</a>,
Warnings: <a href='$ID/prog.R.warnings'>prog.R.warnings</a>.";

}
?>



</center>
</body>
</html>