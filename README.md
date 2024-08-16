# gophkeeper

## linting & static checks
revive:

      revive -config revive_config.toml -formatter friendly ./... &> artefacts/linter_reports/revive.out


## grpc generation

      cd internal/common/protobuf
      protoc --go_out=. --go_opt=paths=source_relative \
      --go-grpc_out=. --go-grpc_opt=paths=source_relative \
      contracts.proto


## godoc
start godoc server

      godoc -play -http=:8080 -goroot="/Users/gena/code/yandex/practicum/golang_advanced/gophkeeper"  

after that, visit
- [including 3rd party](http://localhost:8080/pkg/?m=all)
- [local project doc](http://localhost:8080/pkg/github.com/gennadyterekhov/gophkeeper/?m=all)

or download html doc using:

      wget -r -np -N -E -p -k http://localhost:8080/pkg/github.com/gennadyterekhov/gophkeeper
