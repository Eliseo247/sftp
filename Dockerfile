FROM alpine:latest

#Instalacion de packetes
RUN apk add --no-cache openssh-server openssh-sftp-server

#Agregar archivo de configuracion sshd
ADD files/sshd_config /etc/ssh/


# Debemos crear la claves ssh propias y agregarlas al contenedor, para que sean unicas y no se generen cada ves que se crea el contenedor
COPY files/* /etc/ssh/keys/ 
RUN chmod 600 /etc/ssh/keys/*


EXPOSE 22


# crear el archivo de aranque
ADD files/entrypoint.sh /
CMD ["/entrypoint.sh"]
