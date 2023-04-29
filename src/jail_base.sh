#!/bin/bash

api="https://www.jailbase.com/api"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"


function search_arrests() {
	# 1 - source_id: (integer): <source_id - required>
	# 2 - last_name: (string): <last_name>
	# 3 - first_name: (string): <first_name>
	# 4 - booking_date_start: (string): <booking_date_start>
	# 5 - booking_date_end: (string): <booking_date_end>
	# 6 - release_date_start: (string): <release_date_start>
	# 7 - release_date_end: (string): <release_date_end>
	# 8 - page: (integer): <page - default: 1>
	# 9 - page_size: (integer): <page_size - default: 10>
	curl --request GET \
		--url "$api/search/$1?last_name=${2:-}&first_name=${3:-}&booking_date_start=${4:-}&booking_date_end=${5:-}&release_date_start=${6:-}&release_date_end=${7:-}&page=${8:-1}&page_size=${9:-10}" \
		--user-agent "$user_agent" \
		--header "content-type: application-json"
}

function get_sources() {
	curl --request GET \
		--url "$api/sources/" \
		--user-agent "$user_agent" \
		--header "content-type: application-json"
}

function get_recent() {
	# 1 - page_size: (integer): <page_size - default: 10>
	curl --request GET \
		--url "$api/recent?page_size=${1:-10}" \
		--user-agent "$user_agent" \
		--header "content-type: application-json"
}

function get_facilities() {
	curl --request GET \
		--url "$api/facilities/" \
		--user-agent "$user_agent" \
		--header "content-type: application-json"
}
