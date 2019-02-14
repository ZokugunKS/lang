test:
ifeq ($(g),)
	./node_modules/.bin/mocha --exit --colors --check-leaks --require kaoscript/register --reporter spec "test/*.ks"
else
	./node_modules/.bin/mocha --exit --colors --check-leaks --require kaoscript/register --reporter spec -g "$(g)" "test/*.ks"
endif

coverage:
ifeq ($(g),)
	./node_modules/@zokugun/istanbul.cover/src/cli.js
else
	./node_modules/@zokugun/istanbul.cover/src/cli.js "$(g)"
endif

btest:
	./node_modules/.bin/webpack test/string.ks --o test/_test.js

ktest:
	npx karma start karma.conf-debug.js

clean:
	find -L . -type f \( -name "*.ksb" -o -name "*.ksh" -o -name "*.ksm" \) -exec rm {} \;

.PHONY: test coverage