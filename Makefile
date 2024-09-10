.PHONY: all
all:
	make build
	make create
	make deploy

.PHONY: build
build:
	graph build

.PHONY: deploy
deploy:
	graph deploy --node=http://localhost:8020 tokens

.PHONY: create
create:
	graph create --node http://localhost:8020 tokens

.PHONY: publish
publish:
	graph build
	graph publish --subgraph-id "<SUBGRAPH ID>"

.PHONY: gui
gui:
	substreams gui ./substreams/wax-transactions-v0.3.8.spkg -e wax.substreams.pinax.network:443 graph_out -s 326292294 --params "graph_out=code:eosio.token && notif:false"