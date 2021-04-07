docker run \
    --env http_proxy="http://10.200.154.25:3128" \
    --env https_proxy="http://10.200.154.25:3128" \
    -p 9001:80 \
    --name gitserver
    -i -t
    gitserver
