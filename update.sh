#!/bin/bash -eux

versions=(2.3.0 2.4.0 2.5.0 3.0.0 3.1.0)

for version in "${versions[@]}"
do
    major=$(echo $version | cut -d "." -f 1)
    minor=$(echo $version | cut -d "." -f 2)
    dir_name=review-${major}.${minor}
    rm -rf ${dir_name}
    mkdir ${dir_name}
    cat Dockerfile | sed "s/^ENV REVIEW_VERSION .*$/ENV REVIEW_VERSION ${version}/" > ${dir_name}/Dockerfile
    cp -r noto ${dir_name}
done
