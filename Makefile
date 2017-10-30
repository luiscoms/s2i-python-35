
IMAGE_NAME = python-35-centos7-custom

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: clean
clean:
	docker rmi $(IMAGE_NAME)-candidate \
				$(IMAGE_NAME)-onbuild-candidate \
				$(IMAGE_NAME)-oracle-candidate \
				$(IMAGE_NAME)-oracle-onbuild-candidate \
				$(IMAGE_NAME)-alpine-candidate \
				$(IMAGE_NAME)-alpine-onbuild-candidate

.PHONY: test
test: test test-onbuild test-oracle test-oracle-onbuild test-alpine test-alpine-onbuild
	echo "Success"

.PHONY: test-default
test-default:
	docker build -t $(IMAGE_NAME)-candidate .
	UPGRADE_PIP_TO_LATEST=1 \
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app

.PHONY: test-onbuild
test-onbuild:
	docker build -t $(IMAGE_NAME)-onbuild-candidate -f Dockerfile.onbuild .
	UPGRADE_PIP_TO_LATEST=1 \
	IMAGE_NAME=$(IMAGE_NAME)-onbuild-candidate test/run-docker test-app

.PHONY: test-oracle
test-oracle:
	docker build -t $(IMAGE_NAME)-oracle-candidate -f Dockerfile-oracle .
	UPGRADE_PIP_TO_LATEST=1 \
	IMAGE_NAME=$(IMAGE_NAME)-oracle-candidate test/run test-oracle-app

.PHONY: test-oracle-onbuild
test-oracle-onbuild:
	docker build -t $(IMAGE_NAME)-oracle-onbuild-candidate -f Dockerfile-oracle.onbuild .
	UPGRADE_PIP_TO_LATEST=1 \
	IMAGE_NAME=$(IMAGE_NAME)-oracle-onbuild-candidate test/run-docker test-oracle-app

.PHONY: test-alpine
test-alpine:
	docker build -t $(IMAGE_NAME)-alpine-candidate -f Dockerfile-alpine .
	IMAGE_NAME=$(IMAGE_NAME)-alpine-candidate test/run-docker test-alpine-app

.PHONY: test-alpine-onbuild
test-alpine-onbuild:
	docker build -t $(IMAGE_NAME)-alpine-onbuild-candidate -f Dockerfile-alpine.onbuild .
	IMAGE_NAME=$(IMAGE_NAME)-alpine-onbuild-candidate test/run-docker test-alpine-onbuild-app
