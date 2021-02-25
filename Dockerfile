FROM nginx
COPY ./ip-address.html /usr/share/nginx/html
CMD /usr/share/nginx/html/runfile.sh && nginx -g 'daemon off;'
