docker build \
    --build-arg DEBIAN_FRONTEND="noninteractive" \
    --build-arg TZ=Europe/Zurich \
    -t gitserver  .
