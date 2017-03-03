
IMAGE_NAME = python-35-centos7-custom

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run

.PHONY: test-onbuild
test-onbuild:
	docker build -t $(IMAGE_NAME)-onbuild-candidate -f Dockerfile.onbuild .
	IMAGE_NAME=$(IMAGE_NAME)-onbuild-candidate test/run-onbuild
