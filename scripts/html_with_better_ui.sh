go test -v -coverpkg=./... -coverprofile=artefacts/coverage/coverage.out -covermode=count ./... > /dev/null
# ignore protobuf generated files
cat artefacts/coverage/coverage.out | grep -v ".pb.go" > artefacts/coverage/coverage.nopb.out
# must have go 1.23 to use
covreport -i artefacts/coverage/coverage.nopb.out -o artefacts/coverage/cover.html -cutlines 70,40
php -S localhost:8080
#http://localhost:8080/artefacts/coverage/cover.html