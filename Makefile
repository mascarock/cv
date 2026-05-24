.PHONY: build clean open

build:
	@./scripts/build.sh

clean:
	rm -f dist/cv.pdf dist/cover-letters/*.pdf

open: build
	open dist/cv.pdf
