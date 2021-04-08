docker run -it --name ubuntu-git ubuntu:20.04 /bin/bash

docker build \
    --build-arg DEBIAN_FRONTEND="noninteractive" \
    --build-arg TZ=Europe/Zurich \
    -t gitserver  .

docker run \
    -p 9080:80 \
    --name gitserver \
    -i -t gitserver
    
docker exec -it gitserver /usr/bin/tail -f /var/log/apache2/git.access.log

cd C:\Temp
set no_proxy=myhostname
git clone http://myhostname:9080/git/test.git test

# Add File
# e.g. Program.cs

# Commit & Push
git add -A
git commit -m 'Erstes File'
git push origin
