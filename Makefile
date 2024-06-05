build: node_modules
	npx quartz build

node_modules: package-lock.json
	npm install

run dev: node_modules
	npx quartz build --serve

