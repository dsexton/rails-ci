.PHONY: latest

latest: onbuild
	docker build -t dsexton/rails-ci:latest --file Dockerfile .

onbuild:
	docker build -t dsexton/rails-ci:onbuild --file onbuild/Dockerfile --pull .
