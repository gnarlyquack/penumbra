.PHONY: compile
compile: | build
	cmake --build build


# Configuring the project will generate the build directory. Since a build type
# hass not been explicitly specified, default to a Debug build.
build:
	$(MAKE) config-debug


.PHONY: config-debug
config-debug:
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug --fresh


.PHONY: config-release
config-release:
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release --fresh


.PHONY: run
run: | build
	cmake --build build --target run_overture


.PHONY: debug
debug: | build
	cmake --build build --target debug_overture


.PHONY: clean
clean:
	rm -rf build
