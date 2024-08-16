
prepare_coverage_profile:
	go test -v -coverpkg=./... -coverprofile=artefacts/coverage/coverage.out -covermode=count ./... > /dev/null
	# ignore protobuf generated files
	cat artefacts/coverage/coverage.out | grep -v ".pb.go" > artefacts/coverage/coverage.nopb.out

coverage_percentage:
	make prepare_coverage_profile
	go tool cover -func artefacts/coverage/coverage.nopb.out

coverage_html_ui:
	make prepare_coverage_profile
	# must have go 1.23 to use
	covreport -i artefacts/coverage/coverage.nopb.out -o artefacts/coverage/cover.html -cutlines 70,40
	php -S localhost:8080
	#http://localhost:8080/artefacts/coverage/cover.html

coverage_html_default:
	make prepare_coverage_profile
	go tool cover -html=artefacts/coverage/coverage.out
