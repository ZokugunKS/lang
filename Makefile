test:
ifeq ($(g),)
	node_modules/.bin/mocha --colors --check-leaks --compilers ks:kaoscript/register --reporter spec
else
	node_modules/.bin/mocha --colors --check-leaks --compilers ks:kaoscript/register --reporter spec -g "$(g)"
endif

btest:
	./node_modules/.bin/webpack -c test/array.ks test/_test.js

clean:
	find . -type f \( -name "*.ksb" -o -name "*.ksh" -o -name "*.ksm" \) -delete

.PHONY: test