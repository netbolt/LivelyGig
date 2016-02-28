#=========================================================
# Dockerfile to build a Synereo node image.
# Using LivelyGig's JAR files.
# image size 232 MB
#=========================================================

# Set the base image
FROM alpine:3.3

MAINTAINER Nodes <masternodes@yahoo.com>

#============== Set versions and paths ===================
ENV SYNEREO_JAR splicious
#ENV SYNEREO_TAR_PATH https://xyz    Synereo's Repo
#================ BEGIN INSTALLATION =====================

# Install OpenJDK 7
#java version "1.7.0_91"
#OpenJDK Runtime Environment (IcedTea 2.6.3) (Alpine 7.91.2.6.3-r1)
#OpenJDK 64-Bit Server VM (build 24.91-b01, mixed mode)



RUN apk --update add openjdk7-jre

# Copy splicious from server to container
# In the future we'll pull it from Synereo's Repo

COPY $SYNEREO_JAR /splicious
RUN chmod u+x /splicious/spliciousrun.sh
# RUN rm $SYNEREO_JAR
