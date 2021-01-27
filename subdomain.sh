echo "first argument: list of domains."
pwd

cat $1 | while read p
do
mkdir recon_script;
cd recon_script;
sublist3r -d $p -o sublist3r_$p.txt ; 
subfinder -d $p -all -o subfinder_$p.txt;
amass enum -d $p -o amass_$p.txt ; 
assetfinder $p -subs-only > assetfinder_$p.txt ;
cat sublist3r_$p.txt subfinder_$p.txt amass_$p.txt assetfinder_$p.txt | sort -u > final_$p.txt;

#probing
echo "Starting probing."
probing.sh final_$p.txt ;

# gau
echo "getallurl Starting"
gau.sh final_$p.txt ;
cat gau_* | sort -u > gau_final_$p.txt ;

#cors
echo "Starting cors"
cors.sh probed_$p.txt ; 

#js
mkdir js ;
cat gau_final_* | grep "\.js" | tee js_files.txt
cp js_files.txt ./js/
done
