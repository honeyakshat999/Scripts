mkdir probing;
cat $1 | httpx -follow-redirects -status-code -vhost -threads 100 | sort -u | grep "200" | cut -d [ -f1 | tee probed_$p.txt;
cp probed_$p.txt ./probing/ ;
