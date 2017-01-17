test:
ifeq ($(g),)
	./node_modules/.bin/mocha --colors --check-leaks --compilers ks:kaoscript/register --reporter spec
else
	./node_modules/.bin/mocha --colors --check-leaks --compilers ks:kaoscript/register --reporter spec -g "$(g)"
endif

coverage:
ifeq ($(g),)
	./node_modules/@zokugun/istanbul.cover/src/cli.js
else
	./node_modules/@zokugun/istanbul.cover/src/cli.js "$(g)"
endif

btest:
	./node_modules/.bin/webpack -c test/string.ks test/_test.js

clean:
	find . -type f \( -name "*.ksb" -o -name "*.ksh" -o -name "*.ksm" \) -delete

.PHONY: test coverage