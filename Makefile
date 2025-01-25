.PHONY: compile
compile: | build
	cmake --build build


# configuring the project will generate the build directory
build:
	$(MAKE) configure


.PHONY: configure
configure:
	cmake -B build -S .


.PHONY: clean
clean:
	rm -rf build
