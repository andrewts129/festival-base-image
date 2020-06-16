FROM debian:bullseye-slim

RUN apt-get update && apt-get -y install festival curl
RUN curl -s "http://festvox.org/packed/festival/2.4/voices/festvox_cmu_us_awb_cg.tar.gz" | tar xvz -C . \
    && mv festival/lib/voices/us/* /usr/share/festival/voices/english/ \
    && echo "(set! voice_default 'voice_cmu_us_awb_cg)" >> /etc/festival.scm

COPY speak.sh /usr/local/bin/speak

ENTRYPOINT [ "speak" ]
CMD [ "Hello World" ]
