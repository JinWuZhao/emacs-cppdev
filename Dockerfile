FROM jinwuzhao/emacs:latest

ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    TIMEZONE=Asia/Shanghai

WORKDIR /root

VOLUME /root/Documents

COPY ./install.sh .

RUN chmod +x ./install.sh
RUN ./install.sh
RUN rm ./install.sh

COPY ./.spacemacs .

ENTRYPOINT ["launch.sh"]
