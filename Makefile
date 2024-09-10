.PHONY: all
all:
	make build
	substreams info ./substreams/eos-transactions-v0.3.9.spkg

.PHONY: build
build:
	graph build

.PHONY: deploy
deploy:
	graph build
	graph create --node http://localhost:8020 upland
	graph deploy --node=http://localhost:8020 upland

.PHONY: publish
publish:
	graph build
	graph publish --subgraph-id 68hLjdJHCYMufv8UUN56aEZ4XV4ERgFnAwbLARnNX6wz

.PHONY: gui
gui:
	substreams gui ./substreams/eos-transactions-v0.3.9.spkg -e eos.substreams.pinax.network:443 graph_out -s 390796092 --params "graph_out=(code:playuplandme || code:uplandnftact || code:upxtokenacct) && notif:false"