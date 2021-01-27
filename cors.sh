cat $1 | while read t
do
corsy.py -u $t > cors_$t.txt ;
done;
