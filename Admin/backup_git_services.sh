#!/usr/bin/sh

process_service() {
    # $1 - service, $2 - repos
    local service_name=$1
    mkdir -p "${service_name}"
    cd "${service_name}"

    echo "$2" | while read repo; do
        echo "Process repo '${repo}' ..."
        git clone --quiet "${repo}"

        repo_dir=$(echo "${repo}" | sed 's/.*\/\(.*\)\.git/\1/')
        cd ${repo_dir}
        git bundle create --quiet "../${repo_dir}.bundle" --all
        cd ..
        rm -rf "./${repo_dir}"
    done

    total_bundles=$(ls *.bundle | wc -l)
    echo "Total ${service_name} bundles: ${total_bundles}"
    cd ..
}

GITHUB_TOKEN=
if [ ! -z "$GITHUB_TOKEN" ]; then
    repos=$(curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/repos?per_page=100 | grep ssh_url | cut -d ':' -f 2-3 | tr -d '",')

    process_service "github" "${repos}"
fi

BITBUCKET_TOKEN= # App password
BITBUCKET_USER=
if [ ! -z "$BITBUCKET_TOKEN" ] && [ ! -z "$BITBUCKET_USER" ]; then
    repos=$(curl -u "${BITBUCKET_USER}:${BITBUCKET_TOKEN}" "https://api.bitbucket.org/2.0/repositories/${BITBUCKET_USER}?pagelen=100" | grep -Eo "git@bitbucket.org:${BITBUCKET_USER}/[^\"]+")

    process_service "bitbucket" "${repos}"
fi

GITLAB_TOKEN=
GITLAB_GROUP=
if [ ! -z "$GITLAB_GROUP" ] && [ ! -z "$GITLAB_TOKEN" ]; then
    repos=$(curl -s --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" "https://gitlab.com/api/v4/groups/${GITLAB_GROUP}" | grep -Eo "git@gitlab.com:[^\"]+")

    process_service "gitlab" "${repos}"
fi

