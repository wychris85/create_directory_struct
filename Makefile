SHELL:=/bin/bash

all: dowork

dowork:
	@echo "executing..." \

clean:

delete:
	@for f in *; do \
            	if [[ "$$f" != "Makefile" && "$$f" != "create_new_ip.sh" ]] ; then \
			rm -rf "$$f" ; \
		fi \
        done \
