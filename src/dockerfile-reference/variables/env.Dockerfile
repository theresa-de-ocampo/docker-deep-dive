FROM ubuntu

# No default value would crash
# ENV nickname

ENV destination=/alpha
ENV destination=/beta

# This is the legacy way of writing which would result in:
# 1 warning found (use docker --debug to expand):
# - LegacyKeyValueFormat: "ENV key=value" should be used instead of legacy "ENV key value" format
# ENV destination /charlie

# This resolve to COPY ./beta
COPY . ${destination}