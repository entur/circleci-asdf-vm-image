# Base on official circle ci base image
FROM cimg/base:stable

#ARG X=${...} is a workaround for https://github.com/RedCoolBeans/dockerlint/issues/52
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels:
LABEL maintainer="The Platform Team at Entur"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="entur/circleci-asdf-vm"
LABEL org.label-schema.description="Image containting asdf. For use with Circle CI."
LABEL org.label-schema.url="https://entur.no/"
LABEL org.label-schema.vcs-url="https://github.com/entur/circleci-asdf-vm-image"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Entur"
LABEL org.label-schema.version=$BUILD_VERSION

USER circleci

# Install asdf-vm
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
ENV PATH="/home/circleci/.asdf/bin:/home/circleci/.asdf/shims:$PATH"
