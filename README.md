# opzapp

# build in docker 

require to let it has tag in format v0.0.0

`
git tag -l
git checkout v2.2.0
`
then build it to local image
`
docker buildx build -t terrarebirth/opzd:$(git describe --tags --abbrev=0) . 

`
then push to hub
`
docker push terrarebirth/opzd:$(git describe --tags --abbrev=0)
`
# push to docker hub as opzd-env

