build: node_modules
	npx quartz build

node_modules: package-lock.json
	npm install

run: node_modules
	npx quartz build --serve

