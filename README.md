# docker-multi-stage-build

### Build
```sh
docker build . -t my-api:1.0
```

### Run
```sh
docker run --name my-api -p 5000:5000 my-api:1.0
```