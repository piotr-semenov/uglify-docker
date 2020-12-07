FROM node:alpine as builder
LABEL stage=intermediate

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN echo "uglify-es uglifycss" |\
    xargs -n1 echo |\
    xargs -n1 -I{} npm install --only=production --unsafe-perm=true --allow-root -g {}@latest &&\
    npm cache clean --force

COPY ./dockerfile-commons/reduce_alpine.sh /tmp/reduce_alpine.sh
RUN sh /tmp/reduce_alpine.sh -v /target node\
                                        \
                                        /usr/local/lib/node_modules/uglify-es\
                                        /usr/local/lib/node_modules/uglifycss

COPY docker-entrypoint.sh /target/usr/local/bin/


FROM scratch

ARG vcsref
LABEL \
    stage=production \
    org.label-schema.name="tiny-uglify" \
    org.label-schema.description="Uglify your Javascript/CSS." \
    org.label-schema.url="https://hub.docker.com/r/semenovp/tiny-uglify/" \
    org.label-schema.vcs-ref="$vcsref" \
    org.label-schema.vcs-url="https://github.com/piotr-semenov/uglify-docker.git" \
    maintainer='Piotr Semenov <piotr.k.semenov@gmail.com>'

ENV PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/lib/node_modules/uglifycss:/usr/local/lib/node_modules/uglify-es/bin
COPY --from=builder /target /

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
