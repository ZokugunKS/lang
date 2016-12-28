test:
ifeq ($(g),)
	node_modules/.bin/mocha --colors --compilers ks:kaoscript/register --reporter spec
else
	node_modules/.bin/mocha --colors --compilers ks:kaoscript/register --reporter spec -g "$(g)"
endif

clean:
	find . -type f \( -name "*.ksb" -o -name "*.ksh" -o -name "*.ksm" \) -delete

.PHONY: test