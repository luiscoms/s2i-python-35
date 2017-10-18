
IMAGE_NAME = python-35-centos7-custom

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test: test test-onbuild test-oracle test-oracle-onbuild test-alpine test-alpine-onbuild
	echo "Success"

.PHONY: test-default
test-default:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app

.PHONY: test-onbuild
test-onbuild:
	docker build -t $(IMAGE_NAME)-onbuild-candidate -f Dockerfile.onbuild .
	GIT_SSL_NO_VERIFY=true IMAGE_NAME=$(IMAGE_NAME)-onbuild-candidate test/run-docker test-app

.PHONY: test-oracle
test-oracle:
	docker build -t $(IMAGE_NAME)-oracle-candidate -f Dockerfile-oracle .
	IMAGE_NAME=$(IMAGE_NAME)-oracle-candidate test/run test-oracle-app

.PHONY: test-oracle-onbuild
test-oracle-onbuild:
	docker build -t $(IMAGE_NAME)-oracle-onbuild-candidate -f Dockerfile-oracle.onbuild .
	GIT_SSL_NO_VERIFY=true IMAGE_NAME=$(IMAGE_NAME)-oracle-onbuild-candidate test/run-docker test-oracle-app

.PHONY: test-alpine
test-alpine:
	docker build -t $(IMAGE_NAME)-alpine-candidate -f Dockerfile-alpine .
	IMAGE_NAME=$(IMAGE_NAME)-alpine-candidate test/run-docker test-alpine-app

.PHONY: test-alpine-onbuild
test-alpine-onbuild:
	docker build -t $(IMAGE_NAME)-alpine-onbuild-candidate -f Dockerfile-alpine.onbuild .
	GIT_SSL_NO_VERIFY=true IMAGE_NAME=$(IMAGE_NAME)-alpine-onbuild-candidate test/run-docker test-alpine-app
