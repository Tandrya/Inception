FROM	alpine:3.17
RUN		apk update
RUN		apk add --no-cache --update nginx
RUN		apk add --no-cache --update openssl
RUN		mkdir -p /etc/nginx/ssl

# Instead of generate a new cert after each build
# RUN 	openssl req -x509 -nodes \
# 		-out /etc/nginx/ssl/mlaval.42.fr.crt \	
# 		-keyout /etc/nginx/ssl/mlaval.42.fr.key \
# 		-subj "/C=FR/ST=76600/L=LeHavre/O=42/OU=42/CN=mlaval.42.fr/UID=mlaval"

COPY	./config/ssl/mlaval.42.fr.crt /etc/nginx/ssl/mlaval.42.fr.crt
COPY	./config/ssl/mlaval.42.fr.key /etc/nginx/ssl/mlaval.42.fr.key
RUN 	mkdir -p /var/run/nginx
COPY	config/nginx.conf /etc/nginx/http.d/default.conf
EXPOSE	443
CMD	[ "nginx", "-g", "daemon off;" ]