VERSION=1.22.2-orus.1
IMAGE=docker.orus.io/cc/portainer

all: dev compile image push

dev:
	yarn install

compile:
	yarn build

image:
	docker build --no-cache -f ./build/linux/Dockerfile -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

# Tested with:
# - go: go1.13.1 linux/amd64
# - yarn: 1.19.0
# - node: v9.10.0

# Bump version
# sed -i 's/1\.22\.2/1.22.2-orus.1/' package.json
# sed -i 's/1\.22\.2/1.22.2-orus.1/' api/swagger_config.json
# sed -i 's/1\.22\.2/1.22.2-orus.1/' api/portainer.go
# sed -i 's/1\.22\.2/1.22.2-orus.1/' api/swagger.yaml
# sed -i 's/1\.22\.2/1.22.2-orus.1/' distribution/portainer.spec
# sed -i 's/1\.22\.2/1.22.2-orus.1/' api/bolt/migrator/migrator.go
