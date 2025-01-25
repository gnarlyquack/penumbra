.PHONY: compile
compile: | build
	cmake --build build


# configuring the project will generate the build directory
build:
	$(MAKE) configure


.PHONY: configure
configure:
	cmake -B build -S .


.PHONY: run
run: | build
	cmake --build build --target run_overture


.PHONY: debug
debug: | build
	cmake --build build --target debug_overture


.PHONY: clean
clean:
	rm -rf build
