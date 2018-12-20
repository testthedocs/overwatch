# Again use Ubuntu... but this time define a tag!
#namespace=testthedocs
#repo_name=ttd-sphinx
#repo_tag=14.04.1

#layers=$(curl -k https://registry.hub.docker.com/v1/repositories/$namespace/$repo_name/pulls_count)

# Were any layers found?
#if [ "$layers" = "Tag not found" ]; then
#    echo "Ahhhhh!"
#    exit 1
#fi
#echo $layers

#curl -X GET https://hub.docker.com/v2/repositories/testthedocs/ttd-sphinx/ | jq -r '.pull_count'
#curl -X GET https://hub.docker.com/v2/repositories/testthedocs/ttd-sphinx/ | jq -r '.pull_count, .last_updated'
curl -k GET https://hub.docker.com/v2/repositories/testthedocs/ttd-sphinx/ | jq -r '.pull_count, .last_updated'
