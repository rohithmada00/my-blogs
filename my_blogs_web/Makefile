# Makefile for deploying the Flutter web projects to GitHub
OUTPUT = rohithmada00.github.io
BASE_HREF = /$(OUTPUT)/
GITHUB_USER = rohithmada00
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(OUTPUT).git
BUILD_VERSION := $(shell powershell -Command "(Get-Content pubspec.yaml | Select-String 'version:').Line.Split(' ')[1]")

# Deploy the Flutter web project to GitHub
deploy:
ifndef OUTPUT
	$(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif

	@echo "Cleaning existing build..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --release

	@echo "Deploying to git repository..."
	cd build/web && \
	git init && \
	git config user.name "$(GITHUB_USER)" && \
	git config user.email "$(GITHUB_USER)@gmail.com" && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin main

	@echo "✅ Finished deploy: $(GITHUB_REPO)"
	@echo "🚀 Flutter web URL: https://$(GITHUB_USER).github.io/$(OUTPUT)/"

.PHONY: deploy
