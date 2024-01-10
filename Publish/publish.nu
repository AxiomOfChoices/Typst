use std log


mkdir tmp
cd tmp

git init

do { git remote add origin https://github.com/AxiomOfChoices/Typst.git } | complete
git remote set-head origin publish
git pull origin

ls | where type == file and name =~ ".*\\.pdf" | each { rm $in.name } | null
rm -f index.html

cd ..

log info ($env.PWD)
./publish.exe
cd tmp
git add -A
do {
    let current_date_time = date now | format date "%Y-%m-%d %H:%M:%S"
    git commit -m $"Updated online notes, ($current_date_time)"
}
git push origin





