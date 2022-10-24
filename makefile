
image_name=jupyter/all-spark-notebook

SUBDIRS = $(shell ls -d */ | grep -v 'shared' )

cmd = docker compose

all: build

# % :
# 	for dir in $(SUBDIRS) ; do \
# 	    make -C  $$dir $@ ; \
#     done

up:
	${cmd} up

build:
	${cmd} build

run:
	${cmd} run

stop:
	${cmd} stop

rm:
	${cmd} rm

bash:
	${cmd} exec pyspark bash

clean:
	docker rmi $$(docker images | grep ${image_name} | tr -s ' ' | cut -d ' ' -f 3)

commit:
	git add -u
	git add .
	git commit -am 'make commit'
	git push

