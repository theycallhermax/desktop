FROM ghcr.io/theycallhermax/kinoblue:41

COPY build.sh /tmp/build.sh

RUN rm -rf dotfiles/.git && mkdir -p /usr/etc/skel
ADD dotfiles /usr/etc/skel

ADD overrides /usr/share/glib-2.0/schemas/
RUN glib-compile-schemas /usr/share/glib-2.0/schemas

RUN mkdir -p /var/lib/alternatives && \
	/tmp/build.sh && \
	ostree container commit
