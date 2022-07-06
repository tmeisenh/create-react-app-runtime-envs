## what is this?

This is an example of how to "inject" environment variables into a create-react-app production built static bundle.

I had a need for a CI build pipeline to produce a single docker image that could be promoted from environment to environment (dev, qa, ua, prod, etc) and be configurable for each environment and the required configuration mechanism was environment variables supplied at container runtime.

How does it work?
First, we leverage create-react-app's built in mechanism for `.env` files. The key is in our `.env` file instead of having an actual value for the field we want we have a "well known" placeholder.

Second, we use a script to override the docker container's entrypoint to run a series of `sed` commands which "injects" into the compiled app the appropriate value for the "well known" placeholder. The script also starts nginx.

There might be better ways to do this but this is how I solved it a couple of years ago with the constraints I had.
