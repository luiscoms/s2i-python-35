
IMAGE_NAME = python-35-centos7-custom

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test-all
test-all: test test-onbuild test-oracle test-oracle-onbuild
	echo "Success"

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app

.PHONY: test-onbuild
test-onbuild:
	docker build -t $(IMAGE_NAME)-onbuild-candidate -f Dockerfile.onbuild .
	GIT_SSL_NO_VERIFY=true IMAGE_NAME=$(IMAGE_NAME)-onbuild-candidate test/run-onbuild test-app

.PHONY: test-oracle
test-oracle:
	docker build -t $(IMAGE_NAME)-oracle-candidate -f Dockerfile-oracle .
	IMAGE_NAME=$(IMAGE_NAME)-oracle-candidate test/run test-oracle-app

.PHONY: test-oracle-onbuild
test-oracle-onbuild:
	docker build -t $(IMAGE_NAME)-oracle-onbuild-candidate -f Dockerfile-oracle.onbuild .
	GIT_SSL_NO_VERIFY=true IMAGE_NAME=$(IMAGE_NAME)-oracle-onbuild-candidate test/run-onbuild test-oracle-app
