nprocs := $(shell nproc)

.PHONY: compile
compile: | build
	cmake --build build -j$(nprocs)


# Configuring the project will generate the build directory. We default to a
# Release build to make the process slightly simpler for individuals not
# building with the intention of working on the project.
build:
	$(MAKE) config-release


.PHONY: config-debug
config-debug:
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug --fresh


.PHONY: config-release
config-release:
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release --fresh


.PHONY: run
run: | build
	cmake --build build --target run_overture -j$(nprocs)


.PHONY: debug
debug: | build
	cmake --build build --target debug_overture -j$(nprocs)


.PHONY: clean
clean:
	rm -rf build
