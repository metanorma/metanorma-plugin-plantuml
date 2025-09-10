.PHONY: all 7zso clean

all: 7zso

7zso:
	mkdir -p bin
	$(MAKE) -C CPP/7zip/Bundles/Format7zFree all

clean:
	$(MAKE) -C CPP/7zip/Bundles/Format7zFree clean
	rm -fr bin

install:
	cp bin/7z.so /home/runner/work/metanorma-plugin-plantuml/metanorma-plugin-plantuml/vendor/bundle/ruby/3.1.0/gems/seven-zip-1.4.2/lib/seven_zip_ruby
