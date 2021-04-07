docker run -it --name ubuntu-git ubuntu:20.04 /bin/bash

docker build -t gitserver  .

docker run -i -t -p 9001:80 --name gitserver gitserver
docker exec -it gitserver /bin/bash

cd C:\SL\GitExternal
set no_proxy=cl1628
git clone http://cl1628:9009/test.git test

git config --unset http.proxy
git config --unset https.proxy
