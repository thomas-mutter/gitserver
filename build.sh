docker build \
    --build-arg http_proxy="http://10.200.154.25:3128" \
    --build-arg https_proxy="http://10.200.154.25:3128" \
    --build-arg DEBIAN_FRONTEND="noninteractive" \
    --build-arg TZ=Europe/Zurich \
    -t gitserver  .
