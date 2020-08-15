MAJOR?=0
MINOR?=1

VERSION=$(MAJOR).$(MINOR)

APP_NAME = "es-test-dataload"

DOCKERFILE = "Dockerfile"
IMAGE_NAME = "${APP_NAME}"

CUR_DIR = ${shell echo "${PWD}"}

#################################
# Docker targets
#################################
.PHONY: clean-image
clean-image: version-check
	@echo "+ $@"
	-@docker rmi -f ${IMAGE_NAME}:latest || true
	-@docker rmi -f ${IMAGE_NAME}:${VERSION} || true

.PHONY: clean-container
clean-container: version-check
	@echo "+ $@"
	-@docker stop cr_es-test-dataload-run-1 || true
	-@docker rm cr_es-test-dataload-run-1 || true

.PHONY: clean 
clean: clean-container clean-image

.PHONY: build 
build: version-check 
	@echo "+ $@"
	@docker build -t ${IMAGE_NAME}:${VERSION} -f ./${DOCKERFILE} .
	@docker tag ${IMAGE_NAME}:${VERSION} ${IMAGE_NAME}:latest
	@echo "Done."
	@docker images --format '{{.Repository}}:{{.Tag}}\t\t Built: {{.CreatedSince}}\t\tSize: {{.Size}}' | grep ${IMAGE_NAME}:${VERSION}


.PHONY: run
run:
	@echo "+ $@"
	@docker-compose up -d

#################################
# Docker targets
#################################
.PHONY: version-check
version-check:
	@echo "+ $@"
	-@if [ -z "${VERSION}" ]; then \
		echo "VERSION not set. Please set MAJOR AND MINOR." ; \
        false ; \
	else \
		echo "VERSION is ${VERSION}" ; \
	fi		

        


