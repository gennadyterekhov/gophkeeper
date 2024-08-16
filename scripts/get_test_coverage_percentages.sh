go test -v -coverpkg=./... -coverprofile=artefacts/coverage/coverage.out -covermode=count ./... > /dev/null
# ignore protobuf generated files
cat artefacts/coverage/coverage.out | grep -v ".pb.go" > artefacts/coverage/coverage.nopb.out
go tool cover -func artefacts/coverage/coverage.nopb.out