vpath % src

export CFLAGS += -std=c11
export CPPFLAGS += -g -Wall -Wextra
export LDFLAGS =
export LDLIBS =

export objects = $(subst .c,.o,$(notdir $(wildcard src/*.c)))
export project = {{ PROJECT }}
asan_flags = -fsanitize=address

ifdef memcheck
	CPPFLAGS += $(asan_flags)
	LDFLAGS += $(asan_flags)
endif


.PHONY: help
help:  ## Print this message.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.PHONY: build
build: $(project)  ## Build the program.
$(project): $(objects)
$(objects): $(project).h

.PHONY: clean
clean:  ## Clean up build files.
	@find . -name "*.o" -delete
	@find . -name "core" -delete
	@rm -f $(project)
	@make -C test clean &> /dev/null

.PHONY: check
check:  ## Run all unit tests.
	@$(MAKE) --no-print-directory -C test run