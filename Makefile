.PHONY = clean package deploy run

clean:
	@rm -rf build

package: clean
	@docker build --tag the-app --file Dockerfile .
	@echo "Done."

run: package
	@docker run --env REACT_APP_API_URL="http://the-server.com" \
	--env REACT_APP_API_KEY="some key" \
	--env REACT_APP_BUILD_DATE="$(shell date)" \
	--rm --interactive --tty --publish 8080:80 the-app 


