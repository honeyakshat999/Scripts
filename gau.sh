cat $1  | while  read  r 
do  
gau $r >> gau_test.txt ;
sort -u gau_test.txt > gau_final.txt ; 
done ;
mkdir gau;
cp gau_final.txt ./gau/ ;
