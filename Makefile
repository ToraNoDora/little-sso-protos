PROTO_DIR := ./proto
PROTO_PATH := ${PROTO_DIR}/sso/*.proto
GEN_PATH := ./gen/go


.PHONY: init
init:
	mkdir -p ${GEN_PATH}

tidy:
	go fmt ./... && \
	go mod tidy -v

.PHONY: gen.proto
gen.proto:
	protoc -I ${PROTO_DIR} ${PROTO_PATH} \
		--go_out=${GEN_PATH} \
		--go_opt=paths=source_relative \
		--go-grpc_out=${GEN_PATH} \
		--go-grpc_opt=paths=source_relative
